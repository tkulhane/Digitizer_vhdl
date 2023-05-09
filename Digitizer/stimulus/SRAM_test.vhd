--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: SRAM_test.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::PolarFire> <Die::MPF300TS_ES> <Package::FCG1152>
-- Author: <Name>
--
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity SRAM_test is
end SRAM_test;

architecture behavioral of SRAM_test is

    constant SYSCLK_PERIOD : time := 100 ns; -- 10MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';

------------------------------------------------------------------------------------------------------------
--Signals Declaration
------------------------------------------------------------------------------------------------------------

    signal A_DIN : std_logic_vector(63 downto 0);
    signal A_ADDR : std_logic_vector(9 downto 0);
    signal B_DIN : std_logic_vector(63 downto 0);
    signal B_ADDR : std_logic_vector(9 downto 0);
    signal A_WBYTE_EN : std_logic_vector(7 downto 0);
    signal B_WBYTE_EN : std_logic_vector(7 downto 0);
    signal A_WEN : std_logic;
    signal B_WEN : std_logic;
    --signal        CLK : in std_logic;

            -- Outputs
    signal A_DOUT : std_logic_vector(63 downto 0);
    signal B_DOUT : std_logic_vector(63 downto 0);

------------------------------------------------------------------------------------------------------------
--Component
------------------------------------------------------------------------------------------------------------
    component SRAM
        -- ports
        port( 
            -- Inputs
            A_DIN : in std_logic_vector(63 downto 0);
            A_ADDR : in std_logic_vector(9 downto 0);
            B_DIN : in std_logic_vector(63 downto 0);
            B_ADDR : in std_logic_vector(9 downto 0);
            A_WBYTE_EN : in std_logic_vector(7 downto 0);
            B_WBYTE_EN : in std_logic_vector(7 downto 0);
            A_WEN : in std_logic;
            B_WEN : in std_logic;
            CLK : in std_logic;

            -- Outputs
            A_DOUT : out std_logic_vector(63 downto 0);
            B_DOUT : out std_logic_vector(63 downto 0)

            -- Inouts

        );
    end component;

begin

    process
        variable vhdl_initial : BOOLEAN := TRUE;

    begin
        if ( vhdl_initial ) then
            -- Assert Reset
            NSYSRESET <= '0';
            wait for ( SYSCLK_PERIOD * 10 );
            
            NSYSRESET <= '1';
            wait;
        end if;
    end process;

    -- Clock Driver
    SYSCLK <= not SYSCLK after (SYSCLK_PERIOD / 2.0 );

    -- Instantiate Unit Under Test:  SRAM
    SRAM_0 : SRAM
        -- port map
        port map( 
            -- Inputs
            A_DIN => A_DIN,
            A_ADDR => A_ADDR,
            B_DIN => B_DIN,
            B_ADDR => B_ADDR,
            A_WBYTE_EN => A_WBYTE_EN,
            B_WBYTE_EN => B_WBYTE_EN,
            A_WEN => A_WEN,
            B_WEN => B_WEN,
            CLK => SYSCLK,

            -- Outputs
            A_DOUT => A_DOUT,
            B_DOUT => B_DOUT

            -- Inouts

        );


    process
    begin

        A_WEN <= '0';
        B_WEN <= '0';
        A_WBYTE_EN <= (others => '0');
        B_WBYTE_EN <= (others => '0');

        wait until NSYSRESET'event and NSYSRESET = '1';
        wait for 100 ns;
        wait until SYSCLK'event and SYSCLK = '1';

        B_DIN <= X"0000000000000000";
        B_ADDR <= "0000000000";
        B_WEN <= '0';
        B_WBYTE_EN <= "00000000";




        A_DIN <= X"0000000034CD0000";
        A_ADDR <= "0000000000";
        A_WEN <= '1';
        A_WBYTE_EN <= "00001100";

        wait until SYSCLK'event and SYSCLK = '1';

        A_DIN <= X"000056EF00000000";
        A_ADDR <= "0000000000";
        A_WEN <= '1';
        A_WBYTE_EN <= "00110000";

        wait until SYSCLK'event and SYSCLK = '1';

        A_DIN <= X"7812000000000000";
        A_ADDR <= "0000000000";
        A_WEN <= '1';
        A_WBYTE_EN <= "11000000";

        wait until SYSCLK'event and SYSCLK = '1';
        
        A_DIN <= X"0123456789ABCDEF";
        A_ADDR <= "0000000001";
        A_WEN <= '1';
        A_WBYTE_EN <= "11111111";

        wait until SYSCLK'event and SYSCLK = '1';

        A_DIN <= X"0123456789ABCDEF";
        A_DIN <= X"318AD43057E223FB";
        A_ADDR <= "0000000010";
        A_WEN <= '1';
        A_WBYTE_EN <= "11111111";

        wait until SYSCLK'event and SYSCLK = '1';
        B_ADDR <= "0000000001";
        wait until SYSCLK'event and SYSCLK = '1';
        B_ADDR <= "0000000010";

        A_WEN <= '0';
        A_WBYTE_EN <= "00000000";

    end process;

end behavioral;

