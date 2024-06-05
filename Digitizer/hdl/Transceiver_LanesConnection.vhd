library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Transceiver_LanesConnection is
  generic 
  (
    g_NumberOfLanes : natural := 6
  );
  port 
  (
    Logic_Clock : in std_logic;
    Logic_Reset_N : in std_logic;

    CTRL_Clock : in std_logic;
    CTRL_Reset_N : in std_logic;

    REF_Clock : in std_logic;
    LANE_CLK_REF : in std_logic;

    LANE_RXD_P_Vector : in std_logic_vector(g_NumberOfLanes - 1 downto 0);
    LANE_RXD_N_Vector : in std_logic_vector(g_NumberOfLanes - 1 downto 0);

    LANE_TXD_P_Vector : out std_logic_vector(g_NumberOfLanes - 1 downto 0);
    LANE_TXD_N_Vector : out std_logic_vector(g_NumberOfLanes - 1 downto 0);
    
    CLKS_FROM_TXPLL_0_TX_PLL_LOCK_0 : in std_logic;
    CLKS_FROM_TXPLL_0_TX_BIT_CLK_0 : in std_logic;
    CLKS_FROM_TXPLL_0_TX_PLL_REF_CLK_0 : in std_logic;
    
    CLKS_FROM_TXPLL_0_TX_PLL_LOCK_1 : in std_logic;
    CLKS_FROM_TXPLL_0_TX_BIT_CLK_1 : in std_logic;
    CLKS_FROM_TXPLL_0_TX_PLL_REF_CLK_1 : in std_logic;

    --LANE0_RXD_P : in std_logic;
    --LANE0_RXD_N : in std_logic;
    --LANE1_RXD_P : in std_logic;
    --LANE1_RXD_N : in std_logic;

    --LANE0_TXD_P : out std_logic;
    --LANE0_TXD_N : out std_logic;
    --LANE1_TXD_P : out std_logic;
    --LANE1_TXD_N : out std_logic;

    Input_Data_Read : out std_logic; 

    --Input_Data : in std_logic_vector( (4*16*g_NumberOfLanes) - 1 downto 0);
    --Output_Data : out std_logic_vector( (4*16*g_NumberOfLanes) - 1 downto 0);
    Input_Data : in std_logic_vector( (4*8*12) - 1 downto 0);--plati pro HD mod (g_NumberOfLanes/2 * frame_in_logicClk * 12)
    Output_Data : out std_logic_vector( (4*8*12) - 1 downto 0);--plati pro HD mod (g_NumberOfLanes/2 * frame_in_logicClk * 12)

    Data_Valid : out std_logic;

    TRNV_CTRL_RESTART : in std_logic;
    TRNV_CTRL_StatusLanes_Vector : out std_logic_vector((g_NumberOfLanes * 32) - 1 downto 0);

    Transceivers_Rx_Data : out std_logic_vector((g_NumberOfLanes * 64) - 1 downto 0);
    Transceivers_Rx_K : out std_logic_vector((g_NumberOfLanes * 8) - 1 downto 0);

    AlignmentFifo_Rx_Data : out std_logic_vector((g_NumberOfLanes * 64) - 1 downto 0);
    AlignmentFifo_Read_Out : out std_logic;
    
    SYNCINB_OUT : out std_logic


  );
end Transceiver_LanesConnection;



architecture rtl of Transceiver_LanesConnection is

------------------------------------------------------------------------------------------------------------
--constant
------------------------------------------------------------------------------------------------------------ 
    --constant NumberOfLaneWords : integer := 4;

