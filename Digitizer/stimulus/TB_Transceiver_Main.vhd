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


    constant CTRL_CLock_40M_PERIOD : time := 25 ns; 
    constant SYSCLK_PERIOD : time := 11.428571 ns; 
    constant REF_Clock_PERIOD  : time := 8 ns; 

    

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';
    signal REF_Clock : std_logic := '0';
    signal CTRL_CLock_40M : std_logic := '0';
    signal REF_Reset_N : std_logic := '0';
    signal Gen_Enable : std_logic := '1';
    signal SYNCINB : std_logic;
    signal AlignmentFifo_Read_Out : std_logic;

    signal LANE_RXD_N : std_logic_vector(5 downto 0);
    signal LANE_RXD_P : std_logic_vector(5 downto 0);
    signal LANE_TXD_N : std_logic_vector(5 downto 0);
    signal LANE_TXD_P : std_logic_vector(5 downto 0);
    
    signal Output_Data : std_logic_vector(383 downto 0);

    signal CTRL_enable_cmd : std_logic;
    signal CTRL_write_read : std_logic;
    signal CTRL_busy    : std_logic;
    signal CTRL_addr_frame : std_logic_vector(7 downto 0);
    signal CTRL_write_data_frame : std_logic_vector(15 downto 0);
    signal CTRL_read_data_frame : std_logic_vector(15 downto 0);



    signal Transceiver_Rx_Data_xxx : std_logic_vector(383 downto 0);
    signal Transceiver_Rx_K_xxx : std_logic_vector(47 downto 0);
    signal AlignmentFifo_Rx_Data_xxx : std_logic_vector(383 downto 0);


------------------------------------------------------------------------------------------------------------
--component Transceiver_Main
------------------------------------------------------------------------------------------------------------
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
        wait until Clock'event and Clock = '1';
        wait until CTRL_busy'event and CTRL_busy = '1';
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
    REF_Clock <= not REF_Clock after (REF_Clock_PERIOD / 2.0 );
    CTRL_CLock_40M <= not CTRL_CLock_40M after (CTRL_CLock_40M_PERIOD / 2.0 );


    --REF_Clock <= SYSCLK;
    REF_Reset_N <= NSYSRESET;

    -- Instantiate Unit Under Test:  Transceiver_Main
    Transceiver_Main_0 : Transceiver_Main
        -- port map
        port map( 
            -- Inputs¨

            -- Inputs
            REF_Clock => REF_Clock,
            CTRL_Clock_40M => CTRL_Clock_40M,
            Logic_Clock => SYSCLK,
            Logic_Reset_N => NSYSRESET,
            Gen_Enable => Gen_Enable,
            write_read => CTRL_write_read,
            enable_cmd => CTRL_enable_cmd,
            REF_Reset_N => REF_Reset_N,
            CTRL_Clock => SYSCLK,
            CTRL_Reset_N => NSYSRESET,
            addr_frame => CTRL_addr_frame,
            write_data_frame => CTRL_write_data_frame,
            LANE_RXD_N_Vector => LANE_RXD_N,
            LANE_RXD_P_Vector => LANE_RXD_P,

            -- Outputs
            Data_Valid => open,
            busy => CTRL_busy,
            SYNCINB_OUT => SYNCINB,
            AlignmentFifo_Read_Out => AlignmentFifo_Read_Out,
            read_data_frame => CTRL_read_data_frame,
            Output_Data => Output_Data,
            AlignmentFifo_Rx_Data => AlignmentFifo_Rx_Data_xxx,
            Transceivers_Rx_Data => Transceiver_Rx_Data_xxx,
            Transceivers_Rx_K => Transceiver_Rx_K_xxx,

            LANE_TXD_N_Vector => LANE_TXD_N,
            LANE_TXD_P_Vector => LANE_TXD_P


        );

    









------------------------------------------------------------------------------------------------------------
--signal routing
------------------------------------------------------------------------------------------------------------
LANE_RXD_N <= LANE_TXD_N;
LANE_RXD_P <= LANE_TXD_P;

------------------------------------------------------------------------------------------------------------
--process : test ride
------------------------------------------------------------------------------------------------------------
    process
    begin

        wait until NSYSRESET'event and NSYSRESET = '1';
        wait for 10 us;

       
        --cmd analyzator ---- enable trigger 0
        --SEND_CMD( X"04", X"0001", '0', SYSCLK, ANALYZ_addr_frame, ANALYZ_write_data_frame, ANALYZ_enable_cmd, ANALYZ_write_read, ANALYZ_busy);

         --cmd analyzator ---- set num of samples
        --SEND_CMD( X"03", X"0064", '0', SYSCLK, ANALYZ_addr_frame, ANALYZ_write_data_frame, ANALYZ_enable_cmd, ANALYZ_write_read, ANALYZ_busy);

        --cmd analyzator ---- enable
        --SEND_CMD( X"01", X"0001", '0', SYSCLK, ANALYZ_addr_frame, ANALYZ_write_data_frame, ANALYZ_enable_cmd, ANALYZ_write_read, ANALYZ_busy);



        --SEND_CMD( X"00", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);

        wait for 10 us;

        --SEND_CMD( X"0A", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);

        wait for 70 us;

        --SEND_CMD( X"01", X"0001", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        wait for 2 us;
        --SEND_CMD( X"01", X"0000", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);


        wait;

    end process;

end behavioral;

