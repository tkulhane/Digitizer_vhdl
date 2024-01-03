--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: TB_DataSource_Transciever.vhd
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

entity TB_DataSource_Transciever is
end TB_DataSource_Transciever;

architecture behavioral of TB_DataSource_Transciever is

    constant SYSCLK_PERIOD : time := 8 ns; 
    constant REF_Clock_PERIOD : time := 6.25 ns; 
    constant CTRL_CLock_40M_PERIOD : time := 25 ns; 

    
    
    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';
    
    signal REF_Clock : std_logic := '0';
    signal CTRL_CLock_40M : std_logic := '0';
    
    signal Gen_Enable : std_logic := '1';
    
    signal Output_Data_3_1 : std_logic_vector(11 downto 0);
    signal Output_Data_0_1 : std_logic_vector(11 downto 0);
    signal Output_Data_1_1 : std_logic_vector(11 downto 0);
    signal Output_Data_2_1 : std_logic_vector(11 downto 0);
    signal Output_Data_0_0 : std_logic_vector(11 downto 0);
    signal Output_Data_1_0 : std_logic_vector(11 downto 0);
    signal Output_Data_2_0 : std_logic_vector(11 downto 0);
    signal Output_Data_3_0 : std_logic_vector(11 downto 0);
    
    signal LANE0_P :  std_logic;
    signal LANE0_N :  std_logic;
    signal LANE1_P :  std_logic;
    signal LANE1_N :  std_logic;
    

    
    
    component DataSource_Transcievers
        -- ports
        port( 
            -- Inputs
            LANE0_RXD_P : in std_logic;
            LANE0_RXD_N : in std_logic;
            LANE1_RXD_P : in std_logic;
            LANE1_RXD_N : in std_logic;
            Gen_Enable : in std_logic;
            REF_Clock : in std_logic;
            CTRL_CLock_40M : in std_logic;
            
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
            Data_Valid : out std_logic;
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
    
    REF_Clock <= not REF_Clock after (REF_Clock_PERIOD / 2.0 );
    CTRL_CLock_40M <= not CTRL_CLock_40M after (CTRL_CLock_40M_PERIOD / 2.0 );

    -- Instantiate Unit Under Test:  DataSource_Transcievers
    DataSource_Transcievers_0 : DataSource_Transcievers
        -- port map
        port map( 
            -- Inputs
            LANE0_RXD_P => LANE0_P,
            LANE0_RXD_N => LANE0_N,
            LANE1_RXD_P => LANE1_P,
            LANE1_RXD_N => LANE1_N,
            
            Gen_Enable => Gen_Enable,
            
            REF_Clock => REF_Clock,
            CTRL_CLock_40M => CTRL_CLock_40M,
            Logic_Clock => SYSCLK,
            Logic_Reset_N => NSYSRESET,

            -- Outputs
            Output_Data_3_1 => Output_Data_3_1,
            Output_Data_0_1 => Output_Data_0_1,
            Output_Data_1_1 => Output_Data_1_1,
            Output_Data_2_1 => Output_Data_2_1,
            Output_Data_0_0 => Output_Data_0_0,
            Output_Data_1_0 => Output_Data_1_0,
            Output_Data_2_0 => Output_Data_2_0,
            Output_Data_3_0 => Output_Data_3_0,
            Data_Valid => open,
            
            LANE0_TXD_P =>  LANE1_P,
            LANE0_TXD_N =>  LANE1_N,
            LANE1_TXD_P =>  LANE0_P,
            LANE1_TXD_N =>  LANE0_N

            -- Inouts

        );

end behavioral;

