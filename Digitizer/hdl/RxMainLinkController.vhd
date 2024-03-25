library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity RxMainLinkController is
  generic 
  (
    g_NumOfLanes : natural := 4
  );
  port 
  (
    Clock : in std_logic;
    Reset_N : in std_logic;
 
    LANE_Synced : in std_logic_vector(g_NumOfLanes - 1 downto 0);
    LANE_ILAS_Go : in std_logic_vector(g_NumOfLanes - 1 downto 0);
    LANE_Data_Go : in std_logic_vector(g_NumOfLanes - 1 downto 0);

    LANE_Alignment_Fifo_Empty : in std_logic_vector(g_NumOfLanes - 1 downto 0);
    LANE_Fault : in std_logic_vector(g_NumOfLanes - 1 downto 0);

    TRNV_CTRL_Restart : in std_logic;

    SYNCINB : out std_logic;
    LANE_CLR_Fault : out std_logic;
    Alignment_Fifo_Read : out std_logic

    
  );
end RxMainLinkController;
 
architecture rtl of RxMainLinkController is

------------------------------------------------------------------------------------------------------------
--constant
------------------------------------------------------------------------------------------------------------ 
  
 
------------------------------------------------------------------------------------------------------------
--Signals declaration
------------------------------------------------------------------------------------------------------------ 

  type FSM_state is (WAIT_FOR_SYNC, WAIT_FOR_ILAS, FIRST_ILAS_START, LAST_ILAS_START, DATA_GO, LANES_RESTART);
  signal state_reg, next_state : FSM_state;
  signal fsm_timer : unsigned(9 downto 0);


  signal And_LANE_Synced : std_logic;
  signal And_LANE_ILAS_Go : std_logic;
  signal Or_LANE_ILAS_Go : std_logic;
  signal And_LANE_Data_Go : std_logic;
  signal Or_LANE_Alignment_Fifo_Empty : std_logic;
  signal Or_LANE_Fault : std_logic;

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
    process(next_state, state_reg, fsm_timer, And_LANE_Synced, And_LANE_ILAS_Go, Or_LANE_ILAS_Go, And_LANE_Data_Go, Or_LANE_Alignment_Fifo_Empty, TRNV_CTRL_Restart)
    begin

        next_state <= state_reg;

        case state_reg is
        
            when WAIT_FOR_SYNC =>
                if(TRNV_CTRL_Restart = '1' or Or_LANE_Fault = '1') then
                    next_state <= LANES_RESTART;
                elsif(And_LANE_Synced = '1') then
                    next_state <= WAIT_FOR_ILAS;    
                end if;

            when WAIT_FOR_ILAS =>
                if(TRNV_CTRL_Restart = '1' or Or_LANE_Fault = '1') then
                    next_state <= LANES_RESTART;
                elsif(Or_LANE_ILAS_Go = '1') then
                    next_state <= FIRST_ILAS_START;    
                end if;

            when FIRST_ILAS_START => 
                if(TRNV_CTRL_Restart = '1' or Or_LANE_Fault = '1') then
                    next_state <= LANES_RESTART;
                elsif(And_LANE_ILAS_Go = '1') then
                    next_state <= LAST_ILAS_START;    
                end if;

            when LAST_ILAS_START =>
                if(TRNV_CTRL_Restart = '1' or Or_LANE_Fault = '1') then
                    next_state <= LANES_RESTART;
                elsif(And_LANE_Data_Go = '1' and Or_LANE_Alignment_Fifo_Empty = '0' and fsm_timer >= 5 -1) then
                    next_state <= DATA_GO;    
                end if;

            when DATA_GO =>
                if(TRNV_CTRL_Restart = '1' or Or_LANE_Fault = '1') then
                    next_state <= LANES_RESTART;
                end if;

            when LANES_RESTART =>
                if(TRNV_CTRL_Restart = '0' and Or_LANE_Fault = '0') then
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
                SYNCINB <= '0';
                Alignment_Fifo_Read <= '0';
                LANE_CLR_Fault <= '0';

            when WAIT_FOR_ILAS =>
                SYNCINB <= '1';
                Alignment_Fifo_Read <= '0';
                LANE_CLR_Fault <= '0';

            when FIRST_ILAS_START =>
                SYNCINB <= '1';
                Alignment_Fifo_Read <= '0';
                LANE_CLR_Fault <= '0';

            when LAST_ILAS_START =>
                SYNCINB <= '1';
                Alignment_Fifo_Read <= '0';
                LANE_CLR_Fault <= '0';

            when DATA_GO =>
                SYNCINB <= '1';
                Alignment_Fifo_Read <= '1';
                LANE_CLR_Fault <= '0';

            when LANES_RESTART =>
                SYNCINB <= '0';
                Alignment_Fifo_Read <= '1';
                LANE_CLR_Fault <= '1';

            when others =>
                SYNCINB <= '0';
                Alignment_Fifo_Read <= '0';
                LANE_CLR_Fault <= '1'; 


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
  Or_LANE_Fault <= or LANE_Fault;






end rtl;