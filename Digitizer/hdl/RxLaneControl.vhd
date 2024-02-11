library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity RxLaneControl is
  generic 
  (
    g_NumberOfDataOutputBytes : natural := 4;
    g_NumberOfIlasSequences : natural := 3
  );
  port 
  (
    Clock : in std_logic;
    Reset_N : in std_logic;
 
    Input_Data : in std_logic_vector( (8*g_NumberOfDataOutputBytes) - 1 downto 0);
    Input_K : in std_logic_vector(g_NumberOfDataOutputBytes - 1 downto 0);

    CDR_READY : in std_logic;
    CDR_VAL : in std_logic;

    Output_Data : out std_logic_vector( (8*g_NumberOfDataOutputBytes) - 1 downto 0);
    Output_DataWrite : out std_logic_vector(g_NumberOfDataOutputBytes - 1 downto 0);

    CTRL_Synced : out std_logic;
    CTRL_ILAS_Go : out std_logic;
    CTRL_Data_Go : out std_logic;

    CTRL_Fault_Sync : out std_logic;
    CTRL_Fault_ILAS : out std_logic
    
  );
end RxLaneControl;
 
architecture rtl of RxLaneControl is

------------------------------------------------------------------------------------------------------------
--constant
------------------------------------------------------------------------------------------------------------ 

  constant const_K_char : std_logic_vector(7 downto 0) := X"BC";
  constant const_A_char : std_logic_vector(7 downto 0) := X"7C";  
  constant const_R_char : std_logic_vector(7 downto 0) := X"1C";    
 
------------------------------------------------------------------------------------------------------------
--Signals declaration
------------------------------------------------------------------------------------------------------------ 

  type type_data_vector_array is array(0 to (g_NumberOfDataOutputBytes - 1)) of std_logic_vector(8 - 1 downto 0);

  signal InputData : type_data_vector_array;
  signal BufferedData : type_data_vector_array;
  signal OutputData : type_data_vector_array;

  
  type type_logic_array is array(0 to (g_NumberOfDataOutputBytes - 1)) of std_logic;
  
  signal Input_K_Array : type_logic_array;
  signal ComparatorData_K : type_logic_array;
  signal ComparatorData_A : type_logic_array;
  signal ComparatorData_R : type_logic_array;

  signal AndComparatorData_K : std_logic;
  signal OrComparatorData_K : std_logic;
  signal OrComparatorData_R : std_logic;
  signal OrComparatorData_A : std_logic;

  signal ComparatorData_Last_K : type_logic_array;
  signal ComparatorData_Last_A : type_logic_array;
  signal ComparatorData_Last_R : type_logic_array;

  signal DataWrite : type_logic_array;

  signal Counter_IlasSequence: integer range 0 to 255 := 0;
  signal IlasCounterGo : std_logic;
  signal Last_ILAS_Seq : std_logic;
  signal DataGo_WriteAll : std_logic;


  type FSM_state is (WAIT_FOR_SYNC, WAIT_FOR_xK, WAIT_FOR_ILAS, ILAS_GO, DATA_GO);
  signal state_reg, next_state : FSM_state;
  signal fsm_timer : unsigned(9 downto 0);


------------------------------------------------------------------------------------------------------------
--Other Signals declaration
------------------------------------------------------------------------------------------------------------  


------------------------------------------------------------------------------------------------------------
--Functions
------------------------------------------------------------------------------------------------------------  
    function OR_ARRAY(slv : in type_logic_array) return std_logic is
    
      variable temp : std_logic;
      
      begin

        temp := '0';

        for i in 0 to (g_NumberOfDataOutputBytes - 1) loop
          temp := temp or slv(i);
        end loop;

      return temp;

    end function;


    function AND_ARRAY(slv : in type_logic_array) return std_logic is
    
      variable temp : std_logic;
      
      begin

        temp := '1';

        for i in 0 to (g_NumberOfDataOutputBytes - 1) loop
          temp := temp and slv(i);
        end loop;

      return temp;

    end function;


begin

