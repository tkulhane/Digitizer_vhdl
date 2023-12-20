library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Alignment_Fifo is
  generic 
  (
    g_WIDTH : natural := 8;
    g_DEPTH : integer := 32
  );
  port 
  (
    Clock : in std_logic;
    Reset_N : in std_logic;
 
    -- FIFO Write Interface
    Write_Enable   : in  std_logic;
    Full    : out std_logic;
    Full_For_All : out std_logic;

    --data bytes vectors ... !!!supplement for all insputs!!!
    Write_Data_0 : in  std_logic_vector(g_WIDTH-1 downto 0);
    Write_Data_1 : in  std_logic_vector(g_WIDTH-1 downto 0);
    Write_Data_2 : in  std_logic_vector(g_WIDTH-1 downto 0);
    Write_Data_3 : in  std_logic_vector(g_WIDTH-1 downto 0);

    --data bytes enable
    Write_Data_Enable : in std_logic_vector(4 - 1 downto 0); --!!!supplement number of all insputs!!!


    -- FIFO Read Interface
    Read_Enable : in  std_logic;
    Empty   : out std_logic;
    Empty_For_NonAll : out std_logic;

    --data bytes vectors ... !!!supplement for all outputs!!!
    Read_Data_0 : out std_logic_vector(g_WIDTH-1 downto 0);
    Read_Data_1 : out std_logic_vector(g_WIDTH-1 downto 0);
    Read_Data_2 : out std_logic_vector(g_WIDTH-1 downto 0);
    Read_Data_3 : out std_logic_vector(g_WIDTH-1 downto 0);
    --data bytes enable
    Read_Data_Enable : in std_logic_vector(4 - 1 downto 0); --!!!supplement number of all outputs!!!
    Read_Data_Empty : out std_logic_vector(4 - 1 downto 0)   --!!!supplement number of all outputs!!!


  );
end Alignment_Fifo;
 
architecture rtl of Alignment_Fifo is

  --!!!supplement number of all insputs!!!
  constant Write_NumberOfDataBytes : integer := 4;
  
  --!!!supplement number of all outputs!!!
  constant Read_NumberOfDataBytes : integer := 4;
 
------------------------------------------------------------------------------------------------------------
--Memory signals declaration
------------------------------------------------------------------------------------------------------------  
  type t_FIFO_DATA is array (0 to g_DEPTH-1) of std_logic_vector(g_WIDTH-1 downto 0);
  signal r_FIFO_DATA : t_FIFO_DATA := (others => (others => '0'));
 
------------------------------------------------------------------------------------------------------------
--Write Signals declaration
------------------------------------------------------------------------------------------------------------  
  type type_wr_index is array(0 to Write_NumberOfDataBytes - 1) of integer range -1 to g_DEPTH-1;
  signal WR_INDEX : type_wr_index;

  signal last_max_WR_INDEX : integer range -1 to g_DEPTH-1 := 0;

  type type_wr_add_index_array is array(0 to Write_NumberOfDataBytes - 1) of integer range -1 to Write_NumberOfDataBytes;
  signal WR_ADD_INDEX : type_wr_add_index_array;
  signal WR_ADD_INDEX_1 : type_wr_add_index_array;

  type type_wr_add_avar_array is array(0 to Write_NumberOfDataBytes - 1) of integer range 0 to 1;
  signal WR_ADD_AVAR : type_wr_add_avar_array;

  signal WR_Enable_Vector_0 : std_logic_vector(Write_NumberOfDataBytes - 1 downto 0);
  signal WR_Enable_Vector_1 : std_logic_vector(Write_NumberOfDataBytes - 1 downto 0);
  
  signal Write_Enable_0 : std_logic;
  signal Write_Enable_1 : std_logic;

  type type_wr_data_vector_array is array(0 to (Write_NumberOfDataBytes - 1)) of std_logic_vector(g_WIDTH - 1 downto 0);
  signal WR_Data_Array_0 : type_wr_data_vector_array;
  signal WR_Data_Array_1 : type_wr_data_vector_array;

