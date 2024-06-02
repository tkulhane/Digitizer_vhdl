library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity AnalyzInCirc_Top is
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
        Transceiver_Rx_K : in std_logic_vector((g_NumOfTranscievers * 8) - 1 downto 0);

        AlignmentFifo_Rx_Data : in std_logic_vector((g_NumOfTranscievers * 64) - 1 downto 0)
        
    
    );
end AnalyzInCirc_Top;


architecture rtl of AnalyzInCirc_Top is

    
------------------------------------------------------------------------------------------------------------
--Signals Declaration
------------------------------------------------------------------------------------------------------------  
    type type_FifoReadData_vector_array is array(0 to (2*g_NumOfTranscievers - 1)) of std_logic_vector(11 downto 0);
    signal FifoReadData_Array : type_FifoReadData_vector_array;
    
    type type_FifoWriteData_vector_array is array(0 to (g_NumOfTranscievers - 1)) of std_logic_vector(12*8 - 1 downto 0);
    signal FifoWriteData_Array : type_FifoWriteData_vector_array;
    signal FifoWriteData2_Array : type_FifoWriteData_vector_array;
    
    
    signal Fifo_Data : std_logic_vector((2*g_NumOfTranscievers * 12) - 1 downto 0);
        
    signal Fifo_Write_Enable : std_logic;
    signal Fifo_Read_Enable : std_logic_vector(2*g_NumOfTranscievers - 1 downto 0);

    signal Fifo_Empty : std_logic_vector(2*g_NumOfTranscievers - 1 downto 0);
    signal Fifo_Full : std_logic_vector(2*g_NumOfTranscievers - 1 downto 0);
    signal Fifo_Clear : std_logic;


    signal Fifo_WriteData : std_logic_vector(2*12 - 1 downto 0);

------------------------------------------------------------------------------------------------------------
--Component AnalyzInCirc_Controler
------------------------------------------------------------------------------------------------------------
    component AnalyzInCirc_Controler is
    generic
    (
        g_NumFifoDataIn : natural := 2
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
        
        Fifo_Data : in std_logic_vector((g_NumFifoDataIn * 12) - 1 downto 0);
        
        Fifo_Write_Enable : out std_logic;
        Fifo_Read_Enable : out std_logic_vector(2*g_NumFifoDataIn - 1 downto 0);

        Fifo_Empty : in std_logic_vector(2*g_NumFifoDataIn - 1 downto 0);
        Fifo_Full : in std_logic_vector(2*g_NumFifoDataIn - 1 downto 0);
        Fifo_Clear : out std_logic

    
    );
    end component;


------------------------------------------------------------------------------------------------------------
--Component AnalyzInCirc_FIFO
------------------------------------------------------------------------------------------------------------
    component AnalyzInCirc_FIFO is
    generic 
    (
        g_Width : natural := 8;
        g_InputWidthFactor : natural := 2;
        g_Depth : integer := 32
    );
    port 
    (
        Clock : in std_logic;
        Reset_N      : in std_logic;

        Clear : in std_logic;
 
        -- FIFO Write Interface
        Write_Enable    : in  std_logic;
        Write_Data      : in  std_logic_vector( g_InputWidthFactor*g_Width-1 downto 0 );
        Full            : out std_logic;
 
        -- FIFO Read Interface
        Read_Enable     : in  std_logic;
        Read_Data       : out std_logic_vector(g_Width-1 downto 0);
        Empty           : out std_logic

    );
    end component;





begin


