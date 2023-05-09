library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity System_Controler is
    port
    (
        Clock : in std_logic;                                           --system clock
        Reset_N : in std_logic;                                         --system reset

        busy : out std_logic;
        enable_cmd : in std_logic;
        write_read : in std_logic;
        addr_frame : in std_logic_vector(7 downto 0);
        write_data_frame : in std_logic_vector(15 downto 0);
        read_data_frame : out std_logic_vector(15 downto 0);

        SYS_Main_Reset_N : out std_logic;
        
        Diag_Valid : out std_logic
    
    );
end System_Controler;


architecture rtl of System_Controler is

    constant CMD_SYS_Dummy_Constant     : std_logic_vector(7 downto 0) := x"01";
    constant CMD_SYS_Main_Reset         : std_logic_vector(7 downto 0) := x"55";

------------------------------------------------------------------------------------------------------------
--Signals Declaration
------------------------------------------------------------------------------------------------------------ 
    type FSM_state is (IDLE, WAIT_STATE_1, PREPARATION, READ_DATA, WRITE_DATA, WAIT_STATE_2);
    signal state_reg, next_state : FSM_state;

    signal write_signal : std_logic;
    signal read_signal : std_logic;

    signal internal_write_signal : std_logic;
    
    --signal address : integer;
    signal address : std_logic_vector(7 downto 0);

begin

    --address <= to_integer(unsigned(addr_frame(7 downto 0)));
    address <= addr_frame;

------------------------------------------------------------------------------------------------------------
--FSM memory ride
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
--Setting registers Read
------------------------------------------------------------------------------------------------------------
    process(Clock,Reset_N)
    begin

        if(Reset_N = '0') then
            read_data_frame <= (others => '0');


        elsif(Clock'event and Clock = '1') then    

            if(read_signal = '1') then

                case(address) is

                    when CMD_SYS_Dummy_Constant => 
                        read_data_frame <= X"ABCD";

                    when others =>
                        read_data_frame <= (others => '0');

                end case;

            end if;

        end if;

    end process;    

------------------------------------------------------------------------------------------------------------
--Setting registers write and internal back write
------------------------------------------------------------------------------------------------------------
    process(Clock,Reset_N)
    begin

        if(Reset_N = '0') then
            SYS_Main_Reset_N <= '1';
            
            internal_write_signal <= '0';


        elsif(Clock'event and Clock = '1') then 

            --internal write (backwrite)
            if(internal_write_signal = '1') then
                

            --write setting user
            elsif(write_signal = '1') then

                case(address) is

                    when CMD_SYS_Main_Reset => 
                        if(write_data_frame = X"ABCD") then
                            SYS_Main_Reset_N <= '0';
                        end if;

                    
                    when others =>
                        null;

                end case;

            end if;

        end if;

    end process;



end rtl;