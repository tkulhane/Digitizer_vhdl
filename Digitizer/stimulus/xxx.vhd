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

    component Transciever_OneLane
        -- ports
        port( 
            -- Inputs
            Logic_Clock : in std_logic;
            CTRL_RST_N : in std_logic;
            CTRL_CLK : in std_logic;
            Read_Enable : in std_logic;
            Logic_Reser_N : in std_logic;
            REF_CLK : in std_logic;
            LANE0_RXD_P : in std_logic;
            LANE0_RXD_N : in std_logic;
            SYNC_OK : in std_logic;
            CTRL_Fault_CLR : in std_logic;
            LANE_CLK_REF : in std_logic;
            Input_Data : in std_logic_vector(63 downto 0);
            CLKS_FROM_TXPLL_0_TX_PLL_LOCK_0 : in std_logic;
            CLKS_FROM_TXPLL_0_TX_BIT_CLK_0 : in std_logic;
            CLKS_FROM_TXPLL_0_TX_PLL_REF_CLK_0 : in std_logic;

            -- Outputs
            Input_MainData_Read : out std_logic;
            Empty_For_NonAll : out std_logic;
            CTRL_Data_Go : out std_logic;
            CTRL_Synced : out std_logic;
            CTRL_ILAS_Go : out std_logic;
            LANE0_TXD_P : out std_logic;
            LANE0_TXD_N : out std_logic;
            CTRL_Fault : out std_logic;
            StatusVector : out std_logic_vector(31 downto 0);
            LANE_RX_DATA : out std_logic_vector(63 downto 0);
            LANE_RX_K : out std_logic_vector(7 downto 0);
            Output_Data : out std_logic_vector(63 downto 0)

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

    -- Instantiate Unit Under Test:  Transciever_OneLane
    Transciever_OneLane_0 : Transciever_OneLane
        -- port map
        port map( 
            -- Inputs
            Logic_Clock => SYSCLK,
            CTRL_RST_N => NSYSRESET,
            CTRL_CLK => SYSCLK,
            Read_Enable => '0',
            Logic_Reser_N => '0',
            REF_CLK => SYSCLK,
            LANE0_RXD_P => '0',
            LANE0_RXD_N => '0',
            SYNC_OK => '0',
            CTRL_Fault_CLR => '0',
            LANE_CLK_REF => SYSCLK,
            Input_Data => (others=> '0'),
            CLKS_FROM_TXPLL_0_TX_PLL_LOCK_0 => SYSCLK,
            CLKS_FROM_TXPLL_0_TX_BIT_CLK_0 => SYSCLK,
            CLKS_FROM_TXPLL_0_TX_PLL_REF_CLK_0 => SYSCLK,

            -- Outputs
            Input_MainData_Read =>  open,
            Empty_For_NonAll =>  open,
            CTRL_Data_Go =>  open,
            CTRL_Synced =>  open,
            CTRL_ILAS_Go =>  open,
            LANE0_TXD_P =>  open,
            LANE0_TXD_N =>  open,
            CTRL_Fault =>  open,
            StatusVector => open,
            LANE_RX_DATA => open,
            LANE_RX_K => open,
            Output_Data => open

            -- Inouts

        );

end behavioral;

