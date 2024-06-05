library ieee;
use ieee.std_logic_1164.all;

entity VectorMux is
    generic
    (
        g_Num : natural := 384
    );
    port
    (
        DataIn_0 : in std_logic_vector(g_Num-1 downto 0);
        DataIn_1 : in std_logic_vector(g_Num-1 downto 0);
        DataOut : out std_logic_vector(g_Num-1 downto 0);

        Sel : in std_logic 

    );
end VectorMux;   


architecture arch of VectorMux is

    
begin

    DataOut <= DataIn_0 when (Sel = '0') else
                DataIn_1;


    
end arch ; -- arch
