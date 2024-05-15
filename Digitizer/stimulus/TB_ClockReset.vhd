--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: TB_ClockReset.vhd
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

entity TB_ClockReset is
end TB_ClockReset;

architecture behavioral of TB_ClockReset is

    constant SYSCLK_PERIOD : time := 100 ns; -- 10MHZ

    constant ClkHmc_PERIOD : time := 20 ns;
    constant ClkExt1_PERIOD : time := 10 ns;
    constant ClkExt2_PERIOD : time := 5 ns;

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';


------------------------------------------------------------------------------------------------------------
--Signals Declaration
------------------------------------------------------------------------------------------------------------

    signal CTRL_enable_cmd : std_logic;
    signal CTRL_write_read : std_logic;
    signal CTRL_busy    : std_logic;
    signal CTRL_addr_frame : std_logic_vector(7 downto 0);
    signal CTRL_write_data_frame : std_logic_vector(15 downto 0);
    signal CTRL_read_data_frame : std_logic_vector(15 downto 0);

    signal EXT_RST_N : std_logic;

    signal ClockInput_ExtHMC : std_logic := '0';
    signal ClockInput_Ext1 : std_logic := '0';
    signal ClockInput_Ext2 : std_logic := '0';

    signal Main_CLOCK : std_logic;
    signal Main_RESET_N : std_logic;
    signal UART_CLOCK : std_logic;
    signal UART_RESER_N : std_logic;
    signal HMC_CLK : std_logic;
    signal XCVR_CTRL_Clock_40M : std_logic;

    signal Clock_LogicData : std_logic;
    signal Reset_N_LogicData : std_logic;
    signal Reset_N_XcvrRef : std_logic;
    signal Clock_XcvrRef : std_logic;

------------------------------------------------------------------------------------------------------------
--Component
------------------------------------------------------------------------------------------------------------   

    component Clock_Reset
        -- ports
        port( 
            -- Inputs
            EXT_RST_N : in std_logic;
            write_read : in std_logic;
            addr_frame : in std_logic_vector(7 downto 0);
            enable_cmd : in std_logic;
            write_data_frame : in std_logic_vector(15 downto 0);
            ClockInput_ExtHMC : in std_logic;
            ClockInput_Ext1 : in std_logic;
            ClockInput_Ext2 : in std_logic;

            -- Outputs
            Main_CLOCK : out std_logic;
            Main_RESET_N : out std_logic;
            UART_CLOCK : out std_logic;
            UART_RESER_N : out std_logic;
            HMC_CLK : out std_logic;
            XCVR_CTRL_Clock_40M : out std_logic;
            busy : out std_logic;
            read_data_frame : out std_logic_vector(15 downto 0);
            Clock_LogicData : out std_logic;
            Reset_N_LogicData : out std_logic;
            Reset_N_XcvrRef : out std_logic;
            Clock_XcvrRef : out std_logic

            -- Inouts

        );
    end component;


------------------------------------------------------------------------------------------------------------
--Procedure
------------------------------------------------------------------------------------------------------------
    procedure SEND_CMD( REG_ADDR : in std_logic_vector(7 downto 0);
                        REG_DATA : in std_logic_vector(15 downto 0);
                        Write_Read : in std_logic;

                        signal Clock : in std_logic;
                        signal CTRL_addr_frame : out std_logic_vector(7 downto 0);
                        signal CTRL_write_data_frame : out std_logic_vector(15 downto 0);
                        signal CTRL_enable_cmd : out std_logic;
                        signal CTRL_write_read : out std_logic;
                        signal CTRL_busy : in std_logic
                    ) is
    begin

        wait until Clock'event and Clock = '1';

        CTRL_addr_frame <= REG_ADDR;
        CTRL_write_data_frame <= REG_DATA;

        CTRL_write_read <= Write_Read;

        CTRL_enable_cmd <= '1';
        wait until CTRL_busy'event and CTRL_busy = '1';
        wait until Clock'event and Clock = '1';
        CTRL_enable_cmd <= '0';
        wait until CTRL_busy'event and CTRL_busy = '0';
        CTRL_enable_cmd <= '0';
        wait until Clock'event and Clock = '1';

    end SEND_CMD; 



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


    ClockInput_ExtHMC <= not ClockInput_ExtHMC after (ClkHmc_PERIOD / 2.0 );
    ClockInput_Ext1 <= not ClockInput_Ext1 after (ClkExt1_PERIOD / 2.0 );
    ClockInput_Ext2 <= not ClockInput_Ext2 after (ClkExt2_PERIOD / 2.0 );



    -- Instantiate Unit Under Test:  Clock_Reset
    Clock_Reset_0 : Clock_Reset
        -- port map
        port map( 
            -- Inputs
            EXT_RST_N => '1',
            write_read => CTRL_write_read,
            addr_frame => CTRL_addr_frame,
            enable_cmd => CTRL_enable_cmd,
            write_data_frame => CTRL_write_data_frame,
            ClockInput_ExtHMC => ClockInput_ExtHMC,
            ClockInput_Ext1 => ClockInput_Ext1,
            ClockInput_Ext2 => '0',--ClockInput_Ext2,

            -- Outputs
            Main_CLOCK =>  Main_CLOCK,
            Main_RESET_N =>  Main_RESET_N,
            UART_CLOCK =>  UART_CLOCK,
            UART_RESER_N =>  UART_RESER_N,
            HMC_CLK =>  HMC_CLK,
            XCVR_CTRL_Clock_40M =>  XCVR_CTRL_Clock_40M,
            busy =>  CTRL_busy,
            read_data_frame => CTRL_read_data_frame,
            Clock_LogicData =>  Clock_LogicData,
            Reset_N_LogicData =>  Reset_N_LogicData,
            Reset_N_XcvrRef =>  Reset_N_XcvrRef,
            Clock_XcvrRef =>  Clock_XcvrRef

            -- Inouts

        );


------------------------------------------------------------------------------------------------------------
--Test Process
------------------------------------------------------------------------------------------------------------
    process
 
    begin

        wait until Main_RESET_N'event and Main_RESET_N = '1';
        wait for 100 ns;
        wait until Main_CLOCK'event and Main_CLOCK = '1';

        wait for 2000 ns;

        --read threshold
        SEND_CMD( x"11", X"0000", '1', Main_CLOCK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        
        wait for 3 us;
        SEND_CMD( x"11", X"0001", '0', Main_CLOCK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);

        wait for 3 us;
        SEND_CMD( x"11", X"0002", '0', Main_CLOCK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);

        wait for 5 us;
        SEND_CMD( x"11", X"0001", '0', Main_CLOCK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);

        wait for 5 us;
        SEND_CMD( x"11", X"0003", '0', Main_CLOCK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);

        wait for 10 us;
        SEND_CMD( x"11", X"0001", '0', Main_CLOCK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);

        wait for 10 us;
        SEND_CMD( x"11", X"0000", '0', Main_CLOCK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);



        
        wait for 10 us;
        --SEND_CMD( X"04", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        --SEND_CMD( X"06", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
       
       
        wait;

    end process;

end behavioral;