------------------------------------------------------------------------------------------------------------
--Signals Routing
------------------------------------------------------------------------------------------------------------

    FifoReadData_GEN : for i in 0 to (2*g_NumOfTranscievers - 1) generate
        Fifo_Data( ((i*12) + 11) downto (i*12) ) <= FifoReadData_Array(i); 
    
    end generate FifoReadData_GEN;



    FifoWriteData_GEN : for i in 0 to (g_NumOfTranscievers - 1) generate
        
        XXX_GEN : for j in 0 to (8 - 1) generate

            FifoWriteData_Array(i)(7+(j*12) downto 0+(j*12)) <=   Transceiver_Rx_Data(7+(j*8) + (i*64) downto 0+(j*8) + (i*64));
            FifoWriteData_Array(i)(8+(j*12)) <= Transceiver_Rx_K(j+i);
            FifoWriteData_Array(i)(11+(j*12) downto 9+(j*12)) <= (others => '0');



            FifoWriteData2_Array(i)(7+(j*12) downto 0+(j*12)) <=   AlignmentFifo_Rx_Data(7+(j*8) + (i*64) downto 0+(j*8) + (i*64));
            FifoWriteData2_Array(i)(11+(j*12) downto 8+(j*12)) <= (others => '0');

    
        end generate XXX_GEN;
    
    end generate FifoWriteData_GEN;





    --FifoData_Array(0) <= x"A1B2"; 
    --FifoReadData_Array(1) <= x"ABC"; 

    --FifoWriteData_Array(0) <= x"ABC123";


------------------------------------------------------------------------------------------------------------
--instance AnalyzInCirc_Controler
------------------------------------------------------------------------------------------------------------
    inst_AnalyzInCirc_Controler : AnalyzInCirc_Controler 
    generic map
    (
        g_NumFifoDataIn => 2* g_NumOfTranscievers
    )
    port map
    (
        Clock => Clock,
        Reset_N => Reset_N,

        busy => busy,
        enable_cmd => enable_cmd,
        write_read => write_read,
        addr_frame => addr_frame,
        write_data_frame => write_data_frame,
        read_data_frame => read_data_frame,

        Start_Triggers => Start_Triggers,
        
        Fifo_Data => Fifo_Data,
        
        Fifo_Write_Enable => Fifo_Write_Enable,
        Fifo_Read_Enable => Fifo_Read_Enable,

        Fifo_Empty => Fifo_Empty,
        Fifo_Full => Fifo_Full,
        Fifo_Clear => Fifo_Clear

    );


------------------------------------------------------------------------------------------------------------
--instance AnalyzInCirc_FIFO
------------------------------------------------------------------------------------------------------------
    FifoInst_GEN : for i in 0 to (g_NumOfTranscievers - 1) generate
        
        inst_AnalyzInCirc_FIFO : AnalyzInCirc_FIFO 
        generic map
        (
            g_Width => 12,
            g_InputWidthFactor => 8,
            g_Depth => 1024
        )
        port map
        (
            Clock => Clock,
            Reset_N => Reset_N,

            Clear => Fifo_Clear,
 
            -- FIFO Write Interface
            Write_Enable => Fifo_Write_Enable,
            Write_Data =>  FifoWriteData_Array(i),  
            Full => Fifo_Full(i),      
 
            -- FIFO Read Interface
            Read_Enable => Fifo_Read_Enable(i),    
            Read_Data => FifoReadData_Array(i),     
            Empty => Fifo_Empty(i)       

        );




        inst_AnalyzInCirc_FIFO_2 : AnalyzInCirc_FIFO 
        generic map
        (
            g_Width => 12,
            g_InputWidthFactor => 8,
            g_Depth => 1024
        )
        port map
        (
            Clock => Clock,
            Reset_N => Reset_N,

            Clear => Fifo_Clear,
 
            -- FIFO Write Interface
            Write_Enable => Fifo_Write_Enable,
            Write_Data =>  FifoWriteData2_Array(i),  
            Full => Fifo_Full(i + g_NumOfTranscievers),      
 
            -- FIFO Read Interface
            Read_Enable => Fifo_Read_Enable(i + g_NumOfTranscievers),    
            Read_Data => FifoReadData_Array(i + g_NumOfTranscievers),     
            Empty => Fifo_Empty(i + g_NumOfTranscievers)       

        );
    
    end generate FifoInst_GEN;
    






end rtl;