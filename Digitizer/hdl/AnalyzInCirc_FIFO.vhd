library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity AnalyzInCirc_FIFO is
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
end AnalyzInCirc_FIFO;
 
architecture rtl of AnalyzInCirc_FIFO is
 
    type type_FIFO_DATA_array is array (0 to g_Depth-1) of std_logic_vector(g_Width-1 downto 0);
    signal FIFO_DATA_DATA : type_FIFO_DATA_array := (others => (others => '0'));
 
    signal WR_INDEX   : integer range 0 to g_Depth-1 := 0;
    signal RD_INDEX   : integer range 0 to g_Depth-1 := 0;
 
    signal FIFO_COUNT : integer range -1 to g_Depth+1 := 0;
 
    signal FULL_signal  : std_logic;
    signal EMPTY_signal : std_logic;
   
begin

------------------------------------------------------------------------------------------------------------
--signal routing
------------------------------------------------------------------------------------------------------------
    Read_Data <= FIFO_DATA_DATA(RD_INDEX);
 
    Full  <= FULL_signal;
    Empty <= EMPTY_signal;

    FULL_signal  <= '1' when FIFO_COUNT >= (g_Depth - g_InputWidthFactor) else '0';
    EMPTY_signal <= '1' when FIFO_COUNT = 0       else '0';
 


------------------------------------------------------------------------------------------------------------
--Process: fifo riding
------------------------------------------------------------------------------------------------------------
    process(Reset_N,Clock)
    begin

        if(Reset_N = '0') then
            WR_INDEX <= 0;
            RD_INDEX <= 0;
            FIFO_COUNT <= 0;
        
        elsif(Clock'event and Clock = '1') then
            
            --clear fifo
            if(Clear = '1') then
                WR_INDEX <= 0;
                RD_INDEX <= 0;
                FIFO_COUNT <= 0;
            end if;

            --count data in fifo
            if(Write_Enable = '1' and Read_Enable = '0' and FULL_signal = '0') then
                FIFO_COUNT <= FIFO_COUNT + g_InputWidthFactor;

            end if;

            if(Write_Enable = '0' and Read_Enable = '1' and EMPTY_signal = '0') then
                FIFO_COUNT <= FIFO_COUNT - 1;

            end if;


            --write index 
            if (Write_Enable = '1' and FULL_signal = '0') then
            
                if (WR_INDEX = g_DEPTH-1) then
                    WR_INDEX <= 0;
                else
                    WR_INDEX <= WR_INDEX + g_InputWidthFactor;
                end if;

            end if;
 
            --read index      
            if (Read_Enable = '1' and EMPTY_Signal = '0') then
            
                if (RD_INDEX = g_DEPTH-1) then
                    RD_INDEX <= 0;
                else
                    RD_INDEX <= RD_INDEX + 1;
                end if;

            end if;

            --write data
            if (Write_Enable = '1' and FULL_signal = '0') then

                DATA_Store : for i in 0 to (g_InputWidthFactor - 1) loop
          
                    --r_FIFO_DATA(WR_INDEX(i)) <= WR_Data_Array_1(i);
                    FIFO_DATA_DATA(WR_INDEX + i) <= Write_Data( ((i*g_Width) + (g_Width-1)) downto (i*g_Width) );
  
                end loop DATA_Store;

            end if;



        end if;
    end process;




   

end rtl;
