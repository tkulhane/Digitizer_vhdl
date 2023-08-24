library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Communication_TX_Arbiter2 is
    port
    (
        Clock : in std_logic;                                           --system clock
        Reset_N : in std_logic;                                         --system reset
        
        -- fifo from controler
        Control_Fifo_Data : in std_logic_vector(39 downto 0);
        Control_Fifo_Empty : in std_logic;
        Control_Fifo_RE : out std_logic;
        
        --measurement data interface
        MD_Fifo_Data : in std_logic_vector(31 downto 0);             
        MD_Fifo_Empty : in std_logic;                              
        MD_Fifo_RE : out std_logic;

        --tx communication fifo
        TX_Fifo_Full : in std_logic;
        TX_Fifo_WE : out std_logic;
        TX_Fifo_Data : out std_logic_vector(39 downto 0)        

    );
end Communication_TX_Arbiter2;


architecture rtl of Communication_TX_Arbiter2 is


    type FSM_state is (IDLE, WAIT_CMD_DATA, READ_CMD_DATA, WAIT_MD_DATA, READ_MD_DATA, SWITCH_TO_CMD);
    signal state_reg, next_state : FSM_state;

begin

------------------------------------------------------------------------------------------------------------
--signal routing
------------------------------------------------------------------------------------------------------------   



------------------------------------------------------------------------------------------------------------
--fifo read fsm
------------------------------------------------------------------------------------------------------------
    --state memmory
    process(Reset_N,Clock)
    begin

        if(Reset_N = '0') then
            state_reg <= IDLE;
        
        elsif(Clock'event and Clock = '1') then
            state_reg <= next_state;

        end if;
    end process;

    --translation function
    process(next_state, state_reg, TX_Fifo_Full, Control_Fifo_Empty, MD_Fifo_Empty)
    begin

        next_state <= state_reg;

        case state_reg is
        
            when IDLE =>
                if(TX_Fifo_Full = '1') then
                    next_state <= IDLE;

                elsif(Control_Fifo_Empty = '0') then
                    next_state <= WAIT_CMD_DATA; 

                elsif(MD_Fifo_Empty = '0') then
                    next_state <= WAIT_MD_DATA; 

                end if;

            when WAIT_CMD_DATA =>
                next_state <= READ_CMD_DATA;

            when READ_CMD_DATA =>
                if(Control_Fifo_Empty = '1' or TX_Fifo_Full = '1') then
                    next_state <= IDLE;  
                end if;

            when WAIT_MD_DATA =>
                next_state <= READ_MD_DATA;  

            when READ_MD_DATA =>
                if(MD_Fifo_Empty = '1' or TX_Fifo_Full = '1') then
                    next_state <= IDLE;  
                elsif(Control_Fifo_Empty = '0') then 
                    next_state <= SWITCH_TO_CMD;
                end if;

            when SWITCH_TO_CMD =>
                next_state <= WAIT_CMD_DATA;  
                

            when others =>
                null; 

        end case;
    end process;

    --output function
    process(state_reg, Control_Fifo_Data, MD_Fifo_Data)
    begin

        case state_reg is
        
            when IDLE =>
                Control_Fifo_RE <= '0';
                MD_Fifo_RE      <= '0';
                TX_Fifo_WE      <= '0';
                TX_Fifo_Data <= (others => '0');

            when WAIT_CMD_DATA => 
                Control_Fifo_RE <= '1';
                MD_Fifo_RE      <= '0';
                TX_Fifo_WE      <= '0';
                TX_Fifo_Data <= Control_Fifo_Data;

            when READ_CMD_DATA => 
                Control_Fifo_RE <= '0';
                MD_Fifo_RE      <= '0';
                TX_Fifo_WE      <= '1';
                TX_Fifo_Data <= Control_Fifo_Data;

            when WAIT_MD_DATA=>
                Control_Fifo_RE <= '0';
                MD_Fifo_RE      <= '1';
                TX_Fifo_WE      <= '0';
                TX_Fifo_Data    <= x"00" & MD_Fifo_Data;

            when READ_MD_DATA =>
                Control_Fifo_RE <= '0';
                MD_Fifo_RE      <= '1';
                TX_Fifo_WE      <= '1';
                TX_Fifo_Data    <= x"00" & MD_Fifo_Data;

            when SWITCH_TO_CMD => 
                Control_Fifo_RE <= '0';
                MD_Fifo_RE      <= '0';
                TX_Fifo_WE      <= '1';
                TX_Fifo_Data <= x"00" & MD_Fifo_Data;

            when others =>
                Control_Fifo_RE <= '0';
                MD_Fifo_RE      <= '0';
                TX_Fifo_WE      <= '0';
                TX_Fifo_Data <= (others => '0');

        end case;

    end process;





end rtl;