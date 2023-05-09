library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Sample_RAM_Block_MUX is
    port
    (
        Address : in std_logic_vector(3 downto 0);
        
        Input_Data_0 : in std_logic_vector(63 downto 0);
        Input_Data_1 : in std_logic_vector(63 downto 0);
        Input_Data_2 : in std_logic_vector(63 downto 0);
        Input_Data_3 : in std_logic_vector(63 downto 0);
        Input_Data_4 : in std_logic_vector(63 downto 0);
        Input_Data_5 : in std_logic_vector(63 downto 0);
        Input_Data_6 : in std_logic_vector(63 downto 0);
        Input_Data_7 : in std_logic_vector(63 downto 0);
        Input_Data_8 : in std_logic_vector(63 downto 0);
        Input_Data_9 : in std_logic_vector(63 downto 0);
        Input_Data_10 : in std_logic_vector(63 downto 0);
        Input_Data_11 : in std_logic_vector(63 downto 0);
        Input_Data_12 : in std_logic_vector(63 downto 0);
        Input_Data_13 : in std_logic_vector(63 downto 0);
        Input_Data_14 : in std_logic_vector(63 downto 0);
        Input_Data_15 : in std_logic_vector(63 downto 0);

        Output_Data : out std_logic_vector(63 downto 0)

    );
end Sample_RAM_Block_MUX;


architecture rtl of Sample_RAM_Block_MUX is



------------------------------------------------------------------------------------------------------------
--Signals Declaration
------------------------------------------------------------------------------------------------------------ 


begin

------------------------------------------------------------------------------------------------------------
--Signals Routing
------------------------------------------------------------------------------------------------------------   


    process(Address, Input_Data_0, Input_Data_1, Input_Data_2, Input_Data_3, Input_Data_4, Input_Data_5, Input_Data_6, Input_Data_7, Input_Data_8, Input_Data_9, Input_Data_10, Input_Data_11, Input_Data_12, Input_Data_13, Input_Data_14, Input_Data_15)
    begin

        case Address is

            when "0000" =>
                Output_Data <= Input_Data_0;
            when "0001" =>
                Output_Data <= Input_Data_1;
            when "0010" =>
                Output_Data <= Input_Data_2;
            when "0011" =>
                Output_Data <= Input_Data_3;
            
            when "0100" =>
                Output_Data <= Input_Data_4;
            when "0101" =>
                Output_Data <= Input_Data_5;
            when "0110" =>
                Output_Data <= Input_Data_6;
            when "0111" =>
                Output_Data <= Input_Data_7;

            when "1000" =>
                Output_Data <= Input_Data_8;
            when "1001" =>
                Output_Data <= Input_Data_9;
            when "1010" =>
                Output_Data <= Input_Data_10;
            when "1011" =>
                Output_Data <= Input_Data_11;
            
            when "1100" =>
                Output_Data <= Input_Data_12;
            when "1101" =>
                Output_Data <= Input_Data_13;
            when "1110" =>
                Output_Data <= Input_Data_14;
            when "1111" =>
                Output_Data <= Input_Data_15;

            when others =>
                Output_Data <= (others => '0');
    
        end case;

    end process;  




end rtl;