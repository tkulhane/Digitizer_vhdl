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

    component DataSource_Transcievers
        -- ports
        port( 
            -- Inputs
            LANE0_RXD_P : in std_logic;
            LANE0_RXD_N : in std_logic;
            LANE1_RXD_P : in std_logic;
            LANE1_RXD_N : in std_logic;
            Gen_Enable : in std_logic;
            Logic_Clock : in std_logic;
            Logic_Reset_N : in std_logic;

            -- Outputs
            LANE0_TXD_P : out std_logic;
            LANE0_TXD_N : out std_logic;
            Output_Data_3_1 : out std_logic_vector(11 downto 0);
            Output_Data_3_0 : out std_logic_vector(11 downto 0);
            Output_Data_1_1 : out std_logic_vector(11 downto 0);
            Output_Data_1_0 : out std_logic_vector(11 downto 0);
            Output_Data_0_1 : out std_logic_vector(11 downto 0);
            Output_Data_0_0 : out std_logic_vector(11 downto 0);
            Output_Data_2_1 : out std_logic_vector(11 downto 0);
            Output_Data_2_0 : out std_logic_vector(11 downto 0);
            LANE1_TXD_P : out std_logic;
            LANE1_TXD_N : out std_logic

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

    -- Instantiate Unit Under Test:  DataSource_Transcievers
    DataSource_Transcievers_0 : DataSource_Transcievers
        -- port map
        port map( 
            -- Inputs
            LANE0_RXD_P => '0',
            LANE0_RXD_N => '0',
            LANE1_RXD_P => '0',
            LANE1_RXD_N => '0',
            Gen_Enable => '0',
            Logic_Clock => SYSCLK,
            Logic_Reset_N => NSYSRESET,

            -- Outputs

            Output_Data_3_1 => open,
            Output_Data_3_0 => open,
            Output_Data_1_1 => open,
            Output_Data_1_0 => open,
            Output_Data_0_1 => open,
            Output_Data_0_0 => open,
            Output_Data_2_1 => open,
            Output_Data_2_0 => open,
            
            LANE0_TXD_P =>  open,
            LANE0_TXD_N =>  open,
            LANE1_TXD_P =>  open,
            LANE1_TXD_N =>  open

            -- Inouts

        );

end behavioral;

