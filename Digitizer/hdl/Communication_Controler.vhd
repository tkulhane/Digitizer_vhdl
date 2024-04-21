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

    constant ACTIVITY_MSG_TIME     : natural := 125000000;

    constant CMD_COMSW_DUMMY                        : std_logic_vector(7 downto 0) := x"01";
    constant CMD_COMSW_DATA_DESTINATION             : std_logic_vector(7 downto 0) := x"11";
    constant CMD_COMSW_DATA_DESTINATION_CMD_SOURCE  : std_logic_vector(7 downto 0) := x"12";
    constant CMD_COMSW_CMD_COM_SOURCE               : std_logic_vector(7 downto 0) := x"31";
    constant CMD_COMSW_ACTIVITY_MSG                 : std_logic_vector(7 downto 0) := x"A1";
    constant CMD_COMSW_CONNECTED_COM                : std_logic_vector(7 downto 0) := x"A5";


    constant NUM_OF_COMMS : natural := 7;
    
    

    type FSM_state is (IDLE, WAIT_STATE_1, PREPARATION, READ_DATA, WRITE_DATA, WAIT_STATE_2);
    signal state_reg, next_state : FSM_state;

    signal write_signal : std_logic;
    signal read_signal : std_logic;
    signal address : std_logic_vector(7 downto 0);

    signal comm_number_INT : integer range 0 to NUM_OF_COMMS;
    signal Communication_Vote_Number : integer range 0 to NUM_OF_COMMS;
    signal Communication_vote_vector : std_logic_vector(2 downto 0);


    type type_ActivityCounterUnsigned_array is array(0 to (NUM_OF_COMMS - 1)) of unsigned(31 downto 0);
    signal ActivityCounter : type_ActivityCounterUnsigned_array;
    
    signal ActivityMSG : std_logic_vector(NUM_OF_COMMS - 1 downto 0);
    signal ActivityConnection : std_logic_vector(NUM_OF_COMMS - 1 downto 0);
    signal ActivityConnection_CLR : std_logic_vector(NUM_OF_COMMS - 1 downto 0);
    
    signal Data_Valid : std_logic;

begin


------------------------------------------------------------------------------------------------------------
--signal routing
------------------------------------------------------------------------------------------------------------   
    address <= addr_frame;

    Cummunication_Switch_Vote_Vector <= Communication_vote_vector;

    comm_number_INT <= to_integer(unsigned(comm_number(2 downto 0))); 


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
            
            --read_data_frame <= (others => '0');
            ActivityMSG <= (others => '0');

            if(write_signal = '1') then
                
                case address is

                    when CMD_COMSW_DATA_DESTINATION =>
                        --Communication_vote_vector <= write_data_frame(2 downto 0);
                        Communication_Vote_Number <= to_integer(unsigned(write_data_frame(2 downto 0)));

                    when CMD_COMSW_DATA_DESTINATION_CMD_SOURCE => 
                        Communication_Vote_Number <= to_integer(unsigned(comm_number(2 downto 0))); 

                    when CMD_COMSW_ACTIVITY_MSG =>
                        
                        --ActivityMSG <= (others => '1'); 

                        --xxx : for i in 0 to (NUM_OF_COMMS - 1) loop
                        --    ActivityMSG(i) <= '1';
                        --end loop xxx;

                        if(comm_number_INT > 0) then
                           ActivityMSG(comm_number_INT - 1) <= '1';
                        end if;

                    when others =>
                        null;

                end case;
                


            elsif(read_signal = '1') then

                read_data_frame <= (others => '0');

                case address is

                    when CMD_COMSW_DUMMY => 
                        read_data_frame <= x"ABCD";

                    when CMD_COMSW_DATA_DESTINATION =>
                        read_data_frame <=  x"000" & '0' & std_logic_vector(to_unsigned(Communication_Vote_Number, 3));

                    when CMD_COMSW_CMD_COM_SOURCE =>
                        read_data_frame <= x"000" & comm_number;
                        
                    when CMD_COMSW_ACTIVITY_MSG =>
                        read_data_frame <= write_data_frame;

                        --ActivityMSG <= (others => '1');                      

                        if(comm_number_INT > 0) then
                            ActivityMSG(comm_number_INT - 1) <= '1';
                        end if;

                    when CMD_COMSW_CONNECTED_COM =>
                        
                        CMD_COMSW_CONNECTED_COM_For : for i in 0 to (NUM_OF_COMMS - 1) loop
                            read_data_frame(i) <= ActivityConnection(i);
                        end loop CMD_COMSW_CONNECTED_COM_For;

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



------------------------------------------------------------------------------------------------------------
--communication activity control
------------------------------------------------------------------------------------------------------------
    process(Reset_N, Clock)

    begin
    
        

            if(Reset_N = '0') then 
                ActivityResetFor : for i in 0 to (NUM_OF_COMMS - 1) loop
                    --ActivityCounter(i) <= (others => '0');
                    ActivityConnection(i) <= '0';
                end loop ActivityResetFor;


            elsif(Clock'event and Clock = '1') then    

                ActivityMSGFor : for i in 0 to (NUM_OF_COMMS - 1) loop

                    if(ActivityMSG(i) = '1') then      
                        --ActivityCounter(i) <= (others => '0');
                        ActivityConnection(i) <= '1';

                    elsif(ActivityConnection_CLR(i) = '1') then
                        ActivityConnection(i) <= '0';

                    end if;

                end loop ActivityMSGFor;





            end if;

        

    end process;


------------------------------------------------------------------------------------------------------------
--communication activity timer
------------------------------------------------------------------------------------------------------------
    process(Reset_N, Clock)

    begin
    
            if(Reset_N = '0') then 
                ActivityResetTimerFor : for i in 0 to (NUM_OF_COMMS - 1) loop
                    ActivityCounter(i) <= (others => '0');
                    ActivityConnection_CLR(i) <= '0';
                end loop ActivityResetTimerFor;


            elsif(Clock'event and Clock = '1') then    

                ActivityConnectionTimerFor : for i in 0 to (NUM_OF_COMMS - 1) loop

                    if(ActivityConnection(i) = '1') then
                    
                        ActivityCounter(i) <= ActivityCounter(i) + 1;
                    
                        if(ActivityCounter(i) >= ACTIVITY_MSG_TIME) then 
                            ActivityConnection_CLR(i) <= '1';

                        end if;

                    elsif(ActivityConnection(i) = '0') then
                        ActivityConnection_CLR(i) <= '0';
                        ActivityCounter(i) <= (others => '0');

                    end if;

                end loop ActivityConnectionTimerFor;

            end if;

        
    end process;




end rtl;