library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Communication_Controler is
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
        comm_number : in std_logic_vector(3 downto 0);
        
        Cummunication_Switch_Vote_Vector : out std_logic_vector(2 downto 0)

    );
end Communication_Controler;


architecture rtl of Communication_Controler is


    constant CMD_COMSW_DATA_DESTINATION             : std_logic_vector(7 downto 0) := x"11";
    constant CMD_COMSW_DATA_DESTINATION_CMD_SOURCE  : std_logic_vector(7 downto 0) := x"12";
    constant CMD_COMSW_CMD_COM_SOURCE               : std_logic_vector(7 downto 0) := x"31";
    constant CMD_COMSW_ACTIVITY_MSG                 : std_logic_vector(7 downto 0) := x"A1";
    constant CMD_COMSW_CONNECTED_COM                : std_logic_vector(7 downto 0) := x"A5";
    
    

    type FSM_state is (IDLE, WAIT_STATE_1, PREPARATION, READ_DATA, WRITE_DATA, WAIT_STATE_2);
    signal state_reg, next_state : FSM_state;

    signal write_signal : std_logic;
    signal read_signal : std_logic;
    signal address : std_logic_vector(7 downto 0);

    signal Communication_Vote_Number : integer range 0 to 3;
    signal Communication_vote_vector : std_logic_vector(2 downto 0);
    
    signal Data_Valid : std_logic;

begin


------------------------------------------------------------------------------------------------------------
--signal routing
------------------------------------------------------------------------------------------------------------   
    address <= addr_frame;

    Cummunication_Switch_Vote_Vector <= Communication_vote_vector;



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
--reads and write registers
------------------------------------------------------------------------------------------------------------

    process(Reset_N, Clock)

    begin
    
        if(Reset_N = '0') then 
            read_data_frame <= (others => '0');
            --Communication_vote_vector <= (others => '0');
            Communication_Vote_Number <= 0;

        elsif(Clock'event and Clock = '1') then    
            

            if(write_signal = '1') then
                
                case address is

                    when CMD_COMSW_DATA_DESTINATION =>
                        --Communication_vote_vector <= write_data_frame(2 downto 0);
                        Communication_Vote_Number <= to_integer(unsigned(write_data_frame(2 downto 0)));

                    when others =>
                        null;

                end case;
                


            elsif(read_signal = '1') then

                case address is

                    when CMD_COMSW_DATA_DESTINATION =>
                        read_data_frame <=  x"000" & '0' & std_logic_vector(to_unsigned(Communication_Vote_Number, 3));

                    when CMD_COMSW_CMD_COM_SOURCE =>
                        read_data_frame <= x"000" & comm_number;
                        
                    when CMD_COMSW_ACTIVITY_MSG =>
                        read_data_frame <= write_data_frame;

                    when others =>
                        read_data_frame <= (others => '0');

                end case;
                
                
                
                
            end if;


        end if;

    end process;






------------------------------------------------------------------------------------------------------------
--Communication vote decoder
------------------------------------------------------------------------------------------------------------
    process(Communication_Vote_Number)

    begin

        case Communication_Vote_Number is
            
            when 1 =>
                Communication_vote_vector <= "001";

            when 2 =>
                Communication_vote_vector <= "010";

            when 3 =>
                Communication_vote_vector <= "100";

            when others =>
                Communication_vote_vector <= "000";

            end case;

    end process;





end rtl;