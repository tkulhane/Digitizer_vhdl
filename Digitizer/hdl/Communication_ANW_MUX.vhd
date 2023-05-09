library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Communication_ANW_MUX is
    port
    (
        Clock : in std_logic;                                           --system clock
        Reset_N : in std_logic;                                         --system reset

        --detination 1 fifo interface
        DEST_1_Fifo_Write_Data : out std_logic_vector(39 downto 0);             
        DEST_1_Fifo_Write_Enable : out std_logic;                              
        DEST_1_Fifo_Full : in std_logic;                                     

        --detination 2 fifo interface
        DEST_2_Fifo_Write_Data : out std_logic_vector(39 downto 0);              
        DEST_2_Fifo_Write_Enable : out std_logic;                               
        DEST_2_Fifo_Full : in std_logic;                                     

        --detination 3 fifo interface
        DEST_3_Fifo_Write_Data : out std_logic_vector(39 downto 0);             
        DEST_3_Fifo_Write_Enable : out std_logic;                              
        DEST_3_Fifo_Full : in std_logic;                                   

        --source fifo interface
        ANW_Fifo_Read_Data : in std_logic_vector(39 downto 0);              
        ANW_Fifo_Read_Enable : out std_logic;                              
        ANW_Fifo_Empty : in std_logic;

        Diag_Valid : out std_logic

    );
end Communication_ANW_MUX;


architecture rtl of Communication_ANW_MUX is

    type FSM_state is (IDLE, DATA_READ, WAIT_FOR_FIFO, DATA_WRITE);--READ_WAIT
    signal state_reg, next_state : FSM_state;

    signal Communication_vote_vector : std_logic_vector(2 downto 0);
    signal Fifo_Write_Enable : std_logic;
    signal Fifo_Full :std_logic;

    signal Communication_destination : std_logic_vector(3 downto 0);


begin

------------------------------------------------------------------------------------------------------------
--signal routing
------------------------------------------------------------------------------------------------------------
    Communication_destination <= ANW_Fifo_Read_Data(35 downto 32);

    DEST_1_Fifo_Write_Data <= ANW_Fifo_Read_Data;
    DEST_2_Fifo_Write_Data <= ANW_Fifo_Read_Data;
    DEST_3_Fifo_Write_Data <= ANW_Fifo_Read_Data;

------------------------------------------------------------------------------------------------------------
--FSM read ride
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
    process(next_state, state_reg, ANW_Fifo_Empty,Fifo_Full)
    begin

        next_state <= state_reg;

        case state_reg is
        
            when IDLE =>
                if(ANW_Fifo_Empty = '0') then
                    next_state <= DATA_READ;
                end if;

            when DATA_READ =>
                next_state <= WAIT_FOR_FIFO;
                
            when WAIT_FOR_FIFO =>
                if(Fifo_Full = '0') then
                    next_state <= DATA_WRITE;
                end if; 

            when DATA_WRITE =>
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
                ANW_Fifo_Read_Enable    <= '0';
                Fifo_Write_Enable       <= '0';
                Diag_Valid              <= '0';
            
            when DATA_READ =>
                ANW_Fifo_Read_Enable    <= '1';
                Fifo_Write_Enable       <= '0';
                Diag_Valid              <= '1';

            when WAIT_FOR_FIFO =>
                ANW_Fifo_Read_Enable    <= '0';
                Fifo_Write_Enable       <= '0';
                Diag_Valid              <= '1';            

            when DATA_WRITE =>
                ANW_Fifo_Read_Enable    <= '0';
                Fifo_Write_Enable       <= '1';
                Diag_Valid              <= '1';   

        end case;

    end process;

------------------------------------------------------------------------------------------------------------
--communication decoder
------------------------------------------------------------------------------------------------------------
    process(Reset_N,Clock)

    begin

        if(Reset_N = '0') then
            Communication_vote_vector <= "000";

        elsif(Clock'event and clock = '1') then
            
            case Communication_destination is

                when "0001" =>
                    Communication_vote_vector <= "001";

                when "0010" =>
                    Communication_vote_vector <= "010";

                when "0011" =>
                    Communication_vote_vector <= "100";

                when others =>
                    Communication_vote_vector <= "000";

            end case;

        end if;

    end process;


------------------------------------------------------------------------------------------------------------
--dest mux full
------------------------------------------------------------------------------------------------------------
    process(Communication_vote_vector,DEST_1_Fifo_Full,DEST_2_Fifo_Full,DEST_3_Fifo_Full)

    begin

        case Communication_vote_vector is
            
            when "001" =>
               Fifo_Full <= DEST_1_Fifo_Full;

            when "010" =>
               Fifo_Full <= DEST_2_Fifo_Full;

            when "100" =>
               Fifo_Full <= DEST_3_Fifo_Full;

            when others =>
                Fifo_Full <= '0';

            end case;

    end process;

------------------------------------------------------------------------------------------------------------
--dest fifo write enable DEMUX
------------------------------------------------------------------------------------------------------------
    process(Communication_vote_vector,Fifo_Write_Enable)

    begin

        case Communication_vote_vector is
            
            when "001" =>
                DEST_1_Fifo_Write_Enable <= Fifo_Write_Enable;
                DEST_2_Fifo_Write_Enable <= '0';
                DEST_3_Fifo_Write_Enable <= '0';

            when "010" =>
                DEST_1_Fifo_Write_Enable <= '0';
                DEST_2_Fifo_Write_Enable <= Fifo_Write_Enable;
                DEST_3_Fifo_Write_Enable <= '0';

            when "100" =>
                DEST_1_Fifo_Write_Enable <= '0';
                DEST_2_Fifo_Write_Enable <= '0';
                DEST_3_Fifo_Write_Enable <= Fifo_Write_Enable;        
    
            when others =>
                DEST_1_Fifo_Write_Enable <= '0';
                DEST_2_Fifo_Write_Enable <= '0';
                DEST_3_Fifo_Write_Enable <= '0';
                
            end case;

    end process;



end rtl;