------------------------------------------------------------------------------------------------------------
--Signals declaration
------------------------------------------------------------------------------------------------------------ 
    type type_data_vector_array is array(0 to (g_NumberOfLanes- 1)) of std_logic_vector(64 - 1 downto 0);
    signal InputData_Array : type_data_vector_array;
    signal OutputData_Array : type_data_vector_array;

    type type_data_vector_bytes_array is array(0 to (8 * g_NumberOfLanes- 1)) of std_logic_vector(8 - 1 downto 0);
    signal InputDataBytes_Array : type_data_vector_bytes_array;
    signal OutputDataBytes_Array : type_data_vector_bytes_array;


    type type_LaneRxData_array is array(0 to (g_NumberOfLanes - 1)) of std_logic_vector(64 - 1 downto 0);
    signal LANE_RX_DATA_Array : type_LaneRxData_array;

    type type_LaneRxK_array is array(0 to (g_NumberOfLanes - 1)) of std_logic_vector(8 - 1 downto 0);
    signal LANE_RX_K_Array : type_LaneRxK_array;


    signal CTRL_Data_Go_Vector : std_logic_vector(g_NumberOfLanes - 1 downto 0);
    signal CTRL_Synced_Vector : std_logic_vector(g_NumberOfLanes - 1 downto 0);
    signal CTRL_ILAS_Go_Vector : std_logic_vector(g_NumberOfLanes - 1 downto 0);
    signal CTRL_Empty_For_NonAll_Vector : std_logic_vector(g_NumberOfLanes - 1 downto 0);
    signal CTRL_Fault_Vector : std_logic_vector(g_NumberOfLanes - 1 downto 0);

    signal Lanes_Input_MainData_Read_Vector : std_logic_vector(g_NumberOfLanes - 1 downto 0);


    signal SYNCINB : std_logic;
    signal Lanes_Alignment_Fifo_Read : std_logic;
    signal Lanes_SYNC_OK : std_logic;
    signal Lanes_CTRL_Fault_CLR : std_logic;

    type type_LanesStatusVector_array is array(0 to (g_NumberOfLanes - 1)) of std_logic_vector(32 - 1 downto 0);
    signal LanesStatusVector_Array : type_LanesStatusVector_array;

    
    type type_test_data_samples_array is array(0 to (8*4- 1)) of std_logic_vector(12 - 1 downto 0);
    signal TestDataSamples_Array : type_test_data_samples_array;

    --signal LANE_RXD_P_Vector : std_logic_vector(g_NumberOfLanes - 1 downto 0);
    --signal LANE_RXD_N_Vector : std_logic_vector(g_NumberOfLanes - 1 downto 0);

    --signal LANE_TXD_P_Vector : std_logic_vector(g_NumberOfLanes - 1 downto 0);
    --signal LANE_TXD_N_Vector : std_logic_vector(g_NumberOfLanes - 1 downto 0);
    
    signal CLKS_FROM_TXPLL_0_TX_PLL_LOCK : std_logic_vector(g_NumberOfLanes - 1 downto 0);
    signal CLKS_FROM_TXPLL_0_TX_BIT_CLK : std_logic_vector(g_NumberOfLanes - 1 downto 0);
    signal CLKS_FROM_TXPLL_0_TX_PLL_REF_CLK : std_logic_vector(g_NumberOfLanes - 1 downto 0);

------------------------------------------------------------------------------------------------------------
--Components
------------------------------------------------------------------------------------------------------------ 

--component TxMainLinkController
    component TxMainLinkController is
    generic 
    (
        g_NumOfLanes : natural := 4
    );
    port 
    (
        Clock : in std_logic;
        Reset_N : in std_logic;
 
        SYNCINB : in std_logic;
        Lanes_DataGo : in std_logic_vector(g_NumOfLanes - 1 downto 0); 

        SYNC_OK : out std_logic; 
        Data_Read : out std_logic
 
    );  
    end component;

--component RxMainLinkController
    component RxMainLinkController is
    generic 
    (
        g_NumOfLanes : natural := 4
    );
    port 
    (
        Clock : in std_logic;
        Reset_N : in std_logic;
 
        LANE_Synced : in std_logic_vector(g_NumOfLanes - 1 downto 0);
        LANE_ILAS_Go : in std_logic_vector(g_NumOfLanes - 1 downto 0);
        LANE_Data_Go : in std_logic_vector(g_NumOfLanes - 1 downto 0);

        LANE_Alignment_Fifo_Empty : in std_logic_vector(g_NumOfLanes - 1 downto 0);
        LANE_Fault : in std_logic_vector(g_NumOfLanes - 1 downto 0);

        TRNV_CTRL_Restart : in std_logic;

        SYNCINB : out std_logic;
        LANE_CLR_Fault : out std_logic;
        Alignment_Fifo_Read : out std_logic

    
    );
    end component;

