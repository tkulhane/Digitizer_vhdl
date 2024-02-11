library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity TxLaneControl is
  generic 
  (
    g_NumberOfDataOutputBytes : natural := 4;
    g_NumberOfIlasSequences : natural := 3;
    g_Delay : natural := 0
  );
  port 
  (
    Clock : in std_logic;
    Reset_N : in std_logic;

    Input_MainData : in std_logic_vector( (8*g_NumberOfDataOutputBytes) - 1 downto 0);
    Input_MainData_Read : out std_logic;

    Output_Data : out std_logic_vector( (8*g_NumberOfDataOutputBytes) - 1 downto 0);
    Output_K : out std_logic_vector(g_NumberOfDataOutputBytes - 1 downto 0);

    SYNC_OK : in std_logic

  );
end TxLaneControl;
 
architecture rtl of TxLaneControl is

------------------------------------------------------------------------------------------------------------
--constant
------------------------------------------------------------------------------------------------------------ 
    constant NumberOfDataOutputBytes : integer := 4;

  constant const_K_char : std_logic_vector(7 downto 0) := X"BC";
  constant const_A_char : std_logic_vector(7 downto 0) := X"7C";  
  constant const_R_char : std_logic_vector(7 downto 0) := X"1C";   
 
------------------------------------------------------------------------------------------------------------
--Signals declaration
------------------------------------------------------------------------------------------------------------ 
    type type_IlasRawIntCounter_Array is array(0 to g_NumberOfDataOutputBytes - 1) of integer range -1 to 256;
    signal IlasRawCounter : type_IlasRawIntCounter_Array;
    
    type type_data_array is array(0 to g_NumberOfDataOutputBytes - 1) of std_logic_vector(8 - 1 downto 0);  
    signal IlasGeneratorVectors : type_data_array;
    signal OutputData : type_data_array;
    signal Data_DataVector : type_data_array;

    signal last_max_IlasRawCounter: integer range -1 to 256 := 0;
    signal Counter_IlasSequence: integer range 0 to 255 := 0;
    signal Ilas_LastFrame : std_logic;

    type type_logic_array is array(0 to (g_NumberOfDataOutputBytes - 1)) of std_logic;
    signal DataBytesInLastIlasFrame : type_logic_array;
    signal OutputK : type_logic_array;
  
    type type_data_unsigned_array is array(0 to g_NumberOfDataOutputBytes - 1) of unsigned(8 - 1 downto 0);  
    signal Test_Data : type_data_unsigned_array;



  type FSM_state is (SEND_K, DELAY_TO_ILAS, SEND_ILAS, SEND_SWITCH_TO_DATA, SEND_D);
  signal state_reg, next_state : FSM_state;
  signal fsm_timer : unsigned(9 downto 0);


  signal Test_Enable : std_logic;
  signal ILAS_Enable : std_logic;


------------------------------------------------------------------------------------------------------------
--Other Signals declaration
------------------------------------------------------------------------------------------------------------  


begin

------------------------------------------------------------------------------------------------------------
--Array Signals routing
------------------------------------------------------------------------------------------------------------  
  

    --get Input data vector into array     
    InputData_GEN : for i in 0 to (g_NumberOfDataOutputBytes - 1) generate
        Data_DataVector(i) <= Input_MainData((i*8 + 7) downto (i*8)); --generate: (7 downto 0) -> (15 downto 8) -> (23 downto 16) 
    end generate InputData_GEN;

    --get array to output data vector
    OutputData_GEN : for i in 0 to (g_NumberOfDataOutputBytes - 1) generate
        Output_Data((i*8 + 7) downto (i*8)) <= OutputData(i);
    end generate OutputData_GEN;

    OutputK_GEN : for i in 0 to (g_NumberOfDataOutputBytes - 1) generate
        Output_K(i) <= OutputK(i);
    end generate OutputK_GEN;


------------------------------------------------------------------------------------------------------------
--Signals routing
------------------------------------------------------------------------------------------------------------  
  last_max_IlasRawCounter <= IlasRawCounter(g_NumberOfDataOutputBytes - 1);


