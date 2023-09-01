--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: TB_Transceiver_4.vhd
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

entity TB_Transceiver_4 is
end TB_Transceiver_4;

architecture behavioral of TB_Transceiver_4 is

    constant SYSCLK_PERIOD : time := 10 ns; -- 100MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';


    signal LANE0_P : std_logic;
    signal LANE0_N : std_logic;
    signal LANE1_P : std_logic;
    signal LANE1_N : std_logic;
    signal LANE2_P : std_logic;
    signal LANE2_N : std_logic;
    signal LANE3_P : std_logic;
    signal LANE3_N : std_logic;

    signal SYNC_OK : std_logic;

    signal LANE0_RX_DATA :  std_logic_vector(63 downto 0);
    signal LANE1_RX_DATA :  std_logic_vector(63 downto 0);
    signal LANE2_RX_DATA :  std_logic_vector(63 downto 0);
    signal LANE3_RX_DATA :  std_logic_vector(63 downto 0);
    signal LANE0_8B10B_RX_K :  std_logic_vector(7 downto 0);
    signal LANE1_8B10B_RX_K :  std_logic_vector(7 downto 0);
    signal LANE2_8B10B_RX_K :  std_logic_vector(7 downto 0);
    signal LANE3_8B10B_RX_K :  std_logic_vector(7 downto 0);


    component Transceiver
        -- ports
        port( 
            -- Inputs
            LANE0_RXD_P : in std_logic;
            LANE0_RXD_N : in std_logic;
            LANE1_RXD_P : in std_logic;
            LANE1_RXD_N : in std_logic;
            LANE2_RXD_P : in std_logic;
            LANE2_RXD_N : in std_logic;
            LANE3_RXD_P : in std_logic;
            LANE3_RXD_N : in std_logic;

            -- Outputs
            LANE0_TXD_P : out std_logic;
            LANE0_TXD_N : out std_logic;
            LANE1_TXD_P : out std_logic;
            LANE1_TXD_N : out std_logic;
            LANE2_TXD_P : out std_logic;
            LANE2_TXD_N : out std_logic;
            LANE3_TXD_P : out std_logic;
            LANE3_TXD_N : out std_logic;

            SYNC_OK : out std_logic;

            LANE0_8B10B_RX_K : out std_logic_vector(7 downto 0);
            LANE1_8B10B_RX_K : out std_logic_vector(7 downto 0);
            LANE2_8B10B_RX_K : out std_logic_vector(7 downto 0);
            LANE3_8B10B_RX_K : out std_logic_vector(7 downto 0);

            LANE0_RX_DATA : out std_logic_vector(63 downto 0);
            LANE1_RX_DATA : out std_logic_vector(63 downto 0);
            LANE2_RX_DATA : out std_logic_vector(63 downto 0);
            LANE3_RX_DATA : out std_logic_vector(63 downto 0)

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
            LANE1_RXD_P => LANE1_P,
            LANE1_RXD_N => LANE1_N,
            LANE2_RXD_P => LANE2_P,
            LANE2_RXD_N => LANE2_N,
            LANE3_RXD_P => LANE3_P,
            LANE3_RXD_N => LANE3_N,

            -- Outputs
            LANE0_TXD_P =>  LANE0_P,
            LANE0_TXD_N =>  LANE0_N,
            LANE1_TXD_P =>  LANE1_P,
            LANE1_TXD_N =>  LANE1_N,
            LANE2_TXD_P =>  LANE2_P,
            LANE2_TXD_N =>  LANE2_N,
            LANE3_TXD_P =>  LANE3_P,
            LANE3_TXD_N =>  LANE3_N,
            
            SYNC_OK =>  SYNC_OK,
            
            LANE0_8B10B_RX_K => LANE0_8B10B_RX_K,
            LANE1_8B10B_RX_K => LANE1_8B10B_RX_K,
            LANE2_8B10B_RX_K => LANE2_8B10B_RX_K,
            LANE3_8B10B_RX_K => LANE3_8B10B_RX_K,
            
            LANE0_RX_DATA => LANE0_RX_DATA,
            LANE1_RX_DATA => LANE1_RX_DATA,
            LANE2_RX_DATA => LANE2_RX_DATA,
            LANE3_RX_DATA => LANE3_RX_DATA

            -- Inouts

        );

end behavioral;