--component Transciever_OneLane
    component Transciever_OneLane is
        -- ports
        port( 
            -- Inputs
            Logic_Clock : in std_logic;
            CTRL_RST_N : in std_logic;
            CTRL_CLK : in std_logic;
            Read_Enable : in std_logic;
            Logic_Reser_N : in std_logic;
            REF_CLK : in std_logic;
            LANE_CLK_REF : in std_logic;
            LANE0_RXD_P : in std_logic;
            LANE0_RXD_N : in std_logic;
            SYNC_OK : in std_logic;
            CTRL_Fault_CLR : in std_logic;
            Input_Data : in std_logic_vector(63 downto 0);
            
            CLKS_FROM_TXPLL_0_TX_PLL_LOCK_0 : in std_logic;
            CLKS_FROM_TXPLL_0_TX_BIT_CLK_0 : in std_logic;
            CLKS_FROM_TXPLL_0_TX_PLL_REF_CLK_0 : in std_logic;


            -- Outputs
            Input_MainData_Read : out std_logic;
            Empty_For_NonAll : out std_logic;
            CTRL_Fault : out std_logic;
            CTRL_Data_Go : out std_logic;
            CTRL_Synced : out std_logic;
            CTRL_ILAS_Go : out std_logic;
            LANE0_TXD_P : out std_logic;
            LANE0_TXD_N : out std_logic;
            Output_Data : out std_logic_vector(63 downto 0);
            StatusVector : out std_logic_vector(31 downto 0);
            LANE_RX_DATA : out std_logic_vector(63 downto 0);
            LANE_RX_K : out std_logic_vector(7 downto 0)

            -- Inouts

        );
    end component;






begin

