library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Sample_RAM_Block_Decoder is
    port
    (
        
        Input_vector : in std_logic_vector(3 downto 0);
        Output_vector : out std_logic_vector(15 downto 0)

    );
end Sample_RAM_Block_Decoder;


architecture rtl of Sample_RAM_Block_Decoder is



------------------------------------------------------------------------------------------------------------
--Signals Declaration
------------------------------------------------------------------------------------------------------------ 


begin

------------------------------------------------------------------------------------------------------------
--Signals Routing
------------------------------------------------------------------------------------------------------------   


    process(Input_vector)
    begin

        case Input_vector is

            when "0000" =>
                Output_vector <= "0000000000000001";
            when "0001" =>
                Output_vector <= "0000000000000010";
            when "0010" =>
                Output_vector <= "0000000000000100";
            when "0011" =>
                Output_vector <= "0000000000001000";
            
            when "0100" =>
                Output_vector <= "0000000000010000";
            when "0101" =>
                Output_vector <= "0000000000100000";
            when "0110" =>
                Output_vector <= "0000000001000000";
            when "0111" =>
                Output_vector <= "0000000010000000";

            when "1000" =>
                Output_vector <= "0000000100000000";
            when "1001" =>
                Output_vector <= "0000001000000000";
            when "1010" =>
                Output_vector <= "0000010000000000";
            when "1011" =>
                Output_vector <= "0000100000000000";
            
            when "1100" =>
                Output_vector <= "0001000000000000";
            when "1101" =>
                Output_vector <= "0010000000000000";
            when "1110" =>
                Output_vector <= "0100000000000000";
            when "1111" =>
                Output_vector <= "1000000000000000";

            when others =>
                Output_vector <= "0000000000000000";
    
        end case;

    end process;  




end rtl;