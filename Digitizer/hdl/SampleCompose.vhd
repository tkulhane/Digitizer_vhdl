library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity SampleCompose is
  port 
  (

    Clock : in std_logic;
    Reset_N : in std_logic;

    Input_Data : in std_logic_vector(15 downto 0);
    
    --Input_Data_1 : in std_logic_vector(7 downto 0);
    --Input_Data_0 : in std_logic_vector(7 downto 0);

    Output_Data : out std_logic_vector(11 downto 0);
    Output_TailBits : out std_logic_vector(3 downto 0)

  );
end SampleCompose;
 
architecture rtl of SampleCompose is

------------------------------------------------------------------------------------------------------------
--constant
------------------------------------------------------------------------------------------------------------ 

 
------------------------------------------------------------------------------------------------------------
--Signals declaration
------------------------------------------------------------------------------------------------------------ 

  --signal DATA : std_logic_vector(15 downto 0);

  signal Data_L : std_logic_vector(7 downto 0);
  signal Data_M : std_logic_vector(7 downto 0);

begin


------------------------------------------------------------------------------------------------------------
--Signals routing
------------------------------------------------------------------------------------------------------------  

    --DATA <= Input_Data;
  --DATA <= Input_Data_0 & Input_Data_1;
  Data_L <= Input_Data(7 downto 0);
  Data_M <= Input_Data(15 downto 8);

------------------------------------------------------------------------------------------------------------
--buffer
------------------------------------------------------------------------------------------------------------  
    DataBuffer: process(Clock,Reset_N)
    begin

        if(Reset_N = '0') then

            Output_Data <= (others => '0');
            Output_TailBits <= (others => '0');

        elsif(Clock'event and Clock = '1') then


            Output_Data <= Data_L & Data_M(7 downto 4);
            Output_TailBits <= Data_M(3 downto 0);



        end if;  

    end process;  



end rtl;