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
            Input_MainData : in std_logic_vector(63 downto 0);

            -- Outputs
            Input_MainData_Read : out std_logic;
            Empty_For_NonAll : out std_logic;
            CTRL_Data_Go : out std_logic;
            CTRL_Synced : out std_logic;
            CTRL_ILAS_Go : out std_logic;
            LANE0_TXD_P : out std_logic;
            LANE0_TXD_N : out std_logic;
            Output_Data_1 : out std_logic_vector(11 downto 0);
            Output_Data_0 : out std_logic_vector(11 downto 0);
            Output_Data_2 : out std_logic_vector(11 downto 0);
            Output_Data_3 : out std_logic_vector(11 downto 0);
            Tx_FIFO_FULL : out std_logic;
            Tx_FIFO_EMPTY : out std_logic;
            Rx_FIFO_FULL : out std_logic;
            Rx_FIFO_EMPTY : out std_logic

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
            Input_MainData => (others=> '0'),

            -- Outputs
            Input_MainData_Read =>  open,
            Empty_For_NonAll =>  open,
            CTRL_Data_Go =>  open,
            CTRL_Synced =>  open,
            CTRL_ILAS_Go =>  open,
            LANE0_TXD_P =>  open,
            LANE0_TXD_N =>  open,
            Output_Data_1 => open,
            Output_Data_0 => open,
            Output_Data_2 => open,
            Output_Data_3 => open,
            Tx_FIFO_FULL =>  open,
            Tx_FIFO_EMPTY =>  open,
            Rx_FIFO_FULL =>  open,
            Rx_FIFO_EMPTY =>  open

            -- Inouts

        );

end behavioral;

