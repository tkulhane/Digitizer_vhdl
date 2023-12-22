library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity LaneOutExtender is
  port 
  (

 
    Input_Data_3 : in std_logic_vector(7 downto 0);
    Input_Data_2 : in std_logic_vector(7 downto 0);
    Input_Data_1 : in std_logic_vector(7 downto 0);
    Input_Data_0 : in std_logic_vector(7 downto 0);

    Output_Data_3 : out std_logic_vector(11 downto 0);
    Output_Data_2 : out std_logic_vector(11 downto 0);
    Output_Data_1 : out std_logic_vector(11 downto 0);
    Output_Data_0 : out std_logic_vector(11 downto 0)


  );
end LaneOutExtender;
 
architecture rtl of LaneOutExtender is

------------------------------------------------------------------------------------------------------------
--constant
------------------------------------------------------------------------------------------------------------ 

 
------------------------------------------------------------------------------------------------------------
--Signals declaration
------------------------------------------------------------------------------------------------------------ 


begin


------------------------------------------------------------------------------------------------------------
--Signals routing
------------------------------------------------------------------------------------------------------------  

  Output_Data_3 <= "0000" & Input_Data_3;
  Output_Data_2 <= "0000" & Input_Data_2;
  Output_Data_1 <= "0000" & Input_Data_1;
  Output_Data_0 <= "0000" & Input_Data_0;




end rtl;