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

    constant SYSCLK_PERIOD : time := 10 ns; -- 100MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';
    
    signal Gen_Enable : std_logic := '1';
    
    signal Output_Data_3_1 : std_logic_vector(11 downto 0);
    signal Output_Data_0_1 : std_logic_vector(11 downto 0);
    signal Output_Data_1_1 : std_logic_vector(11 downto 0);
    signal Output_Data_2_1 : std_logic_vector(11 downto 0);
    signal Output_Data_0_0 : std_logic_vector(11 downto 0);
    signal Output_Data_1_0 : std_logic_vector(11 downto 0);
    signal Output_Data_2_0 : std_logic_vector(11 downto 0);
    signal Output_Data_3_0 : std_logic_vector(11 downto 0);
    
    

    component DataSource_Transcievers
        -- ports
        port( 
            -- Inputs
            Gen_Enable : in std_logic;
            Clock : in std_logic;
            Reset_N : in std_logic;

            -- Outputs
            Output_Data_3_1 : out std_logic_vector(11 downto 0);
            Output_Data_0_1 : out std_logic_vector(11 downto 0);
            Output_Data_1_1 : out std_logic_vector(11 downto 0);
            Output_Data_2_1 : out std_logic_vector(11 downto 0);
            Output_Data_0_0 : out std_logic_vector(11 downto 0);
            Output_Data_1_0 : out std_logic_vector(11 downto 0);
            Output_Data_2_0 : out std_logic_vector(11 downto 0);
            Output_Data_3_0 : out std_logic_vector(11 downto 0)

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
            Gen_Enable => Gen_Enable,
            Clock => SYSCLK,
            Reset_N => NSYSRESET,

            -- Outputs
            Output_Data_3_1 => Output_Data_3_1,
            Output_Data_0_1 => Output_Data_0_1,
            Output_Data_1_1 => Output_Data_1_1,
            Output_Data_2_1 => Output_Data_2_1,
            Output_Data_0_0 => Output_Data_0_0,
            Output_Data_1_0 => Output_Data_1_0,
            Output_Data_2_0 => Output_Data_2_0,
            Output_Data_3_0 => Output_Data_3_0

            -- Inouts

        );

end behavioral;

