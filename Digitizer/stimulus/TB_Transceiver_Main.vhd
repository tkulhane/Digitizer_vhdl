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
    
    --constant SYSCLK_PERIOD : time := 8 ns; 
    --constant LANE_CLK_REF_PERIOD  : time := 8 ns; 
    
    constant SYSCLK_PERIOD : time := 6.4 ns; 
    constant LANE_CLK_REF_PERIOD  : time := 6.4 ns; 

    
    
    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';
    
    signal REF_Clock : std_logic := '0';
    signal CTRL_CLock_40M : std_logic := '0';
    signal REF_Reset_N : std_logic := '0';
    signal LANE_CLK_REF : std_logic := '0';
    
    signal Gen_Enable : std_logic := '1';

    signal SYNCINB : std_logic;
    
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


    signal CTRL_enable_cmd : std_logic;
    signal CTRL_write_read : std_logic;
    signal CTRL_busy    : std_logic;
    signal CTRL_addr_frame : std_logic_vector(7 downto 0);
    signal CTRL_write_data_frame : std_logic_vector(15 downto 0);
    signal CTRL_read_data_frame : std_logic_vector(15 downto 0);


    signal ANALYZ_enable_cmd : std_logic;
    signal ANALYZ_write_read : std_logic;
    signal ANALYZ_busy    : std_logic;
    signal ANALYZ_addr_frame : std_logic_vector(7 downto 0);
    signal ANALYZ_write_data_frame : std_logic_vector(15 downto 0);
    signal ANALYZ_read_data_frame : std_logic_vector(15 downto 0);

    signal ANALYZ_Start_Triggers : std_logic_vector(7 downto 0);
    signal Transceiver_Rx_Data_xxx : std_logic_vector(127 downto 0);
    signal Transceiver_Rx_K_xxx : std_logic_vector(15 downto 0);


------------------------------------------------------------------------------------------------------------
--component Transceiver_Main
------------------------------------------------------------------------------------------------------------
    component Transceiver_Main
        -- ports
        port( 
            -- Inputs
            LANE1_RXD_N : in std_logic;
            LANE0_RXD_P : in std_logic;
            LANE0_RXD_N : in std_logic;
            LANE1_RXD_P : in std_logic;
            CTRL_Clock : in std_logic;
            CTRL_Reset_N : in std_logic;
            REF_Clock : in std_logic;
            REF_Reset_N : in std_logic;
            CTRL_Clock_40M : in std_logic;
            Logic_Clock : in std_logic;
            Logic_Reset_N : in std_logic;
            Gen_Enable : in std_logic;
            write_read : in std_logic;
            addr_frame : in std_logic_vector(7 downto 0);
            enable_cmd : in std_logic;
            write_data_frame : in std_logic_vector(15 downto 0);


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
            Output_Data_6 : out std_logic_vector(83 downto 72);
            busy : out std_logic;
            read_data_frame : out std_logic_vector(15 downto 0);
            Transceivers_Rx_Data : out std_logic_vector(127 downto 0);
            Transceivers_Rx_K : out std_logic_vector(15 downto 0);
            SYNCINB_OUT : out std_logic

            -- Inouts

        );
    end component;


------------------------------------------------------------------------------------------------------------
--component AnalyzInCirc_Top
------------------------------------------------------------------------------------------------------------
    component AnalyzInCirc_Top is
    generic
    (
        g_NumOfTranscievers : natural := 2
    );
    port
    (
        Clock : in std_logic;                                           --system clock
        Reset_N : in std_logic;                                         --system reset

        busy : out std_logic;
        enable_cmd : in std_logic;
        write_read : in std_logic;
        addr_frame : in std_logic_vector(7 downto 0);
        write_data_frame : in std_logic_vector(15 downto 0);
        read_data_frame : out std_logic_vector(15 downto 0);

        Start_Triggers : in std_logic_vector(7 downto 0);
        
        Transceiver_Rx_Data : in std_logic_vector((g_NumOfTranscievers * 64) - 1 downto 0);
        Transceiver_Rx_K : in std_logic_vector((g_NumOfTranscievers * 8) - 1 downto 0)
        
    
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
    
    --REF_Clock <= not REF_Clock after (REF_Clock_PERIOD / 2.0 );
    CTRL_CLock_40M <= not CTRL_CLock_40M after (CTRL_CLock_40M_PERIOD / 2.0 );
    LANE_CLK_REF <= not LANE_CLK_REF after (LANE_CLK_REF_PERIOD / 2.0 );


    REF_Clock <= SYSCLK;
    REF_Reset_N <= NSYSRESET;

    -- Instantiate Unit Under Test:  Transceiver_Main
    Transceiver_Main_0 : Transceiver_Main
        -- port map
        port map( 
            -- Inputs
            
            LANE0_RXD_P => LANE0_P,
            LANE0_RXD_N => LANE0_N,
            LANE1_RXD_P => LANE1_P,
            LANE1_RXD_N => LANE1_N,

            CTRL_Clock => SYSCLK,
            CTRL_Reset_N => NSYSRESET,
            REF_Clock => REF_Clock,
            REF_Reset_N => REF_Reset_N,
            CTRL_Clock_40M => CTRL_Clock_40M,
            Logic_Clock => SYSCLK,
            Logic_Reset_N => NSYSRESET,
            
            Gen_Enable => Gen_Enable,

            write_read => CTRL_write_read,
            addr_frame => CTRL_addr_frame,
            enable_cmd => CTRL_enable_cmd,
            write_data_frame => CTRL_write_data_frame,

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
            LANE1_TXD_N =>  LANE0_N,

            busy => CTRL_busy,
            read_data_frame => CTRL_read_data_frame,
            Transceivers_Rx_Data => Transceiver_Rx_Data_xxx,
            Transceivers_Rx_K => Transceiver_Rx_K_xxx,
            SYNCINB_OUT =>  SYNCINB

            -- Inouts

        );

    









------------------------------------------------------------------------------------------------------------
--signal routing
------------------------------------------------------------------------------------------------------------
    --ANALYZ_Start_Triggers <= "0000000" & SYNCINB;


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

