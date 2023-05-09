library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity mko is
generic
    (
        Time_Period : natural := 10
    );
    port
    (
        CLK_input : in std_logic;
        nRST_input : in std_logic;

        MKO_IN : in std_logic;
        MKO_OUT : out std_logic

    );

end mko;

architecture rtl of mko is

begin

    process(CLK_input,nRST_input)

        variable Counter : unsigned (31 downto 0); 

    begin

        if(nRST_input = '0') then
			Counter := (others => '0');
            MKO_OUT <= '0';

		
		elsif(CLK_input'event and CLK_input = '1') then
			if(MKO_IN = '1') then

                Counter := to_unsigned(Time_Period,32);

            end if;


			if(Counter > 0) then
				MKO_OUT <= '1';
                Counter := Counter - 1;

            else 
                MKO_OUT <= '0';

			end if;

				
				
		end if;

    end process;


end rtl;