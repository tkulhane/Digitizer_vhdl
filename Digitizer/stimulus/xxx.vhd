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

    component Transceiver_Main
        -- ports
        port( 
            -- Inputs
            LANE1_RXD_N : in std_logic;
            LANE0_RXD_P : in std_logic;
            LANE0_RXD_N : in std_logic;
            LANE1_RXD_P : in std_logic;
            REF_Clock : in std_logic;
            CTRL_Clock_40M : in std_logic;
            Logic_Clock : in std_logic;
            Logic_Reset_N : in std_logic;
            Gen_Enable : in std_logic;
            write_read : in std_logic;
            addr_frame : in std_logic_vector(7 downto 0);
            enable_cmd : in std_logic;
            write_data_frame : in std_logic_vector(15 downto 0);

            -- Outputs
            LANE1_TXD_N : out std_logic;
            LANE0_TXD_P : out std_logic;
            LANE0_TXD_N : out std_logic;
            LANE1_TXD_P : out std_logic;
            Data_Valid : out std_logic;
            Output_Data_7 : out std_logic_vector(95 downto 84);
            Output_Data_0 : out std_logic_vector(11 downto 0);
            Output_Data_1 : out std_logic_vector(23 downto 12);
            Output_Data_2 : out std_logic_vector(35 downto 24);
            Output_Data_3 : out std_logic_vector(47 downto 36);
            Output_Data_4 : out std_logic_vector(59 downto 48);
            Output_Data_5 : out std_logic_vector(71 downto 60);
            Output_Data_6 : out std_logic_vector(83 downto 72);
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

    -- Instantiate Unit Under Test:  Transceiver_Main
    Transceiver_Main_0 : Transceiver_Main
        -- port map
        port map( 
            -- Inputs
            LANE1_RXD_N => '0',
            LANE0_RXD_P => '0',
            LANE0_RXD_N => '0',
            LANE1_RXD_P => '0',
            REF_Clock => SYSCLK,
            CTRL_Clock_40M => SYSCLK,
            Logic_Clock => SYSCLK,
            Logic_Reset_N => NSYSRESET,
            Gen_Enable => '0',
            write_read => '0',
            addr_frame => (others=> '0'),
            enable_cmd => '0',
            write_data_frame => (others=> '0'),

            -- Outputs
            LANE1_TXD_N =>  open,
            LANE0_TXD_P =>  open,
            LANE0_TXD_N =>  open,
            LANE1_TXD_P =>  open,
            Data_Valid =>  open,
            Output_Data_7 => open,
            Output_Data_0 => open,
            Output_Data_1 => open,
            Output_Data_2 => open,
            Output_Data_3 => open,
            Output_Data_4 => open,
            Output_Data_5 => open,
            Output_Data_6 => open,
            busy =>  open,
            read_data_frame => open

            -- Inouts

        );

end behavioral;

