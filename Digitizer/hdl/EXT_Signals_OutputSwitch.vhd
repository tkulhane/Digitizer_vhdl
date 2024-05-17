library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity EXT_Signals_OutputSwitch is
    generic 
    (
        g_SelectNumWidth        : natural := 8;
        g_NumOfSelectedOutputs  : natural := 10;
        g_SignalVectorWidth     : natural := 32
    );
    port
    (
        --Clock : in std_logic;
        --Reset_N : in std_logic;
    
        EXT_Select : in std_logic_vector(g_SelectNumWidth * g_NumOfSelectedOutputs - 1 downto 0);

        IO_Block_D: out std_logic_vector(g_NumOfSelectedOutputs -1 downto 0);
        IO_Block_E: out std_logic_vector(g_NumOfSelectedOutputs -1 downto 0);
        --IO_Block_Y: in std_logic;

        EXT_VectorSignals : in std_logic_vector(g_SignalVectorWidth - 1 downto 0)

    );
end EXT_Signals_OutputSwitch;


architecture rtl of EXT_Signals_OutputSwitch is

------------------------------------------------------------------------------------------------------------
--Signals Declaration
------------------------------------------------------------------------------------------------------------  
    --signal SelectSwitch_Int : integer range 0 to 255 := 0;

    type type_EXT_Select_vector_array is array(0 to (g_NumOfSelectedOutputs - 1)) of integer range 0 to 2**g_SelectNumWidth;
    signal EXT_Select_array : type_EXT_Select_vector_array;


------------------------------------------------------------------------------------------------------------
--Components
------------------------------------------------------------------------------------------------------------




begin

------------------------------------------------------------------------------------------------------------
--Signals Routing
------------------------------------------------------------------------------------------------------------

    SelectedArray_GEN : for i in 0 to (g_NumOfSelectedOutputs - 1) generate
        EXT_Select_array(i) <= to_integer(unsigned( EXT_Select( ((i*g_SelectNumWidth) + (g_SelectNumWidth-1)) downto (i*8) ) ));
    end generate SelectedArray_GEN;



------------------------------------------------------------------------------------------------------------
--switch gen
------------------------------------------------------------------------------------------------------------
    SwitchGen_GEN : for i in 1 to (g_NumOfSelectedOutputs - 1) generate
        IO_Block_D(i) <= EXT_VectorSignals(EXT_Select_array(i));
    end generate SwitchGen_GEN;  





end rtl;