------------------------------------------------------------------------------------------------------------
--FSM 
------------------------------------------------------------------------------------------------------------
    --state memory and reset
    process(Reset_N,Clock)
    begin

        if(Reset_N = '0') then
            state_reg <= SEND_K;
        
        elsif(Clock'event and Clock = '1') then
            state_reg <= next_state;

        end if;
    end process;

    --fsm timer
    process(Reset_N,Clock)
    begin
    
        if(Reset_N = '0') then
            fsm_timer <= (others => '0');
            
        elsif(Clock'event and Clock = '1') then
            if(state_reg /= next_state) then
                fsm_timer <= (others => '0');
            else
                fsm_timer <= fsm_timer + 1;
            end if;
    
        end if;
    end process;

    --translation function
    process(next_state, state_reg, fsm_timer, SYNC_OK, Ilas_LastFrame)
    begin

        next_state <= state_reg;

        case state_reg is
        
            when SEND_K =>
                if(SYNC_OK = '1') then
                    next_state <= DELAY_TO_ILAS;
                end if;

            when DELAY_TO_ILAS =>
                if(fsm_timer >= g_Delay) then
                    next_state <= SEND_ILAS;
                end if;

            when SEND_ILAS => 
                if(SYNC_OK = '0') then
                    next_state <= SEND_K;
                elsif((Counter_IlasSequence >= g_NumberOfIlasSequences) and (Ilas_LastFrame = '1')) then
                    next_state <= SEND_SWITCH_TO_DATA;
                end if;
            
            when SEND_SWITCH_TO_DATA => 
                next_state <= SEND_D;   
                
            when SEND_D =>
                if(SYNC_OK = '0') then
                    next_state <= SEND_K;
                end if;


            when others =>
                null; 

        end case;
    end process;

    --output function
    process(state_reg)
    begin

        case state_reg is
        
            when SEND_K =>
                Test_Enable <= '0';
                ILAS_Enable <= '0';

            when SEND_ILAS =>
                Test_Enable <= '0';
                ILAS_Enable <= '1';
                
            when SEND_SWITCH_TO_DATA => 
                Test_Enable <= '0';
                ILAS_Enable <= '0';
                
            when SEND_D =>
                Test_Enable <= '0';
                ILAS_Enable <= '0';
                          
            when others =>
                Test_Enable <= '0';
                ILAS_Enable <= '0';
                



        end case;

    end process;

------------------------------------------------------------------------------------------------------------
--Output data MUX
------------------------------------------------------------------------------------------------------------
process(state_reg,IlasRawCounter,Data_DataVector)

begin

    case state_reg is

        when SEND_K =>

            --OutputData(0) <= const_K_char;
            --OutputK(0) <= '1';
        
            MUX_OUTS_K : for i in 0 to (g_NumberOfDataOutputBytes - 1) loop          
                OutputData(i) <= const_K_char;
                OutputK(i) <= '1';
                
                --OutputData(i) <= x"00";--const_K_char;
                --OutputK(i) <= '0';--'1';
            end loop MUX_OUTS_K;

            Input_MainData_Read <= '0';

        when SEND_ILAS => 

            MUX_OUTS_ILAS : for i in 0 to (g_NumberOfDataOutputBytes - 1) loop          
                
                if(IlasRawCounter(i) = -1) then
                    OutputData(i) <= const_R_char;
                    OutputK(i) <= '1';

                elsif(IlasRawCounter(i) = 256) then
                    OutputData(i) <= const_A_char;
                    OutputK(i) <= '1';

                else
                    OutputData(i) <= std_logic_vector(to_unsigned(IlasRawCounter(i), 8));
                    OutputK(i) <= '0';

                end if;

            end loop MUX_OUTS_ILAS;

            Input_MainData_Read <= '0';

        when SEND_SWITCH_TO_DATA =>

            MUX_OUTS_ILAS_Last : for i in 0 to (g_NumberOfDataOutputBytes - 1) loop          
                
                if(DataBytesInLastIlasFrame(i) = '0') then -- jeste ilas Byte
                --if( (LastIlasFrameDataShift > i) ) then -- jeste ilas Byte
                --if( (2 > i) ) then -- jeste ilas Byte

                    if(IlasRawCounter(i) = -1) then
                        OutputData(i) <= const_R_char;
                        OutputK(i) <= '1';

                    elsif(IlasRawCounter(i) = 256) then
                        OutputData(i) <= const_A_char;
                        OutputK(i) <= '1';

                    else
                        OutputData(i) <= std_logic_vector(to_unsigned(IlasRawCounter(i), 8));
                        OutputK(i) <= '0';

                    end if;

                else -- uz je to datovy Byte
                    
                    --OutputData(i) <= Data_DataVector(i);
                    --OutputK(i) <= '0';

                    --dummy znaky
                    OutputData(i) <= const_K_char;
                    OutputK(i) <= '1';

                end if;

            end loop MUX_OUTS_ILAS_Last;

            Input_MainData_Read <= '1';


        when SEND_D =>

            MUX_OUTS_D : for i in 0 to (g_NumberOfDataOutputBytes - 1) loop          
                OutputData(i) <= Data_DataVector(i);
                OutputK(i) <= '0';
            end loop MUX_OUTS_D;

            Input_MainData_Read <= '1';


        when others =>

            MUX_OUTS_OTHERS : for i in 0 to (g_NumberOfDataOutputBytes - 1) loop          
                OutputData(i) <= const_K_char;
                OutputK(i) <= '1';
            end loop MUX_OUTS_OTHERS;

            Input_MainData_Read <= '0';


    end case;

end process;





------------------------------------------------------------------------------------------------------------
--Process: Test Counter
------------------------------------------------------------------------------------------------------------
    Test_Counter: process(Clock,Reset_N)

    begin

        if(Reset_N = '0') then

            --Data_DataVector(3) <= X"A3";
            --Data_DataVector(2) <= X"A2";
            --Data_DataVector(1) <= X"A1";
            --Data_DataVector(0) <= X"A0";


            --Enable_Waiting_Counter <= '0';

            Test_Data_Reset : for i in 0 to (g_NumberOfDataOutputBytes - 1) loop          
                Test_Data(i) <= to_unsigned(i, 8);
            end loop Test_Data_Reset;

        elsif(Clock'event and Clock = '1') then

            if(Test_Enable = '1') then
     
                Test_Data_Count : for i in 0 to (g_NumberOfDataOutputBytes - 1) loop
                    Test_Data(i) <= Test_Data(i) + g_NumberOfDataOutputBytes;
                end loop Test_Data_Count;
    
            else 
            
                Test_Data_Reset_E : for i in 0 to (g_NumberOfDataOutputBytes - 1) loop          
                    Test_Data(i) <= to_unsigned(i, 8);
                end loop Test_Data_Reset_E;

            end if;


        end if;  

    end process;
    



    
------------------------------------------------------------------------------------------------------------
--Process: ILAS_GENERATOR
------------------------------------------------------------------------------------------------------------    
    ILAS_GENERATOR: process(Clock,Reset_N)

    begin

        if(Reset_N = '0') then

            ILAS_RawCounterReset : for i in 0 to (g_NumberOfDataOutputBytes - 1) loop          
                IlasRawCounter(i) <= ((-1) + i);
                DataBytesInLastIlasFrame(i) <= '0';
                
            end loop ILAS_RawCounterReset;

            Counter_IlasSequence <= 0;
            Ilas_LastFrame <= '0';
            

        elsif(Clock'event and Clock = '1') then

            if(ILAS_Enable = '1') then
            
                ILAS_RawSeqCounter : for i in 0 to (g_NumberOfDataOutputBytes - 1) loop
                    
                    if((last_max_IlasRawCounter + i) >= (256)) then
                        IlasRawCounter(i) <= (i - (256 - last_max_IlasRawCounter) - 1);
                        DataBytesInLastIlasFrame(i) <= '1';
                    else
                        IlasRawCounter(i) <= last_max_IlasRawCounter + i + 1;
                        DataBytesInLastIlasFrame(i) <= '0';
                    end if;

                    if(IlasRawCounter(i) = -1) then
                        Counter_IlasSequence <= Counter_IlasSequence + 1;
                    end if;

                    --if(IlasRawCounter(i) >= 256 - 8) then
                    if(IlasRawCounter(i) >= 256 - g_NumberOfDataOutputBytes*2) then 
                        Ilas_LastFrame <= '1';
                    else 
                        Ilas_LastFrame <= '0';
                    end if;

                end loop ILAS_RawSeqCounter;
    
            else 
            
                ILAS_RawCounterReset_Disable : for i in 0 to (g_NumberOfDataOutputBytes - 1) loop          
                    
                    IlasRawCounter(i) <= ((-1) + i);
                    DataBytesInLastIlasFrame(i) <= '0';

                end loop ILAS_RawCounterReset_Disable;

                Counter_IlasSequence <= 0;
                Ilas_LastFrame <= '0';
                

            end if;


        end if;  

    end process;






end rtl;