------------------------------------------------------------------------------------------------------------
--Array Signals routing
------------------------------------------------------------------------------------------------------------  
  

  --get Input data vector into array     
  InputData_GEN : for i in 0 to (g_NumberOfDataOutputBytes - 1) generate
      InputData(i) <= Input_Data((i*8 + 7) downto (i*8)); --generate: (7 downto 0) -> (15 downto 8) -> (23 downto 16) 
  end generate InputData_GEN;

  --get array to output data vector
  OutputData_GEN : for i in 0 to (g_NumberOfDataOutputBytes - 1) generate
      Output_Data((i*8 + 7) downto (i*8)) <= OutputData(i);
  end generate OutputData_GEN;

  OutputDataWrite_GEN : for i in 0 to (g_NumberOfDataOutputBytes - 1) generate
    Output_DataWrite(i) <= DataWrite(i);
  end generate OutputDataWrite_GEN;

  OutputK_GEN : for i in 0 to (g_NumberOfDataOutputBytes - 1) generate
    Input_K_Array(i) <= Input_K(i);
  end generate OutputK_GEN;  
  

------------------------------------------------------------------------------------------------------------
--Signals routing
------------------------------------------------------------------------------------------------------------  



------------------------------------------------------------------------------------------------------------
--FSM
------------------------------------------------------------------------------------------------------------
--state memory and reset
    process(Reset_N,Clock)
    begin

        if(Reset_N = '0') then
            state_reg <= WAIT_FOR_SYNC;
        
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
    process(next_state, state_reg, fsm_timer, CDR_READY, CDR_VAL, AndComparatorData_K, OrComparatorData_A,OrComparatorData_K , Last_ILAS_Seq)
    begin

        next_state <= state_reg;

        case state_reg is
        
            when WAIT_FOR_SYNC =>
                if(CDR_READY = '1' and CDR_VAL = '1' and AndComparatorData_K = '1') then
                    next_state <= WAIT_FOR_xK;        
                end if;
                
            when WAIT_FOR_xK =>
                if(CDR_READY = '0' and CDR_VAL = '0' and AndComparatorData_K = '0') then
                    next_state <= WAIT_FOR_SYNC;
                elsif(fsm_timer >= 20 -1) then
                    next_state <= WAIT_FOR_ILAS;         
                end if;

            when WAIT_FOR_ILAS =>
              if(OrComparatorData_R = '1') then
                next_state <= ILAS_GO;
              end if;

            when ILAS_GO =>
              if(OrComparatorData_A = '1' and Last_ILAS_Seq = '1') then
                next_state <= DATA_GO;
              end if;

            when DATA_GO =>
              null;

            when others =>
                null; 

        end case;
    end process;

    --output function
    process(state_reg)
    begin

        case state_reg is
        
            when WAIT_FOR_SYNC =>
              CTRL_Synced <= '0';
              CTRL_ILAS_Go <= '0';
              CTRL_Data_Go <= '0';
              IlasCounterGo <= '0';
              DataGo_WriteAll <= '0';

            when WAIT_FOR_xK =>
              CTRL_Synced <= '0';
              CTRL_ILAS_Go <= '0';
              CTRL_Data_Go <= '0';   
              IlasCounterGo <= '0';
              DataGo_WriteAll <= '0';
           

            when WAIT_FOR_ILAS =>
              CTRL_Synced <= '1';
              CTRL_ILAS_Go <= '0';
              CTRL_Data_Go <= '0';  
              IlasCounterGo <= '1';
              DataGo_WriteAll <= '0';
            

            when ILAS_GO =>
              CTRL_Synced <= '1';
              CTRL_ILAS_Go <= '1';
              CTRL_Data_Go <= '0';       
              IlasCounterGo <= '1'; 
              DataGo_WriteAll <= '0';
      

            when DATA_GO =>
              CTRL_Synced <= '1';
              CTRL_ILAS_Go <= '0';
              CTRL_Data_Go <= '1';    
              IlasCounterGo <= '0'; 
              DataGo_WriteAll <= '1';
         

            when others =>
              CTRL_Synced <= '0';
              CTRL_ILAS_Go <= '0';
              CTRL_Data_Go <= '0'; 
              IlasCounterGo <= '0'; 
              DataGo_WriteAll <= '0';
              

        end case;

    end process;

