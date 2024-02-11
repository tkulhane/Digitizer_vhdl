--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: TB_Transceiver_Main.vhd
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

entity TB_Transceiver_Main is
end TB_Transceiver_Main;

architecture behavioral of TB_Transceiver_Main is

    constant SYSCLK_PERIOD : time := 8 ns; 
    constant REF_Clock_PERIOD : time := 6.25 ns; 
    constant CTRL_CLock_40M_PERIOD : time := 25 ns; 

    
    
    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';
    
    signal REF_Clock : std_logic := '0';
    signal CTRL_CLock_40M : std_logic := '0';
    
    signal Gen_Enable : std_logic := '1';
    
    signal Output_Data_0 :  std_logic_vector(11 downto 0);
    signal Output_Data_1 :  std_logic_vector(11 downto 0);
    signal Output_Data_2 :  std_logic_vector(11 downto 0);
    signal Output_Data_3 :  std_logic_vector(11 downto 0);
    signal Output_Data_4 :  std_logic_vector(11 downto 0);
    signal Output_Data_5 :  std_logic_vector(11 downto 0);
    signal Output_Data_6 :  std_logic_vector(11 downto 0);
    signal Output_Data_7 :  std_logic_vector(11 downto 0);
    
    signal LANE0_P :  std_logic;
    signal LANE0_N :  std_logic;
    signal LANE1_P :  std_logic;
    signal LANE1_N :  std_logic;



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
            Output_Data_6 : out std_logic_vector(83 downto 72)

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
    
    REF_Clock <= not REF_Clock after (REF_Clock_PERIOD / 2.0 );
    CTRL_CLock_40M <= not CTRL_CLock_40M after (CTRL_CLock_40M_PERIOD / 2.0 );



    -- Instantiate Unit Under Test:  Transceiver_Main
    Transceiver_Main_0 : Transceiver_Main
        -- port map
        port map( 
            -- Inputs
            
            LANE0_RXD_P => LANE0_P,
            LANE0_RXD_N => LANE0_N,
            LANE1_RXD_P => LANE1_P,
            LANE1_RXD_N => LANE1_N,


            REF_Clock => REF_Clock,
            CTRL_Clock_40M => CTRL_Clock_40M,
            Logic_Clock => SYSCLK,
            Logic_Reset_N => NSYSRESET,
            
            Gen_Enable => Gen_Enable,

            -- Outputs
            
            Output_Data_7 => Output_Data_7,
            Output_Data_0 => Output_Data_0,
            Output_Data_1 => Output_Data_1,
            Output_Data_2 => Output_Data_2,
            Output_Data_3 => Output_Data_3,
            Output_Data_4 => Output_Data_4,
            Output_Data_5 => Output_Data_5,
            Output_Data_6 => Output_Data_6,

            Data_Valid =>  open,

            LANE0_TXD_P =>  LANE1_P,
            LANE0_TXD_N =>  LANE1_N,
            LANE1_TXD_P =>  LANE0_P, 
            LANE1_TXD_N =>  LANE0_N

            -- Inouts

        );

end behavioral;

