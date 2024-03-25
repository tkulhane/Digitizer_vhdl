----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Sat Mar 23 14:19:27 2024
-- Testbench Template
-- This is a basic testbench that instantiates your design with basic 
-- clock and reset pins connected.  If your design has special
-- clock/reset or testbench driver requirements then you should 
-- copy this file and modify it. 
----------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: xxx.vhd
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

entity xxx is
end xxx;

architecture behavioral of xxx is

    constant SYSCLK_PERIOD : time := 100 ns; -- 10MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';

    component AnalyzInCirc_Top
        -- ports
        port( 
            -- Inputs
            Clock : in std_logic;
            Reset_N : in std_logic;
            enable_cmd : in std_logic;
            write_read : in std_logic;
            addr_frame : in std_logic_vector(7 downto 0);
            write_data_frame : in std_logic_vector(15 downto 0);
            Start_Triggers : in std_logic_vector(7 downto 0);
            Transceiver_Rx_Data : in std_logic_vector(127 downto 0);
            Transceiver_Rx_K : in std_logic_vector(15 downto 0);

            -- Outputs
            busy : out std_logic;
            read_data_frame : out std_logic_vector(15 downto 0)

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

    -- Instantiate Unit Under Test:  AnalyzInCirc_Top
    AnalyzInCirc_Top_0 : AnalyzInCirc_Top
        -- port map
        port map( 
            -- Inputs
            Clock => SYSCLK,
            Reset_N => NSYSRESET,
            enable_cmd => '0',
            write_read => '0',
            addr_frame => (others=> '0'),
            write_data_frame => (others=> '0'),
            Start_Triggers => (others=> '0'),
            Transceiver_Rx_Data => (others=> '0'),
            Transceiver_Rx_K => (others=> '0'),

            -- Outputs
            busy =>  open,
            read_data_frame => open

            -- Inouts

        );

end behavioral;

