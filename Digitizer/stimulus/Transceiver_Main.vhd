--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: Transceiver_Main.vhd
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

entity Transceiver_Main is
end Transceiver_Main;

architecture behavioral of Transceiver_Main is

    constant SYSCLK_PERIOD : time := 25 ns; -- 40MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';

    component Transceiver_Main
        -- ports
        port( 
            -- Inputs

            -- Outputs

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

    -- Instantiate Unit Under Test:  Transceiver_Main
    Transceiver_Main_0 : Transceiver_Main
        -- port map
        port map( 
            -- Inputs

            -- Outputs

            -- Inouts

        );

end behavioral;