------------------------------------------------------------------------------------------------------------
--Signals routing
------------------------------------------------------------------------------------------------------------  
    --LANE_RXD_P_Vector(0) <= LANE0_RXD_P;
    --LANE_RXD_N_Vector(0) <= LANE0_RXD_N;
    --LANE_RXD_P_Vector(1) <= LANE1_RXD_P;
    --LANE_RXD_N_Vector(1) <= LANE1_RXD_N;

    --LANE0_TXD_P <= LANE_TXD_P_Vector(0);
    --LANE0_TXD_N <= LANE_TXD_N_Vector(0);
    --LANE1_TXD_P <= LANE_TXD_P_Vector(1);
    --LANE1_TXD_N <= LANE_TXD_N_Vector(1);
    

    CLKS_FROM_TXPLL_0_TX_PLL_LOCK(0)    <= CLKS_FROM_TXPLL_0_TX_PLL_LOCK_0;
    CLKS_FROM_TXPLL_0_TX_BIT_CLK(0)     <= CLKS_FROM_TXPLL_0_TX_BIT_CLK_0;
    CLKS_FROM_TXPLL_0_TX_PLL_REF_CLK(0) <= CLKS_FROM_TXPLL_0_TX_PLL_REF_CLK_0;
    
    CLKS_FROM_TXPLL_0_TX_PLL_LOCK(1)    <= CLKS_FROM_TXPLL_0_TX_PLL_LOCK_0;
    CLKS_FROM_TXPLL_0_TX_BIT_CLK(1)     <= CLKS_FROM_TXPLL_0_TX_BIT_CLK_0;
    CLKS_FROM_TXPLL_0_TX_PLL_REF_CLK(1) <= CLKS_FROM_TXPLL_0_TX_PLL_REF_CLK_0;
    
    CLKS_FROM_TXPLL_0_TX_PLL_LOCK(2)    <= CLKS_FROM_TXPLL_0_TX_PLL_LOCK_0;
    CLKS_FROM_TXPLL_0_TX_BIT_CLK(2)     <= CLKS_FROM_TXPLL_0_TX_BIT_CLK_0;
    CLKS_FROM_TXPLL_0_TX_PLL_REF_CLK(2) <= CLKS_FROM_TXPLL_0_TX_PLL_REF_CLK_0;
    
    CLKS_FROM_TXPLL_0_TX_PLL_LOCK(3)    <= CLKS_FROM_TXPLL_0_TX_PLL_LOCK_0;
    CLKS_FROM_TXPLL_0_TX_BIT_CLK(3)     <= CLKS_FROM_TXPLL_0_TX_BIT_CLK_0;
    CLKS_FROM_TXPLL_0_TX_PLL_REF_CLK(3) <= CLKS_FROM_TXPLL_0_TX_PLL_REF_CLK_0;
    
    CLKS_FROM_TXPLL_0_TX_PLL_LOCK(4)    <= CLKS_FROM_TXPLL_0_TX_PLL_LOCK_1;
    CLKS_FROM_TXPLL_0_TX_BIT_CLK(4)     <= CLKS_FROM_TXPLL_0_TX_BIT_CLK_1;
    CLKS_FROM_TXPLL_0_TX_PLL_REF_CLK(4) <= CLKS_FROM_TXPLL_0_TX_PLL_REF_CLK_1;
    
    CLKS_FROM_TXPLL_0_TX_PLL_LOCK(5)    <= CLKS_FROM_TXPLL_0_TX_PLL_LOCK_1;
    CLKS_FROM_TXPLL_0_TX_BIT_CLK(5)     <= CLKS_FROM_TXPLL_0_TX_BIT_CLK_1;
    CLKS_FROM_TXPLL_0_TX_PLL_REF_CLK(5) <= CLKS_FROM_TXPLL_0_TX_PLL_REF_CLK_1;
    

    

    InputtBytes_GEN : for i in 0 to (4*8 - 1) generate
        TestDataSamples_Array(i) <= X"A" & std_logic_vector(to_unsigned(i,8));

    end generate InputtBytes_GEN;  


    InputRoute_GEN : for i in 0 to (8 - 1) generate
        
        InputData_Array(0)(7+(i*8) downto 0+(i*8)) <= TestDataSamples_Array(0 + (i*4))(11 downto 4);
        InputData_Array(1)(7+(i*8) downto 0+(i*8)) <= TestDataSamples_Array(0 + (i*4))(3  downto 0) & TestDataSamples_Array(1 + (i*4))(11 downto 8);
        InputData_Array(2)(7+(i*8) downto 0+(i*8)) <= TestDataSamples_Array(1 + (i*4))(7  downto 0);
        InputData_Array(3)(7+(i*8) downto 0+(i*8)) <= TestDataSamples_Array(2 + (i*4))(11 downto 4);
        InputData_Array(4)(7+(i*8) downto 0+(i*8)) <= TestDataSamples_Array(2 + (i*4))(3  downto 0) & TestDataSamples_Array(3 + (i*4))(11 downto 8);
        InputData_Array(5)(7+(i*8) downto 0+(i*8)) <= TestDataSamples_Array(3 + (i*4))(7  downto 0);
    end generate InputRoute_GEN;  
    





    OutputBytes_GEN : for i in 0 to (g_NumberOfLanes - 1) generate
        
        OutputDataBytes_Array(0 +i*8) <= OutputData_Array(i)(7 downto 0 );
        OutputDataBytes_Array(1 +i*8) <= OutputData_Array(i)(15 downto 8);
        OutputDataBytes_Array(2 +i*8) <= OutputData_Array(i)(23 downto 16);
        OutputDataBytes_Array(3 +i*8) <= OutputData_Array(i)(31 downto 24);
        OutputDataBytes_Array(4 +i*8) <= OutputData_Array(i)(39 downto 32);
        OutputDataBytes_Array(5 +i*8) <= OutputData_Array(i)(47 downto 40);
        OutputDataBytes_Array(6 +i*8) <= OutputData_Array(i)(55 downto 48);
        OutputDataBytes_Array(7 +i*8) <= OutputData_Array(i)(63 downto 56);

    end generate OutputBytes_GEN;  

    OutputRoute_GEN : for i in 0 to (8 - 1) generate
        
        Output_Data(11 +(i*12*4) downto 0  +(i*12*4))   <= OutputDataBytes_Array(0 + i)(7 downto 0)  & OutputDataBytes_Array(8 + i)(7 downto 4);
        Output_Data(23 +(i*12*4) downto 12 +(i*12*4))   <= OutputDataBytes_Array(8 + i)(3 downto 0)  & OutputDataBytes_Array(16+ i)(7 downto 0);

        Output_Data(35 +(i*12*4) downto 24 +(i*12*4))   <= OutputDataBytes_Array(24+ i)(7 downto 0)  & OutputDataBytes_Array(32+ i)(7 downto 4);
        Output_Data(47 +(i*12*4) downto 36 +(i*12*4))   <= OutputDataBytes_Array(32+ i)(3 downto 0)  & OutputDataBytes_Array(40+ i)(7 downto 0);

    end generate OutputRoute_GEN;   




    StatusArray_GEN : for i in 0 to (g_NumberOfLanes - 1) generate
        TRNV_CTRL_StatusLanes_Vector( ((i*32) + 31) downto (i*32) ) <= LanesStatusVector_Array(i);

    end generate StatusArray_GEN;



    Transceivers_Rx_DataGEN : for i in 0 to (g_NumberOfLanes - 1) generate
        Transceivers_Rx_Data( ((i*64) + 63)  downto (i*64) )  <= LANE_RX_DATA_Array(i);
    end generate Transceivers_Rx_DataGEN;

    Transceivers_Rx_K_GEN : for i in 0 to (g_NumberOfLanes - 1) generate
        Transceivers_Rx_K( ((i*8) + 7)  downto (i*8) ) <= LANE_RX_K_Array(i);
    end generate Transceivers_Rx_K_GEN;


    
    SYNCINB_OUT <= SYNCINB;

    AlignmentFifo_Read_Out <= Lanes_Alignment_Fifo_Read;

    --OutputData_Array AlignmentFifo_Rx_Data for AnalyzInCirc
    --AlignmentFifo_Rx_Data(15 downto 0) <= OutputData_Array(0);




