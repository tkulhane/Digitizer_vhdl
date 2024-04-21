library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DataRamManage is
    port
    (
        Clock : in std_logic;
        Reset_N : in std_logic;

		CountOfSampleWord_Write : in std_logic;
    	CountOfEventWord_Write : in std_logic;
    	CountOfSampleWord_Read : in std_logic;
    	CountOfEventWord_Read : in std_logic;

        EnableOfWrite : out std_logic;
        EnableOfRead : out std_logic

    );
end DataRamManage;


architecture arch of DataRamManage is

    constant MaxOfEvents : natural := 1024;
    constant MaxOfSamples : natural := 4*65536;

	    
	signal CountOfSampleWord : unsigned(128 - 1 downto 0);
    signal CountOfEventWord : unsigned(32 - 1 downto 0);

	signal EnableOfWriteSamples : std_logic;
	signal EnableOfWriteEvents : std_logic;

begin


	EnableOfWrite <= EnableOfWriteSamples and EnableOfWriteEvents;

------------------------------------------------------------------------------------------------------------
--process CountOfEventWord
------------------------------------------------------------------------------------------------------------
    process(Clock, Reset_N)

    begin

        if(Reset_N = '0') then
            CountOfEventWord <= (others => '0');
            
    
        elsif(Clock'event and Clock = '1') then
        
            --write to RAM
            if(CountOfEventWord_Write = '1') then
                CountOfEventWord <= CountOfEventWord + 1;
            end if;

            --read from RAM
            if(CountOfEventWord_Read = '1') then
                CountOfEventWord <= CountOfEventWord - 1;
            end if;

        end if;

    end process;

------------------------------------------------------------------------------------------------------------
--process CountOfSampleWord
------------------------------------------------------------------------------------------------------------
    process(Clock, Reset_N)

    begin

        if(Reset_N = '0') then
            CountOfSampleWord <= (others => '0');
            
    
        elsif(Clock'event and Clock = '1') then
        
            --write to RAM
            if(CountOfSampleWord_Write = '1') then
                CountOfSampleWord <= CountOfSampleWord + 1;
            end if;

            --read from RAM
            if(CountOfSampleWord_Read = '1') then
                CountOfSampleWord <= CountOfSampleWord - 1;
            end if;

        end if;

    end process;


------------------------------------------------------------------------------------------------------------
--comparators for write eneble
------------------------------------------------------------------------------------------------------------
    process(Clock, Reset_N)

    begin

        if(Reset_N = '0') then
            EnableOfWriteSamples <= '0';
			EnableOfWriteEvents <= '0';
            
    
        elsif(Clock'event and Clock = '1') then
        
            if(CountOfSampleWord > MaxOfSamples) then
				EnableOfWriteSamples <= '0';
			else 
				EnableOfWriteSamples <= '1';
            end if;

            if(CountOfEventWord > MaxOfEvents) then
                EnableOfWriteEvents <= '0';
			else 
				EnableOfWriteEvents <= '1';
            end if;

        end if;

    end process;








end arch;
