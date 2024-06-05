library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Test_Generator_for_Lanes is
    generic
    (
        g_Data_Length : Natural := 12;
        g_Num_Of_Outputs : Natural := 32
    );
    port
    (
        Clock : in std_logic;
        Reset_N : in std_logic;

        Test_Enable : in std_logic;

        Test_DataOut : out std_logic_vector( (g_Num_Of_Outputs*12) - 1 downto 0)--plati pro HD mod (g_NumberOfLanes/2 * frame_in_logicClk * 12)

    );
end Test_Generator_for_Lanes;


architecture rtl of Test_Generator_for_Lanes is

    --constant Num_Of_Outputs : integer := 8;
    constant Not_Waiting : std_logic := '1';  

------------------------------------------------------------------------------------------------------------
--Signals Declaration
------------------------------------------------------------------------------------------------------------  
    type type_data_array is array(0 to g_Num_Of_Outputs - 1) of unsigned(g_Data_Length - 1 downto 0);
    signal Test_Data_Array : type_data_array;

    
begin

------------------------------------------------------------------------------------------------------------
--Signals Routing
------------------------------------------------------------------------------------------------------------ 

    OutData_GEN : for i in 0 to (g_Num_Of_Outputs - 1) generate
        Test_DataOut(11+(i*12) downto 0 +(i*12)) <= std_logic_vector(Test_Data_Array(i));

    end generate OutData_GEN;



------------------------------------------------------------------------------------------------------------
--Process: Test Counter
------------------------------------------------------------------------------------------------------------
    Test_Counter: process(Clock,Reset_N)

    begin

        if(Reset_N = '0') then

            --Enable_Waiting_Counter <= '0';

            Test_Data_Reset : for i in 0 to (g_Num_Of_Outputs - 1) loop          
                Test_Data_Array(i) <= to_unsigned(i, g_Data_Length);
            end loop Test_Data_Reset;

        elsif(Clock'event and Clock = '1') then

            if(Test_Enable = '1') then

                            
                Test_Data_Count : for i in 0 to (g_Num_Of_Outputs - 1) loop
                    Test_Data_Array(i) <= Test_Data_Array(i) + g_Num_Of_Outputs;
                end loop Test_Data_Count;
    
            else 
            
                Test_Data_Reset_E : for i in 0 to (g_Num_Of_Outputs - 1) loop          
                    Test_Data_Array(i) <= to_unsigned(i, g_Data_Length);
                end loop Test_Data_Reset_E;

            end if;

            --if((Test_Data(0) + Num_Of_Outputs >= 230 ) and Not_Waiting = '0') then
            --    Enable_Waiting_Counter <= '1';

            --end if;

        end if;  

    end process;   

end rtl;