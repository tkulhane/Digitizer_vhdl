library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity MAIN_Link_Controller is
  generic 
  (
    g_NumOfLanes : natural := 2
  );
  port 
  (
    Clock : in std_logic;
    Reset_N : in std_logic;
 
    LANE_Synced : in std_logic_vector(g_NumOfLanes - 1 downto 0);
    LANE_ILAS_Go : in std_logic_vector(g_NumOfLanes - 1 downto 0);
    LANE_Data_Go : in std_logic_vector(g_NumOfLanes - 1 downto 0);

    LANE_Alignment_Fifo_Empty : in std_logic_vector(g_NumOfLanes - 1 downto 0);

    SYNCINB : out std_logic;
    Alignment_Fifo_Read : out std_logic

    
  );
end MAIN_Link_Controller;
 
architecture rtl of MAIN_Link_Controller is

------------------------------------------------------------------------------------------------------------
--constant
------------------------------------------------------------------------------------------------------------ 
  
 
------------------------------------------------------------------------------------------------------------
--Signals declaration
------------------------------------------------------------------------------------------------------------ 

  type FSM_state is (WAIT_FOR_SYNC, WAIT_FOR_ILAS, FIRST_ILAS_START, LAST_ILAS_START, DATA_GO);
  signal state_reg, next_state : FSM_state;
  signal fsm_timer : unsigned(9 downto 0);


  signal And_LANE_Synced : std_logic;
  signal And_LANE_ILAS_Go : std_logic;
  signal Or_LANE_ILAS_Go : std_logic;
  signal And_LANE_Data_Go : std_logic;
  signal Or_LANE_Alignment_Fifo_Empty : std_logic;

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
    process(next_state, state_reg, fsm_timer, And_LANE_Synced, And_LANE_ILAS_Go, Or_LANE_ILAS_Go, And_LANE_Data_Go, Or_LANE_Alignment_Fifo_Empty)
    begin

        next_state <= state_reg;

        case state_reg is
        
            when WAIT_FOR_SYNC =>
                if(And_LANE_Synced = '1') then
                    next_state <= WAIT_FOR_ILAS;    
                end if;

            when WAIT_FOR_ILAS =>
                if(Or_LANE_ILAS_Go = '1') then
                    next_state <= FIRST_ILAS_START;    
                end if;

            when FIRST_ILAS_START => 
                if(And_LANE_ILAS_Go = '1') then
                    next_state <= LAST_ILAS_START;    
                end if;

            when LAST_ILAS_START =>
                if(And_LANE_Data_Go = '1' and Or_LANE_Alignment_Fifo_Empty = '0' and fsm_timer >= 5 -1) then
                    next_state <= DATA_GO;    
                end if;

            when DATA_GO =>
              null;  

            when others =>
                null; 

        end case;
    end process;

    --output function
    process(state_reg)
    begin

        case state_reg is
        
            when WAIT_FOR_SYNC =>
                SYNCINB <= '0';
                Alignment_Fifo_Read <= '0';

            when WAIT_FOR_ILAS =>
                SYNCINB <= '1';
                Alignment_Fifo_Read <= '0';

            when FIRST_ILAS_START =>
                SYNCINB <= '1';
                Alignment_Fifo_Read <= '0';

            when LAST_ILAS_START =>
                SYNCINB <= '1';
                Alignment_Fifo_Read <= '0';

            when DATA_GO =>
                SYNCINB <= '1';
                Alignment_Fifo_Read <= '1';

            when others =>
                SYNCINB <= '0';
                Alignment_Fifo_Read <= '0'; 


        end case;

    end process;



------------------------------------------------------------------------------------------------------------
--make and, or
------------------------------------------------------------------------------------------------------------
  And_LANE_Synced <= and LANE_Synced;
  And_LANE_ILAS_Go <= and LANE_ILAS_Go;
  Or_LANE_ILAS_Go <= or LANE_ILAS_Go;
  And_LANE_Data_Go <= and LANE_Data_Go;

  Or_LANE_Alignment_Fifo_Empty <= or LANE_Alignment_Fifo_Empty;
  






end rtl;