------------------------------------------------------------------------------------------------------------
--Read signals declaration
------------------------------------------------------------------------------------------------------------  
  type type_rd_index is array(0 to Read_NumberOfDataBytes - 1) of integer range 0 to g_DEPTH-1;
  signal RD_INDEX : type_rd_index;

  signal last_RD_INDEX : integer range 0 to g_DEPTH-1 := 0;
  signal RD_Enable_Vector_Encoded : integer range 0 to Read_NumberOfDataBytes-1 := 0;
  signal RD_Enable_Vector_Encoded_For_COUNTING : integer range 0 to Read_NumberOfDataBytes := 0;
  signal RD_Enable_Vector_OR : std_logic;
  signal RD_Enable_Vector_OR_temp : std_logic_vector(Read_NumberOfDataBytes - 1 downto 0);

  signal RD_Enable_Vector : std_logic_vector(Read_NumberOfDataBytes - 1 downto 0);

  signal Read_Enable_0 : std_logic;

  type type_rd_data_vector_array is array(0 to (Read_NumberOfDataBytes - 1)) of std_logic_vector(g_WIDTH - 1 downto 0);
  signal RD_Data_Array : type_rd_data_vector_array;

------------------------------------------------------------------------------------------------------------
--Other Signals declaration
------------------------------------------------------------------------------------------------------------  
  -- # Words in FIFO, has extra range to allow for assert conditions
  signal FIFO_COUNT : integer range -1 to g_DEPTH+1 := 0;
  signal FULL_Signal : std_logic;
  signal EMPTY_Signal : std_logic;
  signal Full_For_All_Signal : std_logic;
  signal Read_Data_Empty_Signal : std_logic_vector(Read_NumberOfDataBytes - 1 downto 0);

begin
------------------------------------------------------------------------------------------------------------
--Signals routing... !!!supplement for all insputs and otputs!!!
------------------------------------------------------------------------------------------------------------  
  --data input bytes
  WR_Data_Array_0(0) <= Write_Data_0;
  WR_Data_Array_0(1) <= Write_Data_1;
  WR_Data_Array_0(2) <= Write_Data_2;
  WR_Data_Array_0(3) <= Write_Data_3;

  --data output bytes
  Read_Data_0 <= RD_Data_Array(0);
  Read_Data_1 <= RD_Data_Array(1);
  Read_Data_2 <= RD_Data_Array(2);
  Read_Data_3 <= RD_Data_Array(3);


------------------------------------------------------------------------------------------------------------
--Signals routing
------------------------------------------------------------------------------------------------------------  
  last_max_WR_INDEX <= WR_INDEX(Write_NumberOfDataBytes - 1);
  --last_RD_INDEX <= RD_INDEX(Read_NumberOfDataBytes - 1);

  WR_Enable_Vector_0 <= Write_Data_Enable;
  Write_Enable_0 <= Write_Enable and not Full_For_All_Signal;

  --RD_Enable_Vector <= Read_Data_Enable;
  Read_Enable_0 <= Read_Enable;

  Full <= FULL_Signal;
  Full_For_All <= Full_For_All_Signal;
  Empty <= EMPTY_Signal;
  Read_Data_Empty <= Read_Data_Empty_Signal;

