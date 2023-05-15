library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity Communication_TX_Arbiter is
    port
    (
        Clock : in std_logic;                                           --system clock
        Reset_N : in std_logic;                                         --system reset

        --controler
        Control_Fifo_Full : out std_logic;
        Control_Fifo_WE : in std_logic;
        Control_Fifo_Data : in std_logic_vector(39 downto 0);

        --communication interface
        Communication_Data_Frame : in std_logic_vector(31 downto 0);
        Communication_Data_Enable : in std_logic;
        Communication_Data_Full : out std_logic;
        Communication_Data_Req : in std_logic;

        --RX fifo
        TX_Fifo_Full : in std_logic;
        TX_Fifo_WE : out std_logic;
        TX_Fifo_Data : out std_logic_vector(39 downto 0)
        
    );
end Communication_TX_Arbiter;


architecture rtl of Communication_TX_Arbiter is


------------------------------------------------------------------------------------------------------------
--Signals Declaration
------------------------------------------------------------------------------------------------------------ 
    type FSM_state is   ( 
                            ANW_STATE,
                            SWITCH_STATE,
                            SWITCH_WAIT_STATE,
                            DATA_STATE
                        );
    signal state_reg, next_state : FSM_state;


    

begin

------------------------------------------------------------------------------------------------------------
--Signals Routing
------------------------------------------------------------------------------------------------------------   


------------------------------------------------------------------------------------------------------------
--FSM arbiter ride
------------------------------------------------------------------------------------------------------------
    --state memory and reset
    process(Reset_N,Clock)
    begin

        if(Reset_N = '0') then
            state_reg <= ANW_STATE;
        
        elsif(Clock'event and Clock = '1') then
            state_reg <= next_state;

        end if;
    end process;

    --translation function
    process(next_state, state_reg, Communication_Data_Req, Control_Fifo_WE)
    begin

        next_state <= state_reg;

        case state_reg is
        
            when ANW_STATE =>
                if(Communication_Data_Req = '1' and Control_Fifo_WE = '0') then
                    next_state <= SWITCH_STATE;
                end if;

            when SWITCH_STATE =>
                if(Control_Fifo_WE = '1') then
                    next_state <= ANW_STATE;
                else
                    next_state <= SWITCH_WAIT_STATE;    
                end if;
                

            when SWITCH_WAIT_STATE =>
                if(Control_Fifo_WE = '1') then
                    next_state <= ANW_STATE;
                else
                    next_state <= DATA_STATE;    
                end if;

            when DATA_STATE =>
                if(Communication_Data_Req = '0') then
                    next_state <= ANW_STATE; 
                end if;

            when others =>
                null; 

        end case;
    end process;

    --output function
    process(state_reg, Control_Fifo_WE, Control_Fifo_Data, TX_Fifo_Full,Communication_Data_Enable,Communication_Data_Frame)
    begin

        case state_reg is
        
            when ANW_STATE =>
                TX_Fifo_WE              <= Control_Fifo_WE;
                TX_Fifo_Data            <= Control_Fifo_Data;
                Control_Fifo_Full       <= TX_Fifo_Full;
                Communication_Data_Full <= '1';

            when SWITCH_STATE =>
                TX_Fifo_WE              <= Control_Fifo_WE;
                TX_Fifo_Data            <= Control_Fifo_Data;
                Control_Fifo_Full       <= '1';
                Communication_Data_Full <= '1';

            when SWITCH_WAIT_STATE =>
                TX_Fifo_WE              <= Control_Fifo_WE;
                TX_Fifo_Data            <= Control_Fifo_Data;
                Control_Fifo_Full       <= '1';
                Communication_Data_Full <= '1';

            when DATA_STATE =>
                TX_Fifo_WE              <= Communication_Data_Enable;
                TX_Fifo_Data            <= X"00" & Communication_Data_Frame;
                Control_Fifo_Full       <= '1';
                Communication_Data_Full <= TX_Fifo_Full;
                
            when others =>
                TX_Fifo_WE              <= '0';
                TX_Fifo_Data            <= (others => '0');
                Control_Fifo_Full       <= '1';
                Communication_Data_Full <= '1';

                

        end case;

    end process;





end rtl;