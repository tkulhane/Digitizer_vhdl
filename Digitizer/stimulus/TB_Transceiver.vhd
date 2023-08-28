--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: TB_Transceiver.vhd
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

entity TB_Transceiver is
end TB_Transceiver;

architecture behavioral of TB_Transceiver is

    constant SYSCLK_PERIOD : time := 10 ns; -- 100MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';

    signal LANE0_P : std_logic;
    signal LANE0_N : std_logic;

    signal SYNC_OK : std_logic;

    signal LANE0_TX_CLK_STABLE : std_logic;
    signal LANE0_RX_CLK_R : std_logic;
    signal LANE0_RX_IDLE : std_logic;
    signal LANE0_RX_READY : std_logic;
    signal LANE0_RX_VAL : std_logic;
    signal LANE0_TX_CLK_R : std_logic;
    signal LANE0_8B10B_RX_K : std_logic_vector(7 downto 0);
    signal LANE0_RX_CODE_VIOLATION : std_logic_vector(7 downto 0);
    signal LANE0_RX_DATA : std_logic_vector(63 downto 0);
    signal LANE0_RX_DISPARITY_ERROR : std_logic_vector(7 downto 0);
    signal LANE0_RX_READY_CDR : std_logic;
    signal LANE0_RX_VAL_CDR : std_logic;


    component Transceiver
        -- ports
        port( 
            -- Inputs
            LANE0_RXD_P : in std_logic;
            LANE0_RXD_N : in std_logic;
            

            -- Outputs
            LANE0_TXD_P : out std_logic;
            LANE0_TXD_N : out std_logic;
            LANE0_TX_CLK_STABLE : out std_logic;
            LANE0_RX_CLK_R : out std_logic;
            LANE0_RX_IDLE : out std_logic;
            LANE0_RX_READY : out std_logic;
            LANE0_RX_VAL : out std_logic;
            LANE0_TX_CLK_R : out std_logic;
            LANE0_8B10B_RX_K : out std_logic_vector(7 downto 0);
            LANE0_RX_CODE_VIOLATION : out std_logic_vector(7 downto 0);
            LANE0_RX_DATA : out std_logic_vector(63 downto 0);
            LANE0_RX_DISPARITY_ERROR : out std_logic_vector(7 downto 0);
            LANE0_RX_READY_CDR : out std_logic;
            LANE0_RX_VAL_CDR : out std_logic;
            
            SYNC_OK : out std_logic

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

    -- Instantiate Unit Under Test:  Transceiver
    Transceiver_0 : Transceiver
        -- port map
        port map( 
            -- Inputs
            LANE0_RXD_P => LANE0_P,
            LANE0_RXD_N => LANE0_N,
            

            -- Outputs
            LANE0_TXD_P =>  LANE0_P,
            LANE0_TXD_N =>  LANE0_N,
            LANE0_TX_CLK_STABLE =>  LANE0_TX_CLK_STABLE,
            LANE0_RX_CLK_R =>  LANE0_RX_CLK_R,
            LANE0_RX_IDLE =>  LANE0_RX_IDLE,
            LANE0_RX_READY =>  LANE0_RX_READY,
            LANE0_RX_VAL =>  LANE0_RX_VAL,
            LANE0_TX_CLK_R =>  LANE0_TX_CLK_R,
            LANE0_8B10B_RX_K => LANE0_8B10B_RX_K,
            LANE0_RX_CODE_VIOLATION => LANE0_RX_CODE_VIOLATION,
            LANE0_RX_DATA => LANE0_RX_DATA,
            LANE0_RX_DISPARITY_ERROR => LANE0_RX_DISPARITY_ERROR,
            LANE0_RX_READY_CDR => LANE0_RX_READY_CDR,
            LANE0_RX_VAL_CDR => LANE0_RX_VAL_CDR,

            SYNC_OK => SYNC_OK

            -- Inouts

        );

end behavioral;

