library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity EXT_Signals_InputSwitch is
    port
    (
        Clock : in std_logic;
        Reset_N : in std_logic;
    
        EXT_SelectSwitch : in std_logic_vector(7 downto 0);

        IO_Block_D: out std_logic;
        IO_Block_Y: in std_logic;
        IO_Block_E: out std_logic;

        EXT_Inputs : out std_logic_vector(63 downto 0);
        EXT_Outputs : in std_logic_vector(63 downto 0)


    );
end EXT_Signals_InputSwitch;


architecture rtl of EXT_Signals_InputSwitch is

------------------------------------------------------------------------------------------------------------
--Signals Declaration
------------------------------------------------------------------------------------------------------------  
    signal SelectSwitch_Int : integer range 0 to 255 := 0;

    signal Input_SelectSwitch   : integer range 0 to 64 := 0;
    signal Output_SelectSwitch  : integer range 0 to 64 := 0;


------------------------------------------------------------------------------------------------------------
--Components
------------------------------------------------------------------------------------------------------------




begin

------------------------------------------------------------------------------------------------------------
--Signals Routing
------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------
--Process count mux drive
------------------------------------------------------------------------------------------------------------ 

    process(Reset_N,Clock)
    begin

        if(Reset_N = '0') then
            Input_SelectSwitch <= 0;
            Output_SelectSwitch <= 0;
        
        elsif(Clock'event and Clock = '1') then
            
            if(SelectSwitch_Int = 0 or SelectSwitch_Int = 128) then
                Input_SelectSwitch <= '0';
                Output_SelectSwitch <= '0';
                IO_Block_E <= '0';

            elsif(SelectSwitch_Int > 0 and SelectSwitch_Int < 128) then
                --Input
                Input_SelectSwitch <= SelectSwitch_Int;
                Output_SelectSwitch <= 0;
                IO_Block_E <= '0';

            elsif(SelectSwitch_Int > 128 and SelectSwitch_Int < 256) then
                --Output
                Input_SelectSwitch <= 0;
                Output_SelectSwitch <= SelectSwitch_Int - 127;
                IO_Block_E <= '1';

            else 
                Input_SelectSwitch <= 0;
                Output_SelectSwitch <= 0;
                IO_Block_E <= '0';


            end if;

        end if;
    end process;



    WR_A_GEN : for i in 1 to (64 - 1) generate
    IO_Block_D <= 1 when (i = '1') else '0';
  end generate WR_A_GEN;  


------------------------------------------------------------------------------------------------------------
--Clock setting MUX
------------------------------------------------------------------------------------------------------------ 
	process(MUX_select_Register,ClockInputA,ClockInputB,ClockInputC,ClockInputD)
	begin
	
        case MUX_select_Register is

            when "00" =>
                Clock_To_PLL <= ClockInputA;

            when "01" =>
                Clock_To_PLL <= ClockInputB;

            when "10" =>
                Clock_To_PLL <= ClockInputC;

            when "11" =>
                Clock_To_PLL <= ClockInputD;

            when others =>
                Clock_To_PLL <= ClockInputA;

            end case;
	
	end process;








end rtl;