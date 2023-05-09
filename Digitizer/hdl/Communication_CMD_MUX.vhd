library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Communication_CMD_MUX is
    port
    (
        Clock : in std_logic;                                           --system clock
        Reset_N : in std_logic;                                         --system reset

        --source 1 fifo interface
        SRC_1_Fifo_Read_Data : in std_logic_vector(39 downto 0);              --Command data from FIFO
        SRC_1_Fifo_Read_Enable : out std_logic;                               --Read from fifo
        SRC_1_Fifo_Empty : in std_logic;                                      --Fifo is empty

        --source 2 fifo interface
        SRC_2_Fifo_Read_Data : in std_logic_vector(39 downto 0);              --Command data from FIFO
        SRC_2_Fifo_Read_Enable : out std_logic;                               --Read from fifo
        SRC_2_Fifo_Empty : in std_logic;                                      --Fifo is empty

        --source 3 fifo interface
        SRC_3_Fifo_Read_Data : in std_logic_vector(39 downto 0);              --Command data from FIFO
        SRC_3_Fifo_Read_Enable : out std_logic;                               --Read from fifo
        SRC_3_Fifo_Empty : in std_logic;                                      --Fifo is empty

        --cmd fifo interface
        CMD_Fifo_Write_Data : out std_logic_vector(39 downto 0);              
        CMD_Fifo_Write_Enable : out std_logic;                              
        CMD_Fifo_Full : in std_logic;

        Diag_Valid : out std_logic

    );
end Communication_CMD_MUX;


architecture rtl of Communication_CMD_MUX is

    type FSM_state is (IDLE, DATA_READ, DATA_WRITE);
    signal state_reg, next_state : FSM_state;

    signal Communication_REQ : std_logic;
    signal Communication_vote_vector : std_logic_vector(2 downto 0);
    signal Fifo_Read_Enable : std_logic;


begin

------------------------------------------------------------------------------------------------------------
--signal routing
------------------------------------------------------------------------------------------------------------


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
    process(next_state, state_reg, Communication_REQ, CMD_Fifo_Full)
    begin

        next_state <= state_reg;

        case state_reg is
        
            when IDLE =>
                if(Communication_REQ = '1' and CMD_Fifo_Full = '0') then
                    next_state <= DATA_READ;
                end if;

            when DATA_READ =>
                next_state <= DATA_WRITE;

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
                CMD_Fifo_Write_Enable       <= '0';
                Fifo_Read_Enable            <= '0';
                Diag_Valid                  <= '0';
            
            when DATA_READ =>
                CMD_Fifo_Write_Enable       <= '0';
                Fifo_Read_Enable            <= '1';
                Diag_Valid                  <= '1';

            when DATA_WRITE =>
                CMD_Fifo_Write_Enable       <= '1';
                Fifo_Read_Enable            <= '0';
                Diag_Valid                  <= '1';            


        end case;

    end process;

------------------------------------------------------------------------------------------------------------
--communication priority voter
------------------------------------------------------------------------------------------------------------
    process(Reset_N,Clock)

    begin

        if(Reset_N = '0') then
            Communication_vote_vector <= "000";

        elsif(Clock'event and clock = '1') then
            
            Communication_REQ <= (not SRC_1_Fifo_Empty) OR (not SRC_2_Fifo_Empty) OR (not SRC_3_Fifo_Empty);

            if(SRC_1_Fifo_Empty = '0') then
                Communication_vote_vector <= "001";
            elsif(SRC_2_Fifo_Empty = '0') then
                Communication_vote_vector <= "010";
            elsif(SRC_3_Fifo_Empty = '0') then
                Communication_vote_vector <= "100";
            else
                Communication_vote_vector <= "000";
            end if;

        end if;

    end process;


------------------------------------------------------------------------------------------------------------
--src fifo data MUX
------------------------------------------------------------------------------------------------------------
    process(Communication_vote_vector,SRC_1_Fifo_Read_Data,SRC_2_Fifo_Read_Data,SRC_3_Fifo_Read_Data)

    begin

        case Communication_vote_vector is
            
            when "001" =>
               CMD_Fifo_Write_Data <= SRC_1_Fifo_Read_Data;

            when "010" =>
               CMD_Fifo_Write_Data <= SRC_2_Fifo_Read_Data;

            when "100" =>
               CMD_Fifo_Write_Data <= SRC_3_Fifo_Read_Data;

            when others =>
                CMD_Fifo_Write_Data <= (others => '0');

            end case;

    end process;

------------------------------------------------------------------------------------------------------------
--src fifo read enable DEMUX
------------------------------------------------------------------------------------------------------------
    process(Communication_vote_vector,Fifo_Read_Enable)

    begin

        case Communication_vote_vector is
            
            when "001" =>
                SRC_1_Fifo_Read_Enable <= Fifo_Read_Enable;
                SRC_2_Fifo_Read_Enable <= '0';
                SRC_3_Fifo_Read_Enable <= '0';

            when "010" =>
                SRC_1_Fifo_Read_Enable <= '0';
                SRC_2_Fifo_Read_Enable <= Fifo_Read_Enable;
                SRC_3_Fifo_Read_Enable <= '0';

            when "100" =>
                SRC_1_Fifo_Read_Enable <= '0';
                SRC_2_Fifo_Read_Enable <= '0';
                SRC_3_Fifo_Read_Enable <= Fifo_Read_Enable;            
    
            when others =>
                SRC_1_Fifo_Read_Enable <= '0';
                SRC_2_Fifo_Read_Enable <= '0';
                SRC_3_Fifo_Read_Enable <= '0';
                
            end case;

    end process;



end rtl;