------------------------------------------------------------------------------------------------------------
--comparator for driver characters (K,A,R)
------------------------------------------------------------------------------------------------------------
    comparator_K : process(Reset_N,Clock)
    begin

        if(Reset_N = '0') then
          
          --loop: resets comparators
          Comparator_Resets : for i in 0 to (g_NumberOfDataOutputBytes - 1) loop
              ComparatorData_K(i) <= '0';
              ComparatorData_A(i) <= '0';
              ComparatorData_R(i) <= '0';
          end loop Comparator_Resets;


        elsif(Clock'event and Clock = '1') then

          --store last value of comparators values
          ComparatorData_Last_K <= ComparatorData_K;
          ComparatorData_Last_A <= ComparatorData_A;
          ComparatorData_Last_R <= ComparatorData_R;


          --loop: comparator for char K  
          Comparator_K : for i in 0 to (g_NumberOfDataOutputBytes - 1) loop
            if( (Input_K_Array(i) = '1') and (InputData(i) = const_K_char) ) then
              ComparatorData_K(i) <= '1';
            else
              ComparatorData_K(i) <= '0';
            end if;
          end loop Comparator_K;

          --loop: comparator for char A  
          Comparator_A : for i in 0 to (g_NumberOfDataOutputBytes - 1) loop
            if( (Input_K_Array(i) = '1') and (InputData(i) = const_A_char) ) then
              ComparatorData_A(i) <= '1';
            else
              ComparatorData_A(i) <= '0';
            end if;
          end loop Comparator_A;

          --loop: comparator for char R
          Comparator_R : for i in 0 to (g_NumberOfDataOutputBytes - 1) loop
            if( (Input_K_Array(i) = '1') and (InputData(i) = const_R_char) ) then
              ComparatorData_R(i) <= '1';
            else
              ComparatorData_R(i) <= '0';
            end if;
          end loop Comparator_R;
        
        end if;
    end process;


------------------------------------------------------------------------------------------------------------
--Comparator And Or gen
------------------------------------------------------------------------------------------------------------
  


  AndComparatorData_K <= AND_ARRAY(ComparatorData_K);
  OrComparatorData_R <= OR_ARRAY(ComparatorData_R);
  OrComparatorData_A <= OR_ARRAY(ComparatorData_A);
  OrComparatorData_K <= OR_ARRAY(ComparatorData_K);
  
  --AndComparatorData_K <= ComparatorData_K(3) and ComparatorData_K(2) and ComparatorData_K(1) and ComparatorData_K(0);
  --OrComparatorData_R  <= ComparatorData_R(3) or ComparatorData_R(2) or ComparatorData_R(1) or ComparatorData_R(0);
  --OrComparatorData_A <= ComparatorData_A(3) or ComparatorData_A(2) or ComparatorData_A(1) or ComparatorData_A(0);
  
  --OrComparatorData_K  <= ComparatorData_K(3) or ComparatorData_K(2) or ComparatorData_K(1) or ComparatorData_K(0);

------------------------------------------------------------------------------------------------------------
--Process: D for data - 1 cycle delay
------------------------------------------------------------------------------------------------------------
  data_D : process(Clock,Reset_N)
  begin

    if(Reset_N = '0') then

      data_out_reset : for i in 0 to (g_NumberOfDataOutputBytes - 1) loop
        OutputData(i) <= (others => '0');
        BufferedData(i) <= (others => '0');
      end loop data_out_reset;


    elsif(Clock'event and Clock = '1') then
                      
      data_out_assing_D : for i in 0 to (g_NumberOfDataOutputBytes - 1) loop
        OutputData(i) <= BufferedData(i);
        BufferedData(i) <= InputData(i);
      end loop data_out_assing_D;


    end if;  

  end process;

------------------------------------------------------------------------------------------------------------
--Process: Count of ILAS sequences
------------------------------------------------------------------------------------------------------------
  IlasSeqCount : process(Clock,Reset_N)
  begin

    if(Reset_N = '0') then
      Counter_IlasSequence <= 0;
      Last_ILAS_Seq <= '0';

    elsif(Clock'event and Clock = '1') then

      if(IlasCounterGo = '1') then

        IlasSeqCountLoop : for i in 0 to (g_NumberOfDataOutputBytes - 1) loop
        
          if(OrComparatorData_R = '1') then
            Counter_IlasSequence <= Counter_IlasSequence + 1; 
          end if;  

        end loop IlasSeqCountLoop;

        if(Counter_IlasSequence >= g_NumberOfIlasSequences) then
          Last_ILAS_Seq <= '1';    
      
        else
          Last_ILAS_Seq <= '0';   
      
        end if;

      else

        Counter_IlasSequence <= 0;
        Last_ILAS_Seq <= '0';   

      end if;


    end if;  

  end process;


------------------------------------------------------------------------------------------------------------
--Process: Make write signals for alignment fifo
------------------------------------------------------------------------------------------------------------
  MakeWriteSignals : process(Clock,Reset_N)
  begin

    if(Reset_N = '0') then
      
      DataWrite_Reset : for i in 0 to (g_NumberOfDataOutputBytes - 1) loop          
        DataWrite(i) <= '0';
      end loop DataWrite_Reset;


    elsif(Clock'event and Clock = '1') then
      
      
      if(DataGo_WriteAll = '1') then

        
        DataGo_WriteAll_loop : for i in 0 to (g_NumberOfDataOutputBytes - 1) loop          
          
          if(ComparatorData_K(i) = '0') then -- K se nazapisuje do fifo
            DataWrite(i) <= '1';
          else
            DataWrite(i) <= '0';
          end if;
        
        end loop DataGo_WriteAll_loop;


      elsif(Last_ILAS_Seq = '1') then -- posledni ILAS sekvence 

        DataWrite_Reset_ILAS : for i in 0 to (g_NumberOfDataOutputBytes - 1) loop          
          DataWrite(i) <= '0';
        end loop DataWrite_Reset_ILAS;



        Last_Ilas_DataWrite_LOOP : for i in 0 to (g_NumberOfDataOutputBytes - 1) loop          

          if(ComparatorData_A(i) = '1') then -- na i miste je char_A -> vsechny dalsi jsou uz data

            -- od i do konce davam 1
            Last_Ilas_DataWrite_LOOP_2 : for j in i + 1 to (g_NumberOfDataOutputBytes - 1) loop
              
              if(ComparatorData_K(j) = '0') then -- K se nazapisuje do fifo
                DataWrite(j) <= '1';
              else
                DataWrite(j) <= '0';
              end if;

            end loop Last_Ilas_DataWrite_LOOP_2;

          end if;

        end loop Last_Ilas_DataWrite_LOOP;



        --posledni byte predchoziho taktu byl char_A
        if(ComparatorData_Last_A(3) = '1') then
          
          if(ComparatorData_K(0) = '0') then -- K se nazapisuje do fifo
            DataWrite(0) <= '1';
          end if;

        end if;




      else
        

        DataWrite_Reset_ELSE : for i in 0 to (g_NumberOfDataOutputBytes - 1) loop          
          DataWrite(i) <= '0';
        end loop DataWrite_Reset_ELSE;

      end if;

    end if;  

  end process;  












------------------------------------------------------------------------------------------------------------
--GENERATE ...
------------------------------------------------------------------------------------------------------------

  --ADD_AVAR : for i in 0 to (NumberOfDataBytes - 1) generate  
  --  WR_ADD_AVAR(i) <= 1 when (WR_Enable_Vector_0(i) = '1') else 0;
  --end generate ADD_AVAR;


------------------------------------------------------------------------------------------------------------
--Process: 
------------------------------------------------------------------------------------------------------------
  read_index_control: process(Clock,Reset_N)
  begin

    if(Reset_N = '0') then


      
    elsif(Clock'event and Clock = '1') then
      
      --if(xxx = '1') then
        


      --end if;

    end if;  

  end process;



end rtl;