library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity SampleTxDeCompose is
  port 
  (

    Input_Data_0 : in std_logic_vector(11 downto 0);
    Input_TailBits : in std_logic_vector(3 downto 0);

    Output_Data_1 : out std_logic_vector(7 downto 0);
    Output_Data_0 : out std_logic_vector(7 downto 0)
    

  );
end SampleTxDeCompose;
 
architecture rtl of SampleTxDeCompose is

------------------------------------------------------------------------------------------------------------
--constant
------------------------------------------------------------------------------------------------------------ 

 
------------------------------------------------------------------------------------------------------------
--Signals declaration
------------------------------------------------------------------------------------------------------------ 
  signal DATA : std_logic_vector(15 downto 0);



begin


------------------------------------------------------------------------------------------------------------
--Signals routing
------------------------------------------------------------------------------------------------------------  

  DATA <= Input_Data_0 & Input_TailBits;

  Output_Data_1 <= DATA(7 downto 0);
  Output_Data_0 <= DATA(15 downto 8);



end rtl;