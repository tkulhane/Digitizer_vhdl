library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity TxMainLinkController is
  generic 
  (
    g_NumOfLanes : natural := 4
  );
  port 
  (
    Clock : in std_logic;
    Reset_N : in std_logic;
 
    SYNCINB : in std_logic;
    Lanes_DataGo : in std_logic_vector(g_NumOfLanes - 1 downto 0); 

    SYNC_OK : out std_logic; 
    Data_Read : out std_logic
 
  );
end TxMainLinkController;
 
architecture rtl of TxMainLinkController is

------------------------------------------------------------------------------------------------------------
--constant
------------------------------------------------------------------------------------------------------------ 
  
 
------------------------------------------------------------------------------------------------------------
--Signals declaration
------------------------------------------------------------------------------------------------------------ 

    type FSM_state is (WAIT_FOR_SYNC, WAIT_FOR_DATA, DATA_GO);
    signal state_reg, next_state : FSM_state;
    signal fsm_timer : unsigned(9 downto 0);

    signal And_Lanes_DataGo : std_logic;



------------------------------------------------------------------------------------------------------------
--Other Signals declaration
------------------------------------------------------------------------------------------------------------  


begin

------------------------------------------------------------------------------------------------------------
--Array Signals routing
------------------------------------------------------------------------------------------------------------  
  
------------------------------------------------------------------------------------------------------------
--Signals routing
------------------------------------------------------------------------------------------------------------  

------------------------------------------------------------------------------------------------------------
--FSM
------------------------------------------------------------------------------------------------------------
--state memory and reset
    process(Reset_N,Clock)
    begin

        if(Reset_N = '0') then
            state_reg <= WAIT_FOR_SYNC;
        
        elsif(Clock'event and Clock = '1') then
            state_reg <= next_state;

        end if;
    end process;

    --fsm timer
    process(Reset_N,Clock)
    begin
    
        if(Reset_N = '0') then
            fsm_timer <= (others => '0');
            
        elsif(Clock'event and Clock = '1') then
            if(state_reg /= next_state) then
                fsm_timer <= (others => '0');
            else
                fsm_timer <= fsm_timer + 1;
            end if;
    
        end if;
    end process;

    --translation function
    process(next_state, state_reg, fsm_timer, SYNCINB, And_Lanes_DataGo)
    begin

        next_state <= state_reg;

        case state_reg is
        
            when WAIT_FOR_SYNC =>
                if(SYNCINB = '1') then
                    next_state <= WAIT_FOR_DATA;    
                end if;

            when WAIT_FOR_DATA =>
                if(SYNCINB = '0') then
                    next_state <= WAIT_FOR_SYNC; 
                elsif (And_Lanes_DataGo = '1') then
                    next_state <= DATA_GO;   
                end if;

            when DATA_GO =>
                if(SYNCINB = '0') then
                    next_state <= WAIT_FOR_SYNC;    
                end if;

            when others =>
                null; 

        end case;
    end process;

    --output function
    process(state_reg)
    begin

        case state_reg is
        
            when WAIT_FOR_SYNC =>
                SYNC_OK <= '0';
                Data_Read <= '0';

            when WAIT_FOR_DATA =>
                SYNC_OK <= '1';
                Data_Read <= '0';

            when DATA_GO =>
                SYNC_OK <= '1';
                Data_Read <= '1';

            when others =>
                SYNC_OK <= '0';
                Data_Read <= '0';


        end case;

    end process;



------------------------------------------------------------------------------------------------------------
--make and, or
------------------------------------------------------------------------------------------------------------

    And_Lanes_DataGo <= and Lanes_DataGo;
  






end rtl;