------------------------------------------------------------------------------------------------------------
--Process: Count data in FIFO
------------------------------------------------------------------------------------------------------------
  FIFOcount: process(Clock,Reset_N)
  begin

    if(Reset_N = '0') then
      FIFO_COUNT <= 0;

    elsif(Clock'event and Clock = '1') then
    
      if(Write_Enable_1 = '1' and Read_Enable = '0' and Full_For_All_Signal = '0') then
        FIFO_COUNT <= FIFO_COUNT + WR_ADD_INDEX_1(Write_NumberOfDataBytes - 1);
 
      elsif(Write_Enable_1 = '0' and Read_Enable = '1') then 
        FIFO_COUNT <= FIFO_COUNT - RD_Enable_Vector_Encoded_For_COUNTING;
      
      --TODO: (spis asi ne) mozna sem pridat signal Full_For_All_Signal???
      elsif(Write_Enable_1 = '1' and Read_Enable = '1') then
        FIFO_COUNT <= FIFO_COUNT + WR_ADD_INDEX_1(Write_NumberOfDataBytes - 1) - RD_Enable_Vector_Encoded_For_COUNTING;

      end if;

    end if;  

end process;


------------------------------------------------------------------------------------------------------------
--FULL an EMPTY generate
------------------------------------------------------------------------------------------------------------
  FULL_Signal  <= '1' when FIFO_COUNT = g_DEPTH else '0';
  Full_For_All_Signal <= '1' when (FIFO_COUNT + Write_NumberOfDataBytes) >= g_DEPTH else '0';
  
  EMPTY_Signal <= '1' when FIFO_COUNT = 0   else '0';  

  Read_Data_Empty_Signal_GEN : for i in 0 to (Read_NumberOfDataBytes - 1) generate  
    Read_Data_Empty_Signal(Read_NumberOfDataBytes - i - 1) <= '0' when (i < FIFO_COUNT) else '1';
  end generate Read_Data_Empty_Signal_GEN;

  Empty_For_NonAll <= or Read_Data_Empty_Signal;


------------------------------------------------------------------------------------------------------------
--GENERATE Write ADD INDEXs
------------------------------------------------------------------------------------------------------------

  WR_ADD_AVAR_GEN : for i in 0 to (Write_NumberOfDataBytes - 1) generate  
    WR_ADD_AVAR(i) <= 1 when (WR_Enable_Vector_0(i) = '1') else 0;
  end generate WR_ADD_AVAR_GEN;

  WR_ADD_INDEX(0) <= WR_ADD_AVAR(0);
  WR_A_GEN : for i in 1 to (Write_NumberOfDataBytes - 1) generate
    WR_ADD_INDEX(i) <= WR_ADD_AVAR(i) + WR_ADD_INDEX(i - 1); 
  end generate WR_A_GEN;  


------------------------------------------------------------------------------------------------------------
--Process: Shift Write Signals
------------------------------------------------------------------------------------------------------------
  write_shift: process(Clock,Reset_N)
  begin

    if(Reset_N = '0') then
      WR_ADD_INDEX_1 <= (others => 0);
      WR_Enable_Vector_1 <= (others => '0');      
      Write_Enable_1 <= '0';

      Data_Array_Reset : for i in 0 to (Write_NumberOfDataBytes - 1) loop
        WR_Data_Array_1(i) <= (others => '0');
      end loop Data_Array_Reset;

      
    elsif(Clock'event and Clock = '1') then
      
      WR_Enable_Vector_1 <= WR_Enable_Vector_0;
      Write_Enable_1 <= Write_Enable_0;
      WR_ADD_INDEX_1 <= WR_ADD_INDEX;

      Data_Array_Shift : for i in 0 to (Write_NumberOfDataBytes - 1) loop
        WR_Data_Array_1(i) <= WR_Data_Array_0(i);
      end loop Data_Array_Shift;
      
    end if;  

  end process;
  
------------------------------------------------------------------------------------------------------------
--Process: Counting WR_INDEXs
------------------------------------------------------------------------------------------------------------
  write_index_control: process(Clock,Reset_N)
  begin

    if(Reset_N = '0') then
      
      WR_INDEX_Reset : for i in 0 to (Write_NumberOfDataBytes - 1) loop
        WR_INDEX(i) <= -1;
      end loop WR_INDEX_Reset;
      
      
    elsif(Clock'event and Clock = '1') then
      
      if(Write_Enable_0 = '1' and Full_For_All_Signal = '0') then
        
        WR_INDEX_Count : for i in 0 to (Write_NumberOfDataBytes - 1) loop
          
          if((last_max_WR_INDEX + WR_ADD_INDEX(i)) >= (g_DEPTH)) then
            WR_INDEX(i) <= WR_ADD_INDEX(i) - (g_DEPTH - last_max_WR_INDEX);
          else
            WR_INDEX(i) <= last_max_WR_INDEX + WR_ADD_INDEX(i);
          end if;

        end loop WR_INDEX_Count;
       
      else

        WR_INDEX_last : for i in 0 to (Write_NumberOfDataBytes - 1) loop
          WR_INDEX(i) <= last_max_WR_INDEX;
        end loop WR_INDEX_last;

      end if;

    end if;  

  end process;

------------------------------------------------------------------------------------------------------------
--Process: Memory Store
------------------------------------------------------------------------------------------------------------
  memory_store : process(Clock,Reset_N)
  begin

    if(Reset_N = '0') then

      Memory_Reset : for i in 0 to (g_DEPTH - 1) loop
        r_FIFO_DATA(i) <= (others => '0');
      end loop Memory_Reset;

      
    elsif(Clock'event and Clock = '1') then
      
      if Write_Enable_1 = '1' then
          
        DATA_Store : for i in 0 to (Write_NumberOfDataBytes - 1) loop
          
          if(WR_Enable_Vector_1(i) = '1') then
            r_FIFO_DATA(WR_INDEX(i)) <= WR_Data_Array_1(i);
          end if;

        end loop DATA_Store;

      end if;  

    end if;  

  end process;



------------------------------------------------------------------------------------------------------------
--Process: Generate RD_Enable_Vector_Encoded - priority encoder
------------------------------------------------------------------------------------------------------------
  RD_Enable_Vector_Encoded_GEN : process(RD_Enable_Vector)
  begin

    for i in 0 to (Read_NumberOfDataBytes - 1) loop
      if(RD_Enable_Vector(i) = '1') then
        RD_Enable_Vector_Encoded <= i;
      end if;
    end loop;

  end process;

------------------------------------------------------------------------------------------------------------
--GENERATE Reads variables - last_RD_INDEX, RD_Enable_Vector_OR and RD_Enable_Vector_Encoded_For_COUNTING
------------------------------------------------------------------------------------------------------------

  RD_Enable_Vector <= Read_Data_Enable and (not Read_Data_Empty_Signal);
  last_RD_INDEX <= RD_INDEX(RD_Enable_Vector_Encoded);
  
  --OR function for Enable vector
  RD_Enable_Vector_OR_temp(0) <= RD_Enable_Vector(0);
  RD_Enable_Vector_OR_GEN : for i in 1 to (Read_NumberOfDataBytes - 1) generate  
    RD_Enable_Vector_OR_temp(i) <=  RD_Enable_Vector_OR_temp(i - 1) or RD_Enable_Vector(i); 
  end generate RD_Enable_Vector_OR_GEN; 
  RD_Enable_Vector_OR <= RD_Enable_Vector_OR_temp(Read_NumberOfDataBytes - 1);

  
  RD_Enable_Vector_Encoded_For_COUNTING <= (RD_Enable_Vector_Encoded + 1) when RD_Enable_Vector_OR = '1' else 0;
                      
------------------------------------------------------------------------------------------------------------
--Process: Counting RD_INDEXs
------------------------------------------------------------------------------------------------------------
  read_index_control: process(Clock,Reset_N)
  begin

    if(Reset_N = '0') then

      RD_INDEX_Reset : for i in 0 to (Read_NumberOfDataBytes - 1) loop
        RD_INDEX(i) <= i;
      end loop RD_INDEX_Reset;


    elsif(Clock'event and Clock = '1') then
      
      if(Read_Enable_0 = '1' and RD_Enable_Vector_OR = '1' and EMPTY_Signal = '0') then

        RD_INDEX_Count : for i in 0 to (Read_NumberOfDataBytes - 1) loop  
          if((last_RD_INDEX + 1 + i) >= g_DEPTH) then
            RD_INDEX(i) <= i - (g_DEPTH - last_RD_INDEX) + 1;
          else
            RD_INDEX(i) <= last_RD_INDEX + 1 + i;
          end if;
        end loop RD_INDEX_Count;

      end if;

    end if;  

  end process;

------------------------------------------------------------------------------------------------------------
--Read data Assing
------------------------------------------------------------------------------------------------------------
  RD_DATA_Array_GEN : for i in 0 to (Read_NumberOfDataBytes - 1) generate
    RD_Data_Array(i) <= r_FIFO_DATA(RD_INDEX(i));
  end generate RD_DATA_Array_GEN;
  
  



end rtl;