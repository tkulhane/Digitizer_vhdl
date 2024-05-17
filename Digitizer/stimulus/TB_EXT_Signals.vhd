--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: TB_EXT_Signals.vhd
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

entity TB_EXT_Signals is
end TB_EXT_Signals;

architecture behavioral of TB_EXT_Signals is

    constant SYSCLK_PERIOD : time := 10 ns; -- 100MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';


    signal EIO_PAD_9 :  std_logic;
    signal EIO_PAD_8 :  std_logic;
    signal EIO_PAD_7 :  std_logic;
    signal EIO_PAD_6 :  std_logic;
    signal EIO_PAD_5 :  std_logic;
    signal EIO_PAD_4 :  std_logic;
    signal EIO_PAD_3 :  std_logic;
    signal EIO_PAD_2 :  std_logic;
    signal EIO_PAD_1 :  std_logic;
    signal EIO_PAD_0 :  std_logic;


    signal CTRL_enable_cmd : std_logic;
    signal CTRL_write_read : std_logic;
    signal CTRL_busy    : std_logic;
    signal CTRL_addr_frame : std_logic_vector(7 downto 0);
    signal CTRL_write_data_frame : std_logic_vector(15 downto 0);
    signal CTRL_read_data_frame : std_logic_vector(15 downto 0);

    signal EXT_OutputsVectorSignals :  std_logic_vector(31 downto 0);
    signal EXT_InputsVectorSignals :  std_logic_vector(31 downto 0);

    component EXT_Signals
        -- ports
        port( 
            -- Inputs
            write_read : in std_logic;
            Clock : in std_logic;
            Reset_N : in std_logic;
            enable_cmd : in std_logic;
            addr_frame : in std_logic_vector(7 downto 0);
            write_data_frame : in std_logic_vector(15 downto 0);
            EXT_OutputsVectorSignals : in std_logic_vector(31 downto 0);

            -- Outputs
            busy : out std_logic;
            read_data_frame : out std_logic_vector(15 downto 0);
            EXT_InputsVectorSignals : out std_logic_vector(31 downto 0);

            -- Inouts
            EIO_PAD_9 : inout std_logic;
            EIO_PAD_8 : inout std_logic;
            EIO_PAD_7 : inout std_logic;
            EIO_PAD_6 : inout std_logic;
            EIO_PAD_5 : inout std_logic;
            EIO_PAD_4 : inout std_logic;
            EIO_PAD_3 : inout std_logic;
            EIO_PAD_2 : inout std_logic;
            EIO_PAD_1 : inout std_logic;
            EIO_PAD_0 : inout std_logic

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

    -- Instantiate Unit Under Test:  EXT_Signals
    EXT_Signals_0 : EXT_Signals
        -- port map
        port map( 
            -- Inputs
            write_read => CTRL_write_read,
            Clock => SYSCLK,
            Reset_N => NSYSRESET,
            enable_cmd => CTRL_enable_cmd,
            addr_frame => CTRL_addr_frame,
            write_data_frame => CTRL_write_data_frame,
            EXT_OutputsVectorSignals => EXT_OutputsVectorSignals,

            -- Outputs
            busy =>  CTRL_busy,
            read_data_frame => CTRL_read_data_frame,
            EXT_InputsVectorSignals => EXT_InputsVectorSignals,

            -- Inouts
            EIO_PAD_9 =>  EIO_PAD_9,
            EIO_PAD_8 =>  EIO_PAD_8,
            EIO_PAD_7 =>  EIO_PAD_7,
            EIO_PAD_6 =>  EIO_PAD_6,
            EIO_PAD_5 =>  EIO_PAD_5,
            EIO_PAD_4 =>  EIO_PAD_4,
            EIO_PAD_3 =>  EIO_PAD_3,
            EIO_PAD_2 =>  EIO_PAD_2,
            EIO_PAD_1 =>  EIO_PAD_1,
            EIO_PAD_0 =>  EIO_PAD_0

        );




------------------------------------------------------------------------------------------------------------
--Test Process
------------------------------------------------------------------------------------------------------------
    process
 
    begin

        EXT_OutputsVectorSignals <= (others => '0');

        wait until NSYSRESET'event and NSYSRESET = '1';
        wait for 100 ns;
        wait until SYSCLK'event and SYSCLK = '1';

        wait for 2000 ns;


        --set out 0
        SEND_CMD( x"6E", X"0000", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        
        wait for 1 us;
        --set out 1
        SEND_CMD( x"6F", X"0001", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);

        wait for 1 us;
        --output enable
        SEND_CMD( x"6D", X"0003", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);

        wait for 2 us;
        EXT_OutputsVectorSignals(0) <= '1';
        wait for 2 us;
        EXT_OutputsVectorSignals(0) <= '0';

        wait for 2 us;
        EXT_OutputsVectorSignals(1) <= '1';
        wait for 2 us;
        EXT_OutputsVectorSignals(1) <= '0';

        
        wait for 10 us;
        --SEND_CMD( X"04", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        --SEND_CMD( X"06", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
       
       
        wait;

    end process;

end behavioral;

