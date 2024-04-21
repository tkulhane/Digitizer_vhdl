library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity EventFifoFreeLogic is
	generic
	(
    	g_FifoRemainingWidth : natural := 8;
		g_FifoDepth : natural := 16000
	);
    port
    (
        Clock : in std_logic;
        Reset_N : in std_logic;

		SamplePerEvent : in std_logic_vector(31 downto 0);
        Fifo_CountWord : in std_logic_vector(g_FifoRemainingWidth - 1 downto 0);
        NotFree : out std_logic
    );
end EventFifoFreeLogic;

architecture arch of EventFifoFreeLogic is

signal SamplePerEvent_Unsigned : unsigned(31 downto 0);
signal freewords : unsigned(31 downto 0);

begin

SamplePerEvent_Unsigned <= unsigned(SamplePerEvent);

process(Clock,Reset_N)
	
	
	begin
		if(Reset_N = '0') then
			NotFree <= '0';
			freewords <= (others => '0');
			
		elsif(Clock'event and Clock = '1') then

			freewords <= to_unsigned(g_FifoDepth, 32) - unsigned(Fifo_CountWord);
		
			if(freewords > SamplePerEvent_Unsigned + 4) then
				NotFree <= '0';
			
			else
				NotFree <= '1';
		
			end if;
	 end if;
	
	end process;



end arch;
