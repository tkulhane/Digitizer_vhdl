library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Clock_Controller is
    generic
    (
        g_NumberOfLanes : natural := 16
    );

    port 
    (
        Clock : in std_logic;
        Reset_N : in std_logic;

        busy : out std_logic;
        enable_cmd : in std_logic;
        write_read : in std_logic;
        addr_frame : in std_logic_vector(7 downto 0);
        write_data_frame : in std_logic_vector(15 downto 0);
        read_data_frame : out std_logic_vector(15 downto 0);

        SwitchEnable_Logic : out std_logic;
        SwitchSelect_Logic : out std_logic_vector(2 downto 0);
        
        SwitchEnable_Ref : out std_logic;
        SwitchSelect_Ref : out std_logic_vector(2 downto 0);

        PLLs_Lock : in std_logic_vector(1 downto 0)


    );
end Clock_Controller;



architecture rtl of Clock_Controller is

------------------------------------------------------------------------------------------------------------
--constant
------------------------------------------------------------------------------------------------------------ 
    
    
    constant CMD_CLOCK_PLLS_LOCK        : std_logic_vector(7 downto 0) := x"05";
    constant CMD_CLOCK_SELECT_LOGIC     : std_logic_vector(7 downto 0) := x"11";
    constant CMD_CLOCK_SELECT_REF       : std_logic_vector(7 downto 0) := x"12";
    constant CMD_CLOCK_XXX              : std_logic_vector(7 downto 0) := x"55";
 
 

------------------------------------------------------------------------------------------------------------
--Signals declaration
------------------------------------------------------------------------------------------------------------ 

    type FSM_state is (IDLE, WAIT_STATE_1, PREPARATION, READ_DATA, WRITE_DATA, WAIT_STATE_2);
    signal state_reg, next_state : FSM_state;

    signal write_signal : std_logic;
    signal read_signal : std_logic;

    signal integer_write_data : integer;
    signal address : std_logic_vector(7 downto 0);



    signal REG_SwitchSelect_Logic : std_logic_vector(2 downto 0);
    signal REG_SwitchSelect_Ref : std_logic_vector(2 downto 0);



------------------------------------------------------------------------------------------------------------
--Components
------------------------------------------------------------------------------------------------------------ 




begin

------------------------------------------------------------------------------------------------------------
--Signals routing
------------------------------------------------------------------------------------------------------------  

    address <= addr_frame; 


    SwitchSelect_Logic <= REG_SwitchSelect_Logic;
    SwitchSelect_Ref <= REG_SwitchSelect_Ref;



------------------------------------------------------------------------------------------------------------
--FSM CMD ride
------------------------------------------------------------------------------------------------------------
    --state memory and reset
    process(Reset_N,Clock)
    begin

        if(Reset_N = '0') then
            state_reg <= IDLE;
        
        elsif(Clock'event and Clock = '1') then
            state_reg <= next_state;

        end if;
    end process;


    --translation function
    process(next_state, state_reg, enable_cmd,write_read)
    begin

        next_state <= state_reg;

        case state_reg is
        
            when IDLE =>
                if(enable_cmd = '1') then
                    next_state <= WAIT_STATE_1;
                end if;
                
            when WAIT_STATE_1 =>
                next_state <= PREPARATION;

            when PREPARATION =>
                if(write_read = '1') then
                    next_state <= READ_DATA;
                else 
                    next_state <= WRITE_DATA;
                end if;

            when READ_DATA =>
                next_state <= WAIT_STATE_2;

            when WRITE_DATA =>
                next_state <= WAIT_STATE_2;
                
            when WAIT_STATE_2 =>
                next_state <= IDLE;

            when others =>
                null; 

        end case;
    end process;

    --output function
    process(state_reg)
    begin

        case state_reg is
        
            when IDLE =>
                busy            <= '0';
                write_signal    <= '0';
                read_signal     <= '0';
                
            when WAIT_STATE_1 =>
                busy            <= '1';
                write_signal    <= '0';
                read_signal     <= '0'; 

            when PREPARATION =>
                busy            <= '1';
                write_signal    <= '0';
                read_signal     <= '0';            

            when READ_DATA =>
                busy            <= '1';
                write_signal    <= '0';
                read_signal     <= '1';            

            when WRITE_DATA =>
                busy            <= '1';
                write_signal    <= '1';
                read_signal     <= '0';
    
            when WAIT_STATE_2 =>
                busy            <= '1';
                write_signal    <= '0';
                read_signal     <= '0';     

            when others =>
                busy            <= '0';
                write_signal    <= '0';
                read_signal     <= '0';

        end case;

    end process;



------------------------------------------------------------------------------------------------------------
--reads and write registers
------------------------------------------------------------------------------------------------------------
    process(Reset_N, Clock)

    begin
    
        if(Reset_N = '0') then 
            read_data_frame <= (others => '0');
            
            SwitchEnable_Logic <= '0';
            SwitchEnable_Ref <= '0';

            REG_SwitchSelect_Logic <= (others => '0');
            REG_SwitchSelect_Ref <= (others => '0');


        elsif(Clock'event and Clock = '1') then    
            
            SwitchEnable_Logic <= '0';
            SwitchEnable_Ref <= '0';


            --write from CMD
            if(write_signal = '1') then
                
                case(address) is


                    when CMD_CLOCK_SELECT_LOGIC =>
                        SwitchEnable_Logic <= '1';
                        REG_SwitchSelect_Logic <= write_data_frame(2 downto 0);

                    when CMD_CLOCK_SELECT_REF =>
                        SwitchEnable_Ref <= '1';
                        REG_SwitchSelect_Ref <= write_data_frame(2 downto 0);
                     
                    when others =>
                        null;

                end case;


            --read from CMD
            elsif(read_signal = '1') then
                
                read_data_frame <= (others => '0');


                case(address) is

                    when CMD_CLOCK_SELECT_LOGIC => 
                        read_data_frame(2 downto 0) <= REG_SwitchSelect_Logic;
                        
                    when CMD_CLOCK_SELECT_REF =>
                         read_data_frame(2 downto 0) <= REG_SwitchSelect_Ref; 

                    when CMD_CLOCK_PLLS_LOCK =>
                         read_data_frame(1 downto 0) <= PLLs_Lock; 

                    when CMD_CLOCK_XXX =>
                        read_data_frame <= X"ABCD";

                    when others =>
                        null;

                end case;



            end if;

        end if;

    end process;









end rtl;