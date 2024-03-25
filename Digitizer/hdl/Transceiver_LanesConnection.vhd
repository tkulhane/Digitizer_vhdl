library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Transceiver_LanesConnection is
  generic 
  (
    g_NumberOfLanes : natural := 2
  );
  port 
  (
    Logic_Clock : in std_logic;
    Logic_Reset_N : in std_logic;

    CTRL_Clock : in std_logic;
    CTRL_Reset_N : in std_logic;

    REF_Clock : in std_logic;

    LANE0_RXD_P : in std_logic;
    LANE0_RXD_N : in std_logic;
    LANE1_RXD_P : in std_logic;
    LANE1_RXD_N : in std_logic;

    LANE0_TXD_P : out std_logic;
    LANE0_TXD_N : out std_logic;
    LANE1_TXD_P : out std_logic;
    LANE1_TXD_N : out std_logic;

    Input_Data_Read : out std_logic; 

    Input_Data : in std_logic_vector( (4*16*g_NumberOfLanes) - 1 downto 0);
    Output_Data : out std_logic_vector( (4*16*g_NumberOfLanes) - 1 downto 0);

    Data_Valid : out std_logic;

    TRNV_CTRL_RESTART : in std_logic;
    TRNV_CTRL_StatusLanes_Vector : out std_logic_vector((g_NumberOfLanes * 32) - 1 downto 0);

    Transceivers_Rx_Data : out std_logic_vector((g_NumberOfLanes * 64) - 1 downto 0);
    Transceivers_Rx_K : out std_logic_vector((g_NumberOfLanes * 8) - 1 downto 0);
    
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
    type type_data_vector_array is array(0 to (g_NumberOfLanes * 4 - 1)) of std_logic_vector(16 - 1 downto 0);

    signal InputData_Array : type_data_vector_array;
    signal OutputData_Array : type_data_vector_array;


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

    signal LANE_RXD_P_Vector : std_logic_vector(g_NumberOfLanes - 1 downto 0);
    signal LANE_RXD_N_Vector : std_logic_vector(g_NumberOfLanes - 1 downto 0);

    signal LANE_TXD_P_Vector : std_logic_vector(g_NumberOfLanes - 1 downto 0);
    signal LANE_TXD_N_Vector : std_logic_vector(g_NumberOfLanes - 1 downto 0);

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
            LANE0_RXD_P : in std_logic;
            LANE0_RXD_N : in std_logic;
            SYNC_OK : in std_logic;
            CTRL_Fault_CLR : in std_logic;
            Input_Data_0 : in std_logic_vector(15 downto 0);
            Input_Data_1 : in std_logic_vector(15 downto 0);
            Input_Data_2 : in std_logic_vector(15 downto 0);
            Input_Data_3 : in std_logic_vector(15 downto 0);

            -- Outputs
            Input_MainData_Read : out std_logic;
            Empty_For_NonAll : out std_logic;
            CTRL_Fault : out std_logic;
            CTRL_Data_Go : out std_logic;
            CTRL_Synced : out std_logic;
            CTRL_ILAS_Go : out std_logic;
            LANE0_TXD_P : out std_logic;
            LANE0_TXD_N : out std_logic;
            Output_Data_0 : out std_logic_vector(15 downto 0);
            Output_Data_1 : out std_logic_vector(15 downto 0);
            Output_Data_2 : out std_logic_vector(15 downto 0);
            Output_Data_3 : out std_logic_vector(15 downto 0);
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
    LANE_RXD_P_Vector(0) <= LANE0_RXD_P;
    LANE_RXD_N_Vector(0) <= LANE0_RXD_N;
    LANE_RXD_P_Vector(1) <= LANE1_RXD_P;
    LANE_RXD_N_Vector(1) <= LANE1_RXD_N;

    LANE0_TXD_P <= LANE_TXD_P_Vector(0);
    LANE0_TXD_N <= LANE_TXD_N_Vector(0);
    LANE1_TXD_P <= LANE_TXD_P_Vector(1);
    LANE1_TXD_N <= LANE_TXD_N_Vector(1);





    --Input_Data into InputData_Array
    InputData_Array(0) <= Input_Data(15 downto 0);
    InputData_Array(1) <= Input_Data(31 downto 16);
    InputData_Array(2) <= Input_Data(47 downto 32);
    InputData_Array(3) <= Input_Data(63 downto 48);                
    
    InputData_Array(4) <= Input_Data(79 downto 64);
    InputData_Array(5) <= Input_Data(95 downto 80);
    InputData_Array(6) <= Input_Data(111 downto 96);
    InputData_Array(7) <= Input_Data(127 downto 112);

    --OutputData_Array into Output_Data 
    Output_Data(15 downto 0) <= OutputData_Array(0);
    Output_Data(31 downto 16) <= OutputData_Array(1);
    Output_Data(47 downto 32) <= OutputData_Array(2);
    Output_Data(63 downto 48) <= OutputData_Array(3);           
    
    Output_Data(79 downto 64) <= OutputData_Array(4);
    Output_Data(95 downto 80) <= OutputData_Array(5);
    Output_Data(111 downto 96) <= OutputData_Array(6);
    Output_Data(127 downto 112) <= OutputData_Array(7);



    StatusArray_GEN : for i in 0 to (g_NumberOfLanes - 1) generate
        TRNV_CTRL_StatusLanes_Vector( ((i*32) + 31) downto (i*32) ) <= LanesStatusVector_Array(i);
    
    end generate StatusArray_GEN;



    Transceivers_Rx_Data <= LANE_RX_DATA_Array(1) & LANE_RX_DATA_Array(0);
    Transceivers_Rx_K  <= LANE_RX_K_Array(1) & LANE_RX_K_Array(0);
    
    SYNCINB_OUT <= SYNCINB;



------------------------------------------------------------------------------------------------------------
--instance TxMainLinkController
------------------------------------------------------------------------------------------------------------ 
    inst_TxMainLinkController : TxMainLinkController 
    generic map
    (
        g_NumOfLanes => 2
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
        g_NumOfLanes => 2
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
    inst_Transciever_OneLane_0 : Transciever_OneLane
        -- ports
        port map( 

            --clk and resets
            Logic_Clock => Logic_Clock,
            Logic_Reser_N => Logic_Reset_N,
            CTRL_RST_N => CTRL_Reset_N,
            CTRL_CLK => CTRL_Clock,
            REF_CLK => REF_Clock,

            --inputs
            Input_Data_0 => InputData_Array(0),
            Input_Data_1 => InputData_Array(2),
            Input_Data_2 => InputData_Array(4),
            Input_Data_3 => InputData_Array(6),

            SYNC_OK => Lanes_SYNC_OK,
            Read_Enable => Lanes_Alignment_Fifo_Read,

            CTRL_Fault_CLR => Lanes_CTRL_Fault_CLR,
            

            -- Outputs
            Output_Data_0 => OutputData_Array(0),
            Output_Data_1 => OutputData_Array(2),
            Output_Data_2 => OutputData_Array(4),
            Output_Data_3 => OutputData_Array(6),

            Empty_For_NonAll => CTRL_Empty_For_NonAll_Vector(0),
            CTRL_Fault => CTRL_Fault_Vector(0),
            CTRL_Data_Go => CTRL_Data_Go_Vector(0),
            CTRL_Synced => CTRL_Synced_Vector(0),
            CTRL_ILAS_Go => CTRL_ILAS_Go_Vector(0),
            Input_MainData_Read => Lanes_Input_MainData_Read_Vector(0),
            StatusVector => LanesStatusVector_Array(0),
            LANE_RX_DATA => LANE_RX_DATA_Array(0),
            LANE_RX_K => LANE_RX_K_Array(0),


            --lanes
            LANE0_TXD_P => LANE_TXD_P_Vector(0),
            LANE0_TXD_N => LANE_TXD_N_Vector(0),
            LANE0_RXD_P => LANE_RXD_P_Vector(0),
            LANE0_RXD_N => LANE_RXD_N_Vector(0)

        );


    inst_Transciever_OneLane_1 : Transciever_OneLane
        -- ports
        port map( 

            --clk and resets
            Logic_Clock => Logic_Clock,
            Logic_Reser_N => Logic_Reset_N,
            CTRL_RST_N => CTRL_Reset_N,
            CTRL_CLK => CTRL_Clock,
            REF_CLK => REF_Clock,

            --inputs
            Input_Data_0 => InputData_Array(1),
            Input_Data_1 => InputData_Array(3),
            Input_Data_2 => InputData_Array(5),
            Input_Data_3 => InputData_Array(7),
            
            SYNC_OK => Lanes_SYNC_OK,
            Read_Enable => Lanes_Alignment_Fifo_Read,

            CTRL_Fault_CLR => Lanes_CTRL_Fault_CLR,
            

            -- Outputs
            Output_Data_0 => OutputData_Array(1),
            Output_Data_1 => OutputData_Array(3),
            Output_Data_2 => OutputData_Array(5),
            Output_Data_3 => OutputData_Array(7),

            Empty_For_NonAll => CTRL_Empty_For_NonAll_Vector(1),
            CTRL_Fault => CTRL_Fault_Vector(1),
            CTRL_Data_Go => CTRL_Data_Go_Vector(1),
            CTRL_Synced => CTRL_Synced_Vector(1),
            CTRL_ILAS_Go => CTRL_ILAS_Go_Vector(1),
            Input_MainData_Read => Lanes_Input_MainData_Read_Vector(1),
            StatusVector => LanesStatusVector_Array(1),
            LANE_RX_DATA => LANE_RX_DATA_Array(1),
            LANE_RX_K => LANE_RX_K_Array(1),


            --lanes
            LANE0_TXD_P => LANE_TXD_P_Vector(1),
            LANE0_TXD_N => LANE_TXD_N_Vector(1),
            LANE0_RXD_P => LANE_RXD_P_Vector(1),
            LANE0_RXD_N => LANE_RXD_N_Vector(1)

        );



end rtl;