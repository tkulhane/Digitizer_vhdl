library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Communication_Switch is
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
        
        --communication builder and fifo
        Builder_Enable : out std_logic;
        DataFifo_Empty : in std_logic;
        DafaFifo_Data : in std_logic_vector(31 downto 0);
        DataFifo_RD : out std_logic;

        --detination 1 fifo interface
        DEST_1_Fifo_Data : out std_logic_vector(31 downto 0);             
        DEST_1_Fifo_Empty : out std_logic;                              
        DEST_1_Fifo_Read : in std_logic;                                     

        --detination 2 fifo interface
        DEST_2_Fifo_Data : out std_logic_vector(31 downto 0);             
        DEST_2_Fifo_Empty : out std_logic;                              
        DEST_2_Fifo_Read : in std_logic;                                     

        --detination 3 fifo interface
        DEST_3_Fifo_Data : out std_logic_vector(31 downto 0);             
        DEST_3_Fifo_Empty : out std_logic;                              
        DEST_3_Fifo_Read : in std_logic  

    );
end Communication_Switch;


architecture rtl of Communication_Switch is


    constant CMD_COMSW_DATA_DESTINATION             : std_logic_vector(7 downto 0) := x"11";
    constant CMD_COMSW_DATA_DESTINATION_CMD_SOURCE  : std_logic_vector(7 downto 0) := x"12";
    constant CMD_COMSW_CMD_COM_SOURCE               : std_logic_vector(7 downto 0) := x"31";

    type FSM_state is (IDLE, WAIT_STATE_1, PREPARATION, READ_DATA, WRITE_DATA, WAIT_STATE_2);
    signal state_reg, next_state : FSM_state;

    signal write_signal : std_logic;
    signal read_signal : std_logic;
    signal address : std_logic_vector(7 downto 0);

    signal Communication_vote_vector : std_logic_vector(2 downto 0);
    signal Data_Valid : std_logic;

begin


------------------------------------------------------------------------------------------------------------
--signal routing
------------------------------------------------------------------------------------------------------------   
    address <= addr_frame;


    DEST_1_Fifo_Data <= DafaFifo_Data;
    DEST_2_Fifo_Data <= DafaFifo_Data;
    DEST_3_Fifo_Data <= DafaFifo_Data;

    --DEST_1_Fifo_Empty <= DataFifo_Empty;
    --DEST_2_Fifo_Empty <= '1';

    --DEST_1_Fifo_Empty <= (not DataFifo_Empty) and Communication_vote_vector(0);
    --DEST_2_Fifo_Empty <= (not DataFifo_Empty) and Communication_vote_vector(1);
    --DEST_3_Fifo_Empty <= (not DataFifo_Empty) and Communication_vote_vector(2);




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
            Communication_vote_vector <= (others => '0');


        elsif(Clock'event and Clock = '1') then    
            

            if(write_signal = '1') then
                
                case address is

                    when CMD_COMSW_DATA_DESTINATION =>
                        Communication_vote_vector <= write_data_frame(2 downto 0);

                    when others =>
                        null;

                end case;
                


            elsif(read_signal = '1') then

                case address is

                    when CMD_COMSW_DATA_DESTINATION =>
                        read_data_frame <=  x"000" & '0' & Communication_vote_vector;

                    when CMD_COMSW_CMD_COM_SOURCE =>
                        read_data_frame <= x"ABCD";

                    when others =>
                        read_data_frame <= (others => '0');

                end case;
                
                
                
                
            end if;


        end if;

    end process;






------------------------------------------------------------------------------------------------------------
--dest mux empty
------------------------------------------------------------------------------------------------------------
    process(Communication_vote_vector, DataFifo_Empty)

    begin

        case Communication_vote_vector is
            
            when "001" =>
                DEST_1_Fifo_Empty <= DataFifo_Empty;
                DEST_2_Fifo_Empty <= '1';
                DEST_3_Fifo_Empty <= '1';

            when "010" =>
                DEST_1_Fifo_Empty <= '1';
                DEST_2_Fifo_Empty <= DataFifo_Empty;
                DEST_3_Fifo_Empty <= '1';

            when "100" =>
                DEST_1_Fifo_Empty <= '1';
                DEST_2_Fifo_Empty <= '1';
                DEST_3_Fifo_Empty <= DataFifo_Empty;

            when others =>
                DEST_1_Fifo_Empty <= '1'; 
                DEST_2_Fifo_Empty <= '1';
                DEST_3_Fifo_Empty <= '1';

            end case;

    end process;


------------------------------------------------------------------------------------------------------------
--dest mux read
------------------------------------------------------------------------------------------------------------
    process(Communication_vote_vector, DEST_1_Fifo_Read, DEST_2_Fifo_Read, DEST_3_Fifo_Read)

    begin

        case Communication_vote_vector is
            
            when "001" =>
               DataFifo_RD <= DEST_1_Fifo_Read;

            when "010" =>
               DataFifo_RD <= DEST_2_Fifo_Read;

            when "100" =>
               DataFifo_RD <= DEST_3_Fifo_Read;

            when others =>
                DataFifo_RD <= '0';

            end case;

    end process;



------------------------------------------------------------------------------------------------------------
--communication builder enable
------------------------------------------------------------------------------------------------------------    

    process(Reset_N,Clock)
    begin

        if(Reset_N = '0') then
            Builder_Enable <= '0';
        
        elsif(Clock'event and Clock = '1') then
            
            case Communication_vote_vector is
            
            when "001" =>
                Builder_Enable <= '1';

            when "010" =>
                Builder_Enable <= '1';

            when "100" =>
                Builder_Enable <= '1';
    
            when others =>
                Builder_Enable <= '0';
                
            end case; 

        end if;
    end process;



end rtl;