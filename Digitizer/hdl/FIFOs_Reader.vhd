library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity FIFOs_Reader is
    port
    (
        Clock : in std_logic;                                           --system clock
        Reset_N : in std_logic;                                         --system reset

        --source
        Event_FIFO_R_Data : in std_logic_vector(17 downto 0);
        Event_FIFO_R_Enable : out std_logic;
        Event_FIFO_Empty : in std_logic;

        Block_0_Sample_FIFO_0_R_Data : in std_logic_vector(15 downto 0);
        Block_0_Sample_FIFO_1_R_Data : in std_logic_vector(15 downto 0);
        Block_0_Sample_FIFO_2_R_Data : in std_logic_vector(15 downto 0);
        Block_0_Sample_FIFO_3_R_Data : in std_logic_vector(15 downto 0);
        Block_0_Sample_FIFO_R_Enable : out std_logic;

        Block_1_Sample_FIFO_0_R_Data : in std_logic_vector(15 downto 0);
        Block_1_Sample_FIFO_1_R_Data : in std_logic_vector(15 downto 0);
        Block_1_Sample_FIFO_2_R_Data : in std_logic_vector(15 downto 0);
        Block_1_Sample_FIFO_3_R_Data : in std_logic_vector(15 downto 0);
        Block_1_Sample_FIFO_R_Enable : out std_logic;
        
        --destination
        Event_RAM_W_Address : out std_logic_vector(9 downto 0);
        Event_RAM_W_Data_Start_ADDR : out std_logic_vector(19 downto 0);
        Event_RAM_W_Data_Number : out std_logic_vector(19 downto 0);
        Event_RAM_W_Data_Size : out std_logic_vector(19 downto 0);
        Event_RAM_W_Data_Status : out std_logic_vector(7 downto 0);
        Event_RAM_W_Enable_Start_ADDR : out std_logic;
        Event_RAM_W_Enable_Number : out std_logic;
        Event_RAM_W_Enable_Size : out std_logic;
        Event_RAM_W_Enable_Status : out std_logic;
        Event_RAM_R_Data_Status : in std_logic_vector(7 downto 0);


        Sample_RAM_W_Address : out std_logic_vector(15 downto 0);
        Sample_RAM_W_Block_Address : out std_logic_vector(3 downto 0);
        Sample_RAM_W_Data : out std_logic_vector(63 downto 0);
        Sample_RAM_W_Enable : out std_logic;
        

        Diag_Valid : out std_logic
    
    );
end FIFOs_Reader;


architecture rtl of FIFOs_Reader is

    constant Number_Of_FIFO_Block     : integer := 2;


    constant Event_Status_ID_Free           : std_logic_vector := X"00";
    constant Event_Status_ID_InWrite        : std_logic_vector := X"01";
    constant Event_Status_ID_WriteDone      : std_logic_vector := X"02";
    constant Event_Status_ID_InRead         : std_logic_vector := X"03";
    
----------------------------------------------------------------------------------------------------------
--Signals Declaration
------------------------------------------------------------------------------------------------------------ 
    type FSM_state is   (
                            IDLE, 
                            Event_FIFO_Read, 
                            Event_Process_Set, 
                            Event_Process_Reset, 
                            Sample_FIFOs_Read_1, 
                            Sample_FIFOs_Read_2,
                            Store_Event_End
                        );
    signal state_reg, next_state : FSM_state;

    signal NewEventInFIFO : std_logic;
    signal EndEventInFIFO : std_logic;
    signal AbortedEventInFIFO : std_logic;

    signal Event_In_Process : std_logic;
    signal Event_In_Process_Set : std_logic;
    signal Event_In_Process_Reset : std_logic;

    signal Data_MUX_Sel : integer range 0 to Number_Of_FIFO_Block-1 := 0;

    signal Block_0_Data : std_logic_vector(63 downto 0);
    signal Block_1_Data : std_logic_vector(63 downto 0);

    signal Sample_RAM_ADDR_GEN_Enable : std_logic;
    signal Sample_RAM_W_Address_Unsigned : unsigned(19 downto 0);

    signal Event_RAM_ADDR_GEN_Enable : std_logic;
    signal Event_RAM_W_Address_Integer : integer range 0 to 1024-1 := 0;
    signal Event_RAM_ADDR_Is_Free : std_logic;

    signal Event_Size_Counter_Reset_N : std_logic;
    signal Event_Size_Counter_Enable: std_logic;
    signal Event_Size_Counter: unsigned(19 downto 0);


