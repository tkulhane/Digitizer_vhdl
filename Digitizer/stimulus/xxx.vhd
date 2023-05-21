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

    component Data_Block
        -- ports
        port( 
            -- Inputs
            C_enable_cmd : in std_logic;
            C_write_read : in std_logic;
            Clock : in std_logic;
            Reset_N : in std_logic;
            Communication_Data_Full : in std_logic;
            C_addr_frame : in std_logic_vector(7 downto 0);
            C_write_data_frame : in std_logic_vector(15 downto 0);
            Communication_DATA_Ack : in std_logic;

            -- Outputs
            C_busy : out std_logic;
            Communication_Data_Enable : out std_logic;
            Communication_Data_Req : out std_logic;
            C_read_data_frame : out std_logic_vector(15 downto 0);
            Communication_Data_Frame : out std_logic_vector(31 downto 0);
            Diag_0 : out std_logic;
            Diag_1 : out std_logic;
            Diag_2 : out std_logic

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

    -- Instantiate Unit Under Test:  Data_Block
    Data_Block_0 : Data_Block
        -- port map
        port map( 
            -- Inputs
            C_enable_cmd => '0',
            C_write_read => '0',
            Clock => SYSCLK,
            Reset_N => NSYSRESET,
            Communication_Data_Full => '0',
            C_addr_frame => (others=> '0'),
            C_write_data_frame => (others=> '0'),
            Communication_DATA_Ack => '0',

            -- Outputs
            C_busy =>  open,
            Communication_Data_Enable =>  open,
            Communication_Data_Req =>  open,
            C_read_data_frame => open,
            Communication_Data_Frame => open,
            Diag_0 =>  open,
            Diag_1 =>  open,
            Diag_2 =>  open

            -- Inouts

        );

end behavioral;