------------------------------------------------------------------------------------------------------------
--instance TxMainLinkController
------------------------------------------------------------------------------------------------------------ 
    inst_TxMainLinkController : TxMainLinkController 
    generic map
    (
        g_NumOfLanes => 6
    )
    port map
    (
        Clock => Logic_Clock,
        Reset_N => Logic_Reset_N,
 
        SYNCINB => SYNCINB,
        Lanes_DataGo => Lanes_Input_MainData_Read_Vector,

        SYNC_OK => Lanes_SYNC_OK,
        Data_Read => Input_Data_Read
    );  

------------------------------------------------------------------------------------------------------------
--instance RxMainLinkController
------------------------------------------------------------------------------------------------------------ 
    inst_RxMainLinkController : RxMainLinkController 
    generic map
    (
        g_NumOfLanes => 6
    )
    port map
    (
        Clock => Logic_Clock,
        Reset_N => Logic_Reset_N,
 
        LANE_Synced => CTRL_Synced_Vector,
        LANE_ILAS_Go => CTRL_ILAS_Go_Vector,
        LANE_Data_Go => CTRL_Data_Go_Vector,

        LANE_Alignment_Fifo_Empty => CTRL_Empty_For_NonAll_Vector,
        LANE_Fault => CTRL_Fault_Vector,

        TRNV_CTRL_Restart => TRNV_CTRL_Restart,

        SYNCINB => SYNCINB,
        LANE_CLR_Fault => Lanes_CTRL_Fault_CLR,
        Alignment_Fifo_Read => Lanes_Alignment_Fifo_Read

    );

------------------------------------------------------------------------------------------------------------
--instance Transciever_OneLane
------------------------------------------------------------------------------------------------------------ 

    LanesConn_GEN : for i in 0 to (g_NumberOfLanes - 1) generate
            
        inst_Transciever_OneLane_1 : Transciever_OneLane
        -- ports
        port map( 

            --clk and resets
            Logic_Clock => Logic_Clock,
            Logic_Reser_N => Logic_Reset_N,
            CTRL_RST_N => CTRL_Reset_N,
            CTRL_CLK => CTRL_Clock,
            REF_CLK => REF_Clock,
            LANE_CLK_REF => LANE_CLK_REF,

            --inputs
            Input_Data => InputData_Array(i),

            SYNC_OK => Lanes_SYNC_OK,
            Read_Enable => Lanes_Alignment_Fifo_Read,

            CTRL_Fault_CLR => Lanes_CTRL_Fault_CLR,
            
            CLKS_FROM_TXPLL_0_TX_PLL_LOCK_0 => CLKS_FROM_TXPLL_0_TX_PLL_LOCK(i),
            CLKS_FROM_TXPLL_0_TX_BIT_CLK_0 => CLKS_FROM_TXPLL_0_TX_BIT_CLK(i),
            CLKS_FROM_TXPLL_0_TX_PLL_REF_CLK_0 => CLKS_FROM_TXPLL_0_TX_PLL_REF_CLK(i),
            

            -- Outputs
            Output_Data => OutputData_Array(i),


            Empty_For_NonAll => CTRL_Empty_For_NonAll_Vector(i),
            CTRL_Fault => CTRL_Fault_Vector(i),
            CTRL_Data_Go => CTRL_Data_Go_Vector(i),
            CTRL_Synced => CTRL_Synced_Vector(i),
            CTRL_ILAS_Go => CTRL_ILAS_Go_Vector(i),
            Input_MainData_Read => Lanes_Input_MainData_Read_Vector(i),
            StatusVector => LanesStatusVector_Array(i),
            LANE_RX_DATA => LANE_RX_DATA_Array(i),
            LANE_RX_K => LANE_RX_K_Array(i),


            --lanes
            LANE0_TXD_P => LANE_TXD_P_Vector(i),
            LANE0_TXD_N => LANE_TXD_N_Vector(i),
            LANE0_RXD_P => LANE_RXD_P_Vector(i),
            LANE0_RXD_N => LANE_RXD_N_Vector(i)

        );    
    
    end generate LanesConn_GEN;   





end rtl;