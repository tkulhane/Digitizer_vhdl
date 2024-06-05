--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: xxx_TRV.vhd
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

entity xxx_TRV is
end xxx_TRV;

architecture behavioral of xxx_TRV is

    constant SYSCLK_PERIOD : time := 100 ns; -- 10MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';

    component Transceiver_Main
        -- ports
        port( 
            -- Inputs
            REF_Clock : in std_logic;
            CTRL_Clock_40M : in std_logic;
            Logic_Clock : in std_logic;
            Logic_Reset_N : in std_logic;
            Gen_Enable : in std_logic;
            write_read : in std_logic;
            enable_cmd : in std_logic;
            REF_Reset_N : in std_logic;
            CTRL_Clock : in std_logic;
            CTRL_Reset_N : in std_logic;
            addr_frame : in std_logic_vector(7 downto 0);
            write_data_frame : in std_logic_vector(15 downto 0);
            LANE_RXD_N_Vector : in std_logic_vector(5 downto 0);
            LANE_RXD_P_Vector : in std_logic_vector(5 downto 0);

            -- Outputs
            Data_Valid : out std_logic;
            busy : out std_logic;
            SYNCINB_OUT : out std_logic;
            AlignmentFifo_Read_Out : out std_logic;
            read_data_frame : out std_logic_vector(15 downto 0);
            Output_Data : out std_logic_vector(383 downto 0);
            AlignmentFifo_Rx_Data : out std_logic_vector(383 downto 0);
            Transceivers_Rx_Data : out std_logic_vector(383 downto 0);
            Transceivers_Rx_K : out std_logic_vector(47 downto 0);
            LANE_TXD_N_Vector : out std_logic_vector(5 downto 0);
            LANE_TXD_P_Vector : out std_logic_vector(5 downto 0)

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
            REF_Clock => SYSCLK,
            CTRL_Clock_40M => SYSCLK,
            Logic_Clock => SYSCLK,
            Logic_Reset_N => NSYSRESET,
            Gen_Enable => '0',
            write_read => '0',
            enable_cmd => '0',
            REF_Reset_N => NSYSRESET,
            CTRL_Clock => SYSCLK,
            CTRL_Reset_N => NSYSRESET,
            addr_frame => (others=> '0'),
            write_data_frame => (others=> '0'),
            LANE_RXD_N_Vector => (others=> '0'),
            LANE_RXD_P_Vector => (others=> '0'),

            -- Outputs
            Data_Valid =>  open,
            busy =>  open,
            SYNCINB_OUT =>  open,
            AlignmentFifo_Read_Out =>  open,
            read_data_frame => open,
            Output_Data => open,
            AlignmentFifo_Rx_Data => open,
            Transceivers_Rx_Data => open,
            Transceivers_Rx_K => open,
            LANE_TXD_N_Vector => open,
            LANE_TXD_P_Vector => open

            -- Inouts

        );

end behavioral;