begin

------------------------------------------------------------------------------------------------------------
--Signal routing
------------------------------------------------------------------------------------------------------------
    Block_0_Data <=  Block_0_Sample_FIFO_3_R_Data & Block_0_Sample_FIFO_2_R_Data & Block_0_Sample_FIFO_1_R_Data & Block_0_Sample_FIFO_0_R_Data;
    Block_1_Data <=  Block_1_Sample_FIFO_3_R_Data & Block_1_Sample_FIFO_2_R_Data & Block_1_Sample_FIFO_1_R_Data & Block_1_Sample_FIFO_0_R_Data;
    
    NewEventInFIFO <= Event_FIFO_R_Data(0);
    EndEventInFIFO <= Event_FIFO_R_Data(1);
    AbortedEventInFIFO <= Event_FIFO_R_Data(2);

    Sample_RAM_W_Address        <= std_logic_vector(Sample_RAM_W_Address_Unsigned(15 downto 0));
    Sample_RAM_W_Block_Address  <= std_logic_vector(Sample_RAM_W_Address_Unsigned(19 downto 16));
    Event_RAM_W_Address <= std_logic_vector(to_unsigned(Event_RAM_W_Address_Integer, 10));

------------------------------------------------------------------------------------------------------------
--FSM 
------------------------------------------------------------------------------------------------------------
    --state memory and reset
    process(Reset_N,Clock)
    begin

        if(Reset_N = '0') then
            state_reg <= IDLE;
        
        elsif(Clock'event and Clock = '1') then
            state_reg <= next_state;

        end if;
    end process;

    --translation function
    process(next_state, state_reg, Event_FIFO_Empty, NewEventInFIFO, EndEventInFIFO, Event_In_Process, Event_RAM_ADDR_Is_Free)
    begin

        next_state <= state_reg;

        case state_reg is
        
            when IDLE =>
                if(Event_FIFO_Empty = '0' and Event_RAM_ADDR_Is_Free = '1') then
                    next_state <= Event_FIFO_Read;
                end if;
                
            when Event_FIFO_Read =>
                if(EndEventInFIFO = '1') then
                    next_state <= Event_Process_Reset;
                elsif(NewEventInFIFO = '1') then
                    next_state <= Event_Process_Set;
                elsif(Event_In_Process = '1') then
                    next_state <= Sample_FIFOs_Read_1;
                else 
                    next_state <= IDLE;
                end if;

            when Event_Process_Set =>
                next_state <= Sample_FIFOs_Read_1;

            when Event_Process_Reset =>
                next_state <= Sample_FIFOs_Read_1;

            when Sample_FIFOs_Read_1 =>
                next_state <= Sample_FIFOs_Read_2;

            when Sample_FIFOs_Read_2 =>
                if(Event_In_Process = '0') then
                     next_state <= Store_Event_End;
                elsif(Event_FIFO_Empty = '1') then --možná upravit nebo signalizovat chybovou událost
                    --next_state <= IDLE;
                    next_state <= Store_Event_End;
                else
                    next_state <= Event_FIFO_Read;
                end if;

            when Store_Event_End =>
                next_state <= IDLE;
                

            when others =>
                null; 

        end case;
    end process;

    --output function
    process(state_reg,Sample_RAM_W_Address_Unsigned,Event_Size_Counter)
    begin

        case state_reg is
        
            when IDLE =>
                Event_FIFO_R_Enable <= '0';
                Block_0_Sample_FIFO_R_Enable <= '0';
                Block_1_Sample_FIFO_R_Enable <= '0';
                Event_In_Process_Set <= '0';
                Event_In_Process_Reset <= '0';
                Data_MUX_Sel <= 0;
                Sample_RAM_W_Enable <= '0';
                Sample_RAM_ADDR_GEN_Enable <= '0';
                
                Event_RAM_ADDR_GEN_Enable <= '0';
                Event_RAM_W_Enable_Start_ADDR <= '0';
                Event_RAM_W_Enable_Number <= '0';
                Event_RAM_W_Enable_Size <= '0';
                Event_RAM_W_Enable_Status <= '0';

                Event_RAM_W_Data_Start_ADDR <= (others => '0');
                Event_RAM_W_Data_Number <= (others => '0');
                Event_RAM_W_Data_Size <= (others => '0');
                Event_RAM_W_Data_Status <= (others => '0');

                Event_Size_Counter_Reset_N <= '0';
                Event_Size_Counter_Enable <= '0';
                
            when Event_FIFO_Read =>
                Event_FIFO_R_Enable <= '1';
                Block_0_Sample_FIFO_R_Enable <= '0';
                Block_1_Sample_FIFO_R_Enable <= '0';
                Event_In_Process_Set <= '0';
                Event_In_Process_Reset <= '0';
                Data_MUX_Sel <= 0;
                Sample_RAM_W_Enable <= '0';
                Sample_RAM_ADDR_GEN_Enable <= '0';

                Event_RAM_ADDR_GEN_Enable <= '0';
                Event_RAM_W_Enable_Start_ADDR <= '0';
                Event_RAM_W_Enable_Number <= '0';
                Event_RAM_W_Enable_Size <= '0';
                Event_RAM_W_Enable_Status <= '0';

                Event_RAM_W_Data_Start_ADDR <= (others => '0');
                Event_RAM_W_Data_Number <= (others => '0');
                Event_RAM_W_Data_Size <= (others => '0');
                Event_RAM_W_Data_Status <= (others => '0');

                Event_Size_Counter_Reset_N <= '1';
                Event_Size_Counter_Enable <= '0';

            when Event_Process_Set =>
                Event_FIFO_R_Enable <= '0';
                Block_0_Sample_FIFO_R_Enable <= '0';
                Block_1_Sample_FIFO_R_Enable <= '0';
                Event_In_Process_Set <= '1';
                Event_In_Process_Reset <= '0';
                Data_MUX_Sel <= 0;
                Sample_RAM_W_Enable <= '0';
                Sample_RAM_ADDR_GEN_Enable <= '0';

                Event_RAM_ADDR_GEN_Enable <= '0';
                Event_RAM_W_Enable_Start_ADDR <= '1';
                Event_RAM_W_Enable_Number <= '1';
                Event_RAM_W_Enable_Size <= '0';
                Event_RAM_W_Enable_Status <= '1';

                Event_RAM_W_Data_Start_ADDR <= std_logic_vector(Sample_RAM_W_Address_Unsigned);
                Event_RAM_W_Data_Number <= (others => '0');
                Event_RAM_W_Data_Size <= (others => '0');
                Event_RAM_W_Data_Status <= Event_Status_ID_InWrite;

                Event_Size_Counter_Reset_N <= '1';
                Event_Size_Counter_Enable <= '0';

            when Event_Process_Reset =>
                Event_FIFO_R_Enable <= '0';
                Block_0_Sample_FIFO_R_Enable <= '0';
                Block_1_Sample_FIFO_R_Enable <= '0';
                Event_In_Process_Set <= '0';
                Event_In_Process_Reset <= '1';
                Data_MUX_Sel <= 0;
                Sample_RAM_W_Enable <= '0';
                Sample_RAM_ADDR_GEN_Enable <= '0';

                Event_RAM_ADDR_GEN_Enable <= '0';
                Event_RAM_W_Enable_Start_ADDR <= '0';
                Event_RAM_W_Enable_Number <= '0';
                Event_RAM_W_Enable_Size <= '0';
                Event_RAM_W_Enable_Status <= '0';

                Event_RAM_W_Data_Start_ADDR <= (others => '0');
                Event_RAM_W_Data_Number <= (others => '0');
                Event_RAM_W_Data_Size <= (others => '0');
                Event_RAM_W_Data_Status <= (others => '0');

                Event_Size_Counter_Reset_N <= '1';
                Event_Size_Counter_Enable <= '0';

            when Sample_FIFOs_Read_1 =>
                Event_FIFO_R_Enable <= '0';
                Block_0_Sample_FIFO_R_Enable <= '1';
                Block_1_Sample_FIFO_R_Enable <= '0';
                Event_In_Process_Set <= '0';
                Event_In_Process_Reset <= '0';
                Data_MUX_Sel <= 0;
                Sample_RAM_W_Enable <= '1';
                Sample_RAM_ADDR_GEN_Enable <= '1';

                Event_RAM_ADDR_GEN_Enable <= '0';
                Event_RAM_W_Enable_Start_ADDR <= '0';
                Event_RAM_W_Enable_Number <= '0';
                Event_RAM_W_Enable_Size <= '0';
                Event_RAM_W_Enable_Status <= '0';

                Event_RAM_W_Data_Start_ADDR <= (others => '0');
                Event_RAM_W_Data_Number <= (others => '0');
                Event_RAM_W_Data_Size <= (others => '0');
                Event_RAM_W_Data_Status <= (others => '0');

                Event_Size_Counter_Reset_N <= '1';
                Event_Size_Counter_Enable <= '1';

            when Sample_FIFOs_Read_2 =>
                Event_FIFO_R_Enable <= '0';
                Block_0_Sample_FIFO_R_Enable <= '0';
                Block_1_Sample_FIFO_R_Enable <= '1';
                Event_In_Process_Set <= '0';
                Event_In_Process_Reset <= '0';
                Data_MUX_Sel <= 1;
                Sample_RAM_W_Enable <= '1';
                Sample_RAM_ADDR_GEN_Enable <= '1';

                Event_RAM_ADDR_GEN_Enable <= '0';
                Event_RAM_W_Enable_Start_ADDR <= '0';
                Event_RAM_W_Enable_Number <= '0';
                Event_RAM_W_Enable_Size <= '0';
                Event_RAM_W_Enable_Status <= '0';

                Event_RAM_W_Data_Start_ADDR <= (others => '0');
                Event_RAM_W_Data_Number <= (others => '0');
                Event_RAM_W_Data_Size <= (others => '0');
                Event_RAM_W_Data_Status <= (others => '0');

                Event_Size_Counter_Reset_N <= '1';
                Event_Size_Counter_Enable <= '1';

            when Store_Event_End =>
                Event_FIFO_R_Enable <= '0';
                Block_0_Sample_FIFO_R_Enable <= '0';
                Block_1_Sample_FIFO_R_Enable <= '1';
                Event_In_Process_Set <= '0';
                Event_In_Process_Reset <= '0';
                Data_MUX_Sel <= 1;
                Sample_RAM_W_Enable <= '1';
                Sample_RAM_ADDR_GEN_Enable <= '1';

                Event_RAM_ADDR_GEN_Enable <= '1';
                Event_RAM_W_Enable_Start_ADDR <= '0';
                Event_RAM_W_Enable_Number <= '0';
                Event_RAM_W_Enable_Size <= '1';
                Event_RAM_W_Enable_Status <= '1';

                Event_RAM_W_Data_Start_ADDR <= (others => '0');
                Event_RAM_W_Data_Number <= (others => '0');
                Event_RAM_W_Data_Size <= std_logic_vector(Event_Size_Counter);
                Event_RAM_W_Data_Status <= Event_Status_ID_WriteDone;

                Event_Size_Counter_Reset_N <= '1';
                Event_Size_Counter_Enable <= '1';

            when others =>
                Event_FIFO_R_Enable <= '0';
                Block_0_Sample_FIFO_R_Enable <= '0';
                Block_1_Sample_FIFO_R_Enable <= '0';
                Event_In_Process_Set <= '0';
                Event_In_Process_Reset <= '0';
                Data_MUX_Sel <= 0;
                Sample_RAM_W_Enable <= '0';
                Sample_RAM_ADDR_GEN_Enable <= '0';

                Event_RAM_ADDR_GEN_Enable <= '0';
                Event_RAM_W_Enable_Start_ADDR <= '0';
                Event_RAM_W_Enable_Number <= '0';
                Event_RAM_W_Enable_Size <= '0';
                Event_RAM_W_Enable_Status <= '0';

                Event_RAM_W_Data_Start_ADDR <= (others => '0');
                Event_RAM_W_Data_Number <= (others => '0');
                Event_RAM_W_Data_Size <= (others => '0');
                Event_RAM_W_Data_Status <= (others => '0');

                Event_Size_Counter_Reset_N <= '0';
                Event_Size_Counter_Enable <= '0';



        end case;

    end process;

------------------------------------------------------------------------------------------------------------
--process: comparator - is addr in event rams free?
------------------------------------------------------------------------------------------------------------
    process(Clock,Reset_N)

    begin

        if(Reset_N = '0') then
            Event_RAM_ADDR_Is_Free <= '0';
		
		elsif(Clock'event and Clock = '1') then
            if(Event_RAM_R_Data_Status = Event_Status_ID_Free) then
                Event_RAM_ADDR_Is_Free <= '1';

            else 
                Event_RAM_ADDR_Is_Free <= '0';

            end if;
	
		end if;

    end process;

------------------------------------------------------------------------------------------------------------
--process Event_In_Process register
------------------------------------------------------------------------------------------------------------
    process(Clock,Reset_N)

    begin

        if(Reset_N = '0') then
            Event_In_Process <= '0';
		
		elsif(Clock'event and Clock = '1') then
            if(Event_In_Process_Reset = '1') then
                Event_In_Process <= '0';

            elsif(Event_In_Process_Set = '1') then
                Event_In_Process <= '1';

            end if;
	
		end if;

    end process;

------------------------------------------------------------------------------------------------------------
--process Event_In_Process register
------------------------------------------------------------------------------------------------------------
    process(Data_MUX_Sel, Block_0_Data, Block_1_Data)

    begin

        case Data_MUX_Sel is

            when 0 =>
                Sample_RAM_W_Data <=  Block_0_Data;

            when 1 =>
                Sample_RAM_W_Data <=  Block_1_Data;

            when others =>
                Sample_RAM_W_Data <= (others => '0');

        end case;

    end process;

------------------------------------------------------------------------------------------------------------
--process Sample RAM Write Address Generator
------------------------------------------------------------------------------------------------------------
    process(Clock,Reset_N)

    begin

        if(Reset_N = '0') then
            Sample_RAM_W_Address_Unsigned <= (others => '0');
		
		elsif(Clock'event and Clock = '1') then
            
            if(Sample_RAM_ADDR_GEN_Enable = '1') then
                
                Sample_RAM_W_Address_Unsigned <= Sample_RAM_W_Address_Unsigned + 1;


            end if;
	
		end if;

    end process;

------------------------------------------------------------------------------------------------------------
--process Event RAM Write Address Generator
------------------------------------------------------------------------------------------------------------
    process(Clock,Reset_N)

    begin

        if(Reset_N = '0') then
            Event_RAM_W_Address_Integer <= 0;
		
		elsif(Clock'event and Clock = '1') then
            
            if(Event_RAM_ADDR_GEN_Enable = '1') then
                
                if(Event_RAM_W_Address_Integer >= 1023) then
                    Event_RAM_W_Address_Integer <= 0;
                else
                    Event_RAM_W_Address_Integer <= Event_RAM_W_Address_Integer + 1;
                end if;

            end if;
	
		end if;

    end process;

------------------------------------------------------------------------------------------------------------
--process Event Size Calc Counter
------------------------------------------------------------------------------------------------------------
    process(Clock, Event_Size_Counter_Reset_N)

    begin

        if(Event_Size_Counter_Reset_N = '0') then
            Event_Size_Counter <= (others => '0');
		
		elsif(Clock'event and Clock = '1') then
            
            if(Event_Size_Counter_Enable = '1') then
                Event_Size_Counter <= Event_Size_Counter + 1;

            end if;
	
		end if;

    end process;



end rtl;