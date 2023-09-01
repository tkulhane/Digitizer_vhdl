library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Test_Generator_XCVR is
    port
    (
        Clock : in std_logic;
        Reset_N : in std_logic;

        SYNC_OK : in std_logic;

        TX_Data : out std_logic_vector(63 downto 0);
        TX_K_Char : out std_logic_vector(7 downto 0)
    );
end Test_Generator_XCVR;


architecture rtl of Test_Generator_XCVR is

    constant Num_Of_Outputs : integer := 8;
    constant g_Data_Length : integer := 8;


------------------------------------------------------------------------------------------------------------
--Signals Declaration
------------------------------------------------------------------------------------------------------------  
    type type_data_array is array(0 to Num_Of_Outputs - 1) of unsigned(g_Data_Length - 1 downto 0);
    signal Test_Data : type_data_array;

    signal Test_Enable : std_logic;

    signal TX_Byte_0 : std_logic_vector(7 downto 0);
    signal TX_Byte_1 : std_logic_vector(7 downto 0);
    signal TX_Byte_2 : std_logic_vector(7 downto 0);
    signal TX_Byte_3 : std_logic_vector(7 downto 0);
    signal TX_Byte_4 : std_logic_vector(7 downto 0);
    signal TX_Byte_5 : std_logic_vector(7 downto 0);
    signal TX_Byte_6 : std_logic_vector(7 downto 0);
    signal TX_Byte_7 : std_logic_vector(7 downto 0);

    type FSM_state is (SEND_K, SEND_D);
    signal state_reg, next_state : FSM_state;

begin

------------------------------------------------------------------------------------------------------------
--Signals Routing
------------------------------------------------------------------------------------------------------------ 
    --Test_Data_0 <= std_logic_vector(Test_Data(0));
    --Test_Data_1 <= std_logic_vector(Test_Data(1));
    --Test_Data_2 <= std_logic_vector(Test_Data(2));
    --Test_Data_3 <= std_logic_vector(Test_Data(3));
    --Test_Data_4 <= std_logic_vector(Test_Data(4));
    --Test_Data_5 <= std_logic_vector(Test_Data(5));
    --Test_Data_6 <= std_logic_vector(Test_Data(6));
    --Test_Data_7 <= std_logic_vector(Test_Data(7));

    TX_Data <= TX_Byte_7 & TX_Byte_6 & TX_Byte_5 & TX_Byte_4 & TX_Byte_3 & TX_Byte_2 & TX_Byte_1 & TX_Byte_0;
                    


------------------------------------------------------------------------------------------------------------
--FSM 
------------------------------------------------------------------------------------------------------------
    --state memory and reset
    process(Reset_N,Clock)
    begin

        if(Reset_N = '0') then
            state_reg <= SEND_K;
        
        elsif(Clock'event and Clock = '1') then
            state_reg <= next_state;

        end if;
    end process;

    --translation function
    process(next_state, state_reg, SYNC_OK)
    begin

        next_state <= state_reg;

        case state_reg is
        
            when SEND_K =>
                if(SYNC_OK = '1') then
                    next_state <= SEND_D;
                end if;
                
            when SEND_D =>
                if(SYNC_OK = '0') then
                    next_state <= SEND_K;
                end if;


            when others =>
                null; 

        end case;
    end process;

    --output function
    process(state_reg, Test_Data)
    begin

        case state_reg is
        
            when SEND_K =>
                Test_Enable <= '0';
                TX_K_Char <= X"FF";  
                TX_Byte_0 <= X"BC";
                TX_Byte_1 <= X"BC";
                TX_Byte_2 <= X"BC";
                TX_Byte_3 <= X"BC";
                TX_Byte_4 <= X"BC";
                TX_Byte_5 <= X"BC";
                TX_Byte_6 <= X"BC";
                TX_Byte_7 <= X"BC";

            when SEND_D =>
                Test_Enable <= '1';
                TX_K_Char <= X"00"; 
                TX_Byte_0 <= std_logic_vector(Test_Data(0));
                TX_Byte_1 <= std_logic_vector(Test_Data(1));
                TX_Byte_2 <= std_logic_vector(Test_Data(2));
                TX_Byte_3 <= std_logic_vector(Test_Data(3));
                TX_Byte_4 <= std_logic_vector(Test_Data(4));
                TX_Byte_5 <= std_logic_vector(Test_Data(5));
                TX_Byte_6 <= std_logic_vector(Test_Data(6));
                TX_Byte_7 <= std_logic_vector(Test_Data(7));
                
            when others =>

                Test_Enable <= '0';
                TX_K_Char <=  X"FF";
                TX_Byte_0 <= (others => '0');
                TX_Byte_1 <= (others => '0');
                TX_Byte_2 <= (others => '0');
                TX_Byte_3 <= (others => '0');
                TX_Byte_4 <= (others => '0');
                TX_Byte_5 <= (others => '0');
                TX_Byte_6 <= (others => '0');
                TX_Byte_7 <= (others => '0');


        end case;

    end process;


------------------------------------------------------------------------------------------------------------
--Process: Test Counter
------------------------------------------------------------------------------------------------------------
    Test_Counter: process(Clock,Reset_N)

    begin

        if(Reset_N = '0') then

            --Enable_Waiting_Counter <= '0';

            Test_Data_Reset : for i in 0 to (Num_Of_Outputs - 1) loop          
                Test_Data(i) <= to_unsigned(i, g_Data_Length);
            end loop Test_Data_Reset;

        elsif(Clock'event and Clock = '1') then

            if(Test_Enable = '1') then

                            
                Test_Data_Count : for i in 0 to (Num_Of_Outputs - 1) loop
                    Test_Data(i) <= Test_Data(i) + Num_Of_Outputs;
                end loop Test_Data_Count;
    
            else 
            
                Test_Data_Reset_E : for i in 0 to (Num_Of_Outputs - 1) loop          
                    Test_Data(i) <= to_unsigned(i, g_Data_Length);
                end loop Test_Data_Reset_E;

            end if;

            --if((Test_Data(0) + Num_Of_Outputs >= 230 ) and Not_Waiting = '0') then
            --    Enable_Waiting_Counter <= '1';

            --end if;

        end if;  

    end process;   

end rtl;