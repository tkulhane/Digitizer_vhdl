library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Clock_Switch is
    port
    (
        CTRL_Clock : in std_logic;
        CTRL_Reset_N : in std_logic;

        ClockInputA : in std_logic;
        ClockInputB : in std_logic;
        ClockInputC : in std_logic;
        ClockInputD : in std_logic;
        ClockInputE : in std_logic;

        SwitchEnable : in std_logic;
        SwitchSelect : in std_logic_vector(2 downto 0);

        PLL_PWR_DOWN : out std_logic;
        PLL_Lock : in std_logic;
        Clock_From_PLL : in std_logic;
        Clock_To_PLL : out std_logic;

        Clock_OUT : out std_logic;
        Reset_N_OUT : out std_logic


    );
end Clock_Switch;


architecture rtl of Clock_Switch is

------------------------------------------------------------------------------------------------------------
--Signals Declaration
------------------------------------------------------------------------------------------------------------  


    type FSM_state is (IDLE, GO_TO_RESET, SWITCH_MUX, WAIT_IN_RESET_1, WAIT_FOR_PLL, WAIT_IN_RESET_2);
    signal state_reg, next_state : FSM_state;
    signal fsm_timer : unsigned(11 downto 0);

    signal Internal_Reset_N : std_logic;
    signal FSM_Reset_N : std_logic;
    signal FSM_PLL_PWR_DOWN : std_logic;
    signal MuxEnable : std_logic;
    signal MUX_select_Register : std_logic_vector(2 downto 0);

------------------------------------------------------------------------------------------------------------
--Components
------------------------------------------------------------------------------------------------------------
    component Synchronizer is
		generic
		(
			Num_FlipFlop : natural := 2
		);
		port
		(
			nRST : in std_logic; --asynchronous reset - low active
			CLK : in std_logic;
			Data_In : in std_logic;
			Data_Out : out std_logic
		);
	end component;  



begin

------------------------------------------------------------------------------------------------------------
--Signals Routing
------------------------------------------------------------------------------------------------------------

    Internal_Reset_N <= CTRL_Reset_N and PLL_Lock and FSM_Reset_N;
    PLL_PWR_DOWN <= CTRL_Reset_N and FSM_PLL_PWR_DOWN;

    Clock_OUT <= Clock_From_PLL;


------------------------------------------------------------------------------------------------------------
--Synchronizer reset out
------------------------------------------------------------------------------------------------------------
	inst_Synchronizer_Reset_Out: Synchronizer 
	port map
	(
		nRST => Internal_Reset_N,
		CLK => Clock_From_PLL,
		Data_In => '1',
		Data_Out => Reset_N_OUT
	);




------------------------------------------------------------------------------------------------------------
--FSM control 
------------------------------------------------------------------------------------------------------------
    --state memory and reset
    process(CTRL_Reset_N, CTRL_Clock)
    begin

        if(CTRL_Reset_N = '0') then
            state_reg <= IDLE;
        
        elsif(CTRL_Clock'event and CTRL_Clock = '1') then
            state_reg <= next_state;

        end if;
    end process;

    --fsm timer
    process(CTRL_Reset_N,CTRL_Clock)
    begin
    
        if(CTRL_Reset_N = '0') then
            fsm_timer <= (others => '0');
            
        elsif(CTRL_Clock'event and CTRL_Clock = '1') then
            if(state_reg /= next_state) then
                fsm_timer <= (others => '0');
            else
                fsm_timer <= fsm_timer + 1;
            end if;
    
        end if;
    end process;

    --translation function
    process(next_state, state_reg, fsm_timer, SwitchEnable, PLL_Lock)
    begin

        next_state <= state_reg;

        case state_reg is
        
            when IDLE =>
                if(SwitchEnable = '1') then
                    next_state <= GO_TO_RESET;
                end if;
                
            when GO_TO_RESET =>
                next_state <= SWITCH_MUX;

            when SWITCH_MUX =>
                if(fsm_timer >= 20 -1) then
                    next_state <= WAIT_IN_RESET_1;
                end if;

            when WAIT_IN_RESET_1 =>
                if(fsm_timer >= 20 -1) then
                    next_state <= WAIT_FOR_PLL;
                end if;

            when WAIT_FOR_PLL =>
                if(PLL_Lock = '1') then
                    next_state <= WAIT_IN_RESET_2;
                elsif(fsm_timer >= 1000  -1) then 
                    next_state <= IDLE; --ToDo: ulozit nejaky fault flag?
                end if;

            when WAIT_IN_RESET_2 =>
                if(fsm_timer >= 100 -1) then
                    next_state <= IDLE;
                end if;

            when others =>
                null; 

        end case;
    end process;

    --output function
    process(state_reg)
    begin

        case state_reg is
        
            when IDLE =>
                FSM_PLL_PWR_DOWN <= '1';
                FSM_Reset_N <= '1';
                MuxEnable <= '0';

            when GO_TO_RESET =>
                FSM_PLL_PWR_DOWN <= '0';
                FSM_Reset_N <= '0';
                MuxEnable <= '0';

            when SWITCH_MUX =>
                FSM_PLL_PWR_DOWN <= '0';
                FSM_Reset_N <= '0';
                MuxEnable <= '1';

            when WAIT_IN_RESET_1 =>
                FSM_PLL_PWR_DOWN <= '0';
                FSM_Reset_N <= '0';
                MuxEnable <= '0';

            when WAIT_FOR_PLL =>
                FSM_PLL_PWR_DOWN <= '1';
                FSM_Reset_N <= '0';
                MuxEnable <= '0';

            when WAIT_IN_RESET_2 =>
                FSM_PLL_PWR_DOWN <= '1';
                FSM_Reset_N <= '0';
                MuxEnable <= '0';

            when others =>
                FSM_PLL_PWR_DOWN <= '0';
                FSM_Reset_N <= '0';
                MuxEnable <= '0';



        end case;

    end process;




------------------------------------------------------------------------------------------------------------
--MUX setting register
------------------------------------------------------------------------------------------------------------ 
	process(CTRL_Reset_N,CTRL_Clock)
	
	begin
	
		if(CTRL_Reset_N = '0') then
            MUX_select_Register <= (others => '0');
		
		elsif(CTRL_Clock'event and CTRL_Clock = '1') then

            if(MuxEnable = '1') then
                MUX_select_Register <= SwitchSelect;


            end if;
				
		end if;			
	end process;

------------------------------------------------------------------------------------------------------------
--Clock setting MUX
------------------------------------------------------------------------------------------------------------ 
	process(MUX_select_Register,ClockInputA,ClockInputB,ClockInputC,ClockInputD,ClockInputE)
	begin
	
        case MUX_select_Register is

            when "000" =>
                Clock_To_PLL <= ClockInputA;

            when "001" =>
                Clock_To_PLL <= ClockInputB;

            when "010" =>
                Clock_To_PLL <= ClockInputC;

            when "011" =>
                Clock_To_PLL <= ClockInputD;

            when "100" =>
                Clock_To_PLL <= ClockInputE;

            when others =>
                Clock_To_PLL <= ClockInputA;

            end case;
	
	end process;








end rtl;