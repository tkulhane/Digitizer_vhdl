library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Test_Generator_for_Lanes is
    generic
    (
        g_Data_Length : Natural := 8
    );
    port
    (
        Clock : in std_logic;
        Reset_N : in std_logic;

        Test_Enable : in std_logic;

        Test_Data_0 : out std_logic_vector(g_Data_Length - 1 downto 0);
        Test_Data_1 : out std_logic_vector(g_Data_Length - 1 downto 0);
        Test_Data_2 : out std_logic_vector(g_Data_Length - 1 downto 0);
        Test_Data_3 : out std_logic_vector(g_Data_Length - 1 downto 0);
        Test_Data_4 : out std_logic_vector(g_Data_Length - 1 downto 0);
        Test_Data_5 : out std_logic_vector(g_Data_Length - 1 downto 0);
        Test_Data_6 : out std_logic_vector(g_Data_Length - 1 downto 0);
        Test_Data_7 : out std_logic_vector(g_Data_Length - 1 downto 0)

    );
end Test_Generator_for_Lanes;


architecture rtl of Test_Generator_for_Lanes is

    constant Num_Of_Outputs : integer := 8;
    constant Not_Waiting : std_logic := '1';  

------------------------------------------------------------------------------------------------------------
--Signals Declaration
------------------------------------------------------------------------------------------------------------  
    type type_data_array is array(0 to Num_Of_Outputs - 1) of unsigned(g_Data_Length - 1 downto 0);
    signal Test_Data : type_data_array;

    
begin

------------------------------------------------------------------------------------------------------------
--Signals Routing
------------------------------------------------------------------------------------------------------------ 
    Test_Data_0 <= std_logic_vector(Test_Data(0));
    Test_Data_1 <= std_logic_vector(Test_Data(1));
    Test_Data_2 <= std_logic_vector(Test_Data(2));
    Test_Data_3 <= std_logic_vector(Test_Data(3));
    Test_Data_4 <= std_logic_vector(Test_Data(4));
    Test_Data_5 <= std_logic_vector(Test_Data(5));
    Test_Data_6 <= std_logic_vector(Test_Data(6));
    Test_Data_7 <= std_logic_vector(Test_Data(7));



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