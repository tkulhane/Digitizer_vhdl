library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity SYNCinb_Handler is
    port
    (
        Clock : in std_logic;                                           --system clock
        Reset_N : in std_logic;                                         --system reset

        Lane_Rx_K   : in std_logic_vector(7 downto 0);
        Lane_Rx_Data : in std_logic_vector(63 downto 0);
        
        Sync_Req : in std_logic;

        SYNC_OK : out std_logic
 
    );
end SYNCinb_Handler;


architecture rtl of SYNCinb_Handler is

    constant const_K_char : std_logic_vector(7 downto 0) := X"BC";


    type FSM_state is (WAIT_FOR_SYNC, WAIT_FOR_xK, IN_SYNC);
    signal state_reg, next_state : FSM_state;
    signal fsm_timer : unsigned(9 downto 0);

    signal All_Rx_K : std_logic;
    signal Comparator_Data_K : std_logic;

    signal Rx_Byte_0 : std_logic_vector(7 downto 0);
    signal Rx_Byte_1 : std_logic_vector(7 downto 0);
    signal Rx_Byte_2 : std_logic_vector(7 downto 0);
    signal Rx_Byte_3 : std_logic_vector(7 downto 0);
    signal Rx_Byte_4 : std_logic_vector(7 downto 0);
    signal Rx_Byte_5 : std_logic_vector(7 downto 0);
    signal Rx_Byte_6 : std_logic_vector(7 downto 0);
    signal Rx_Byte_7 : std_logic_vector(7 downto 0);



begin

    Rx_Byte_0 <= Lane_Rx_Data(7  downto 0);
    Rx_Byte_1 <= Lane_Rx_Data(15 downto 8);
    Rx_Byte_2 <= Lane_Rx_Data(23 downto 16);
    Rx_Byte_3 <= Lane_Rx_Data(31 downto 24);
    Rx_Byte_4 <= Lane_Rx_Data(39 downto 32);
    Rx_Byte_5 <= Lane_Rx_Data(47 downto 40);
    Rx_Byte_6 <= Lane_Rx_Data(55 downto 48);
    Rx_Byte_7 <= Lane_Rx_Data(63 downto 56);
    


------------------------------------------------------------------------------------------------------------
--FSM memory ride
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
    process(next_state, state_reg, All_Rx_K, Comparator_Data_K, Sync_Req, fsm_timer)
    begin

        next_state <= state_reg;

        case state_reg is
        
            when WAIT_FOR_SYNC =>
                if(All_Rx_K = '1' and Comparator_Data_K = '1') then
                    next_state <= WAIT_FOR_xK;        
                end if;
                
            when WAIT_FOR_xK =>
                if(All_Rx_K = '0' or Comparator_Data_K = '0') then
                    next_state <= WAIT_FOR_SYNC;
                elsif(fsm_timer >= 100 -1) then
                    next_state <= IN_SYNC;         
                end if;

            when IN_SYNC =>
                if(Sync_Req = '1') then
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

            when WAIT_FOR_xK =>
                SYNC_OK <= '0';

            when IN_SYNC =>
                SYNC_OK <= '1';

            when others =>
                SYNC_OK <= '0';

        end case;

    end process;


------------------------------------------------------------------------------------------------------------
--Rx_K and
------------------------------------------------------------------------------------------------------------

    process(Reset_N,Clock)
    begin

        if(Reset_N = '0') then
            All_Rx_K <= '0';
    
        elsif(Clock'event and Clock = '1') then
            
            if(Lane_Rx_K = x"FF") then 
                All_Rx_K <= '1';
            else
                All_Rx_K <= '0';
            end if;

        end if;
    end process;


------------------------------------------------------------------------------------------------------------
--Data K comparator
------------------------------------------------------------------------------------------------------------

    process(Reset_N,Clock)
    begin

        if(Reset_N = '0') then
            Comparator_Data_K <= '0';

        elsif(Clock'event and Clock = '1') then
            
            if( Rx_Byte_0 = const_K_char and 
                Rx_Byte_1 = const_K_char and
                Rx_Byte_2 = const_K_char and
                Rx_Byte_3 = const_K_char and
                Rx_Byte_4 = const_K_char and
                Rx_Byte_5 = const_K_char and
                Rx_Byte_6 = const_K_char and
                Rx_Byte_7 = const_K_char
            ) then
                Comparator_Data_K <= '1';                            

            else
                Comparator_Data_K <= '0';

            end if;
        
        end if;
    end process;




end rtl;