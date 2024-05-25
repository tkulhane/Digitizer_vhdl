library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity EXT_Signals_InputSwitch is
    generic 
    (
        g_SelectNumWidth        : natural := 8;
        g_NumOfInputs           : natural := 10;
        g_SignalVectorWidth     : natural := 32
    );
    port
    (
        --Clock : in std_logic;
        --Reset_N : in std_logic;

        EXT_Select : in std_logic_vector(g_SelectNumWidth * g_SignalVectorWidth - 1 downto 0);
    
        IO_Block_Y: in std_logic_vector(g_NumOfInputs -1 downto 0);
        EXT_VectorSignals : out std_logic_vector(g_SignalVectorWidth - 1 downto 0)

    );
end EXT_Signals_InputSwitch;


architecture rtl of EXT_Signals_InputSwitch is

------------------------------------------------------------------------------------------------------------
--Signals Declaration
------------------------------------------------------------------------------------------------------------  
    
    type type_EXT_Select_vector_array is array(0 to (g_SignalVectorWidth - 1)) of integer range 0 to 2**g_SelectNumWidth;
    signal EXT_Select_array : type_EXT_Select_vector_array;

------------------------------------------------------------------------------------------------------------
--Components
------------------------------------------------------------------------------------------------------------




begin

------------------------------------------------------------------------------------------------------------
--Signals Routing
------------------------------------------------------------------------------------------------------------

    SelectedArray_GEN : for i in 0 to (g_SignalVectorWidth - 1) generate
        EXT_Select_array(i) <= to_integer(unsigned( EXT_Select( ((i*g_SelectNumWidth) + (g_SelectNumWidth-1)) downto (i*8) ) ));
    end generate SelectedArray_GEN;

------------------------------------------------------------------------------------------------------------
--Process count mux drive
------------------------------------------------------------------------------------------------------------ 

    SwitchGen_GEN : for i in 0 to (g_SignalVectorWidth - 1) generate
        
        EXT_VectorSignals(i) <=     '0' when EXT_Select_array(i)=255 else
                                    '1' when EXT_Select_array(i)=254 else
                                    IO_Block_Y(EXT_Select_array(i));    
        
        
        
    end generate SwitchGen_GEN;  












end rtl;