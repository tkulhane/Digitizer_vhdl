library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity CtrlBus_HandShake is
    generic
    (
        g_WidthADDR : natural := 8;
        g_WidthDATA : Natural := 16
    );
    port
    (
        CTRL_Clock : in std_logic;
        CTRL_Reset_N : in std_logic;

        PRH_Clock : in std_logic;
        PRH_Reset_N : in std_logic;

        CTRL_busy : out std_logic;
        CTRL_enable_cmd : in std_logic;
        CTRL_write_read : in std_logic;
        CTRL_addr_frame : in std_logic_vector(g_WidthADDR - 1 downto 0);
        CTRL_write_data_frame : in std_logic_vector(g_WidthDATA - 1 downto 0);
        CTRL_read_data_frame : out std_logic_vector(g_WidthDATA - 1 downto 0);

        PRH_busy : in std_logic;
        PRH_enable_cmd : out std_logic;
        PRH_write_read : out std_logic;
        PRH_addr_frame : out std_logic_vector(g_WidthADDR - 1 downto 0);
        PRH_write_data_frame : out std_logic_vector(g_WidthDATA - 1 downto 0);
        PRH_read_data_frame : in std_logic_vector(g_WidthDATA - 1 downto 0);

        PRH_In_Reset : in std_logic

    );
end CtrlBus_HandShake;


architecture rtl of CtrlBus_HandShake is

------------------------------------------------------------------------------------------------------------
--Signals Declaration
------------------------------------------------------------------------------------------------------------  


    type FSM_state is (IDLE, STORE_W_DATA, WAIT_FOR_BUSY, PRH_PROCESS, STORE_R_DATA, PRH_IN_RESET_BUSY);
    signal state_reg, next_state : FSM_state;
    signal fsm_timer : unsigned(9 downto 0);

    signal PRH_busy_sync : std_logic;
    signal PRH_enable_cmd_fsm : std_logic;
    signal PRH_In_Reset_sync : std_logic;

    signal Enable_StoreDataW : std_logic;
    signal Enable_StoreDataR : std_logic;
    signal Enable_ResetDataR : std_logic;


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




------------------------------------------------------------------------------------------------------------
--Synchronizer instance for Enable
------------------------------------------------------------------------------------------------------------
	inst_Synchronizer_Enable: Synchronizer 
	port map
	(
		nRST => PRH_Reset_N,
		CLK => PRH_Clock,
		Data_In => PRH_enable_cmd_fsm,
		Data_Out => PRH_enable_cmd
	);

------------------------------------------------------------------------------------------------------------
--Synchronizer instance for Busy
------------------------------------------------------------------------------------------------------------
	inst_Synchronizer_Busy: Synchronizer 
	port map
	(
		nRST => CTRL_Reset_N,
		CLK => CTRL_Clock,
		Data_In => PRH_busy,
		Data_Out => PRH_busy_sync
	);

------------------------------------------------------------------------------------------------------------
--Synchronizer instance for Busy
------------------------------------------------------------------------------------------------------------
	inst_Synchronizer_PRH_Reset: Synchronizer 
	port map
	(
		nRST => PRH_In_Reset,
		CLK => CTRL_Clock,
		Data_In => '1',
		Data_Out => PRH_In_Reset_sync
	);


------------------------------------------------------------------------------------------------------------
--Store Data W
------------------------------------------------------------------------------------------------------------    
    process(CTRL_Reset_N, CTRL_Clock)
    begin

        if(CTRL_Reset_N = '0') then
            PRH_write_read <= '0';
            PRH_addr_frame <= (others => '0');
            PRH_write_data_frame <= (others => '0');       

        elsif(CTRL_Clock'event and CTRL_Clock = '1') then 

            if(Enable_StoreDataW = '1') then 
                PRH_write_read <= CTRL_write_read;
                PRH_addr_frame <= CTRL_addr_frame;
                PRH_write_data_frame <= CTRL_write_data_frame;

            end if;
        end if;       

    end process;


------------------------------------------------------------------------------------------------------------
--Store Data R
------------------------------------------------------------------------------------------------------------    
    process(CTRL_Reset_N, CTRL_Clock)
    begin

        if(CTRL_Reset_N = '0') then
            CTRL_read_data_frame <= (others => '0');        

        elsif(CTRL_Clock'event and CTRL_Clock = '1') then 

            if(Enable_StoreDataR = '1') then 
                CTRL_read_data_frame <= PRH_read_data_frame;

            elsif(Enable_ResetDataR = '1') then 
                CTRL_read_data_frame <= (others => '0');   

            end if;
        end if;       

    end process;





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
    process(CTRL_Reset_N, CTRL_Clock)
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
    process(next_state, state_reg, fsm_timer, CTRL_enable_cmd, PRH_busy_sync, PRH_In_Reset_sync)
    begin

        next_state <= state_reg;

        case state_reg is
        
            when IDLE =>
                if(CTRL_enable_cmd = '1' and PRH_In_Reset_sync = '1') then
                    next_state <= STORE_W_DATA;

                elsif(CTRL_enable_cmd = '1' and PRH_In_Reset_sync = '0') then
                    next_state <= PRH_IN_RESET_BUSY;
                end if;
                
            when STORE_W_DATA =>
                next_state <= WAIT_FOR_BUSY;

            when WAIT_FOR_BUSY =>
                if(PRH_busy_sync = '1') then
                    next_state <= PRH_PROCESS;
                end if;

            when PRH_PROCESS =>
                if(PRH_busy_sync = '0') then
                    next_state <= STORE_R_DATA;
                end if;

            when STORE_R_DATA =>
                next_state <= IDLE;

            when PRH_IN_RESET_BUSY=>
                if(fsm_timer >= 5 -1) then
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
                Enable_StoreDataW   <= '0';    
                Enable_StoreDataR   <= '0';
                PRH_enable_cmd_fsm  <= '0';
                CTRL_busy           <= '0';
                Enable_ResetDataR   <= '0';

            when STORE_W_DATA =>
                Enable_StoreDataW   <= '1';    
                Enable_StoreDataR   <= '0';
                PRH_enable_cmd_fsm  <= '1';
                CTRL_busy           <= '0';
                Enable_ResetDataR   <= '0';

            when WAIT_FOR_BUSY =>
                Enable_StoreDataW   <= '0';    
                Enable_StoreDataR   <= '0';
                PRH_enable_cmd_fsm  <= '1';
                CTRL_busy           <= '0';
                Enable_ResetDataR   <= '0';

            when PRH_PROCESS =>
                Enable_StoreDataW   <= '0';    
                Enable_StoreDataR   <= '0';
                PRH_enable_cmd_fsm  <= '0';
                CTRL_busy           <= '1';
                Enable_ResetDataR   <= '0';

            when STORE_R_DATA =>
                Enable_StoreDataW   <= '0';    
                Enable_StoreDataR   <= '1';
                PRH_enable_cmd_fsm  <= '0';
                CTRL_busy           <= '1';
                Enable_ResetDataR   <= '0';

            when PRH_IN_RESET_BUSY =>
                Enable_StoreDataW   <= '0';    
                Enable_StoreDataR   <= '0';
                PRH_enable_cmd_fsm  <= '0';
                CTRL_busy           <= '1';
                Enable_ResetDataR   <= '1';

            when others =>
                Enable_StoreDataW   <= '0';    
                Enable_StoreDataR   <= '0';
                PRH_enable_cmd_fsm  <= '0';
                CTRL_busy           <= '0';
                Enable_ResetDataR   <= '0';


        end case;

    end process;








end rtl;