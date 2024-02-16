library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Trigger_Main is
    generic
    (
        g_Num_Of_TRG_Units : natural := 8;
        g_BEGIN_END_Vector_Length : natural := 3; -- 2^g_BEGIN_END_Vector_Length >= g_Num_Of_TRG_Units
        g_Data_Length : Natural := 12
    );
    port
    (
        Clock : in std_logic;
        Reset_N : in std_logic;

        Control_Enable : in std_logic;
        Control_Abort : in std_logic;
        Control_Threshold : in std_logic_vector(g_Data_Length - 1 downto 0);
        Control_Sample_Per_Event : in std_logic_vector(31 downto 0);
        Control_Trigger_Out : out std_logic;
        Control_Busy_Out : out std_logic;
        Control_AcqStart : out std_logic;
        
        ALL_FIFO_Enable : out std_logic;
        FIFO_Event_Data : out std_logic_vector(17 downto 0);
        FIFO_Event_A_Full : in std_logic;

        --to trigger units
        TRG_Threshold : out std_logic_vector(g_Data_Length - 1 downto 0);
        TRG_Detect_Vector : in std_logic_vector(g_Num_Of_TRG_Units - 1 downto 0)

    );
end Trigger_Main;


architecture rtl of Trigger_Main is

    constant Event_Location_Length     : integer := 7;

------------------------------------------------------------------------------------------------------------
--Signals Declaration
------------------------------------------------------------------------------------------------------------ 
    --signal Number_Of_SamplesTact_Per_Event : integer range 0 to 1000000 := 10; --výsledně je pocet samplu Number_Of_Samples_Per_Event * g_Num_Of_TRG_Units
    --signal Remaining_Number_Of_SamplesTact : integer range 0 to 1000000 := 0; 


    type FSM_state is   (
                            IDLE, 
                            ACQ_ENABLE, 
                            ACQ_START,
                            ACQ_GO

                        );
    signal state_reg, next_state : FSM_state;


    signal Number_Of_SamplesTact_Per_Event : unsigned(31 downto 0); 
 
    signal Last_TRG_Detect_Vector : std_logic_vector(g_Num_Of_TRG_Units - 1 downto 0);
    
    signal SampleTactCounter_Enable : std_logic;
    signal SampleTactCounter_Reset : std_logic;
    signal SampleTactCounter : unsigned(31 downto 0); 

    signal ACQ_RunSignal : std_logic;
    signal ACQ_LastSampleTact : std_logic;
    signal ACQ_Abort : std_logic;

    signal Trigger_Edge_Valid : std_logic;
    signal Trigger_Edge_Location : integer range -1 to g_Num_Of_TRG_Units - 1 := -1;

    
    signal Event_Start_In_Frame : std_logic;
    signal Event_End_In_Frame : std_logic;
    signal Event_End_Aborted : std_logic;
    signal Event_Reserved_Bit : std_logic;
    signal Event_Info : std_logic_vector(14 - 1 downto 0);


    signal ALL_FIFO_Enable_0 : std_logic;
    signal FIFO_Event_Data_0 : std_logic_vector(17 downto 0);

begin

------------------------------------------------------------------------------------------------------------
--Signals Routing
------------------------------------------------------------------------------------------------------------   
    TRG_Threshold <= Control_Threshold;
    --Number_Of_SamplesTact_Per_Event <= to_integer(unsigned(Control_Sample_Per_Event));
    Number_Of_SamplesTact_Per_Event <= unsigned(Control_Sample_Per_Event);


    ACQ_Abort <= Control_Abort or FIFO_Event_A_Full;

    FIFO_Event_Data <= Event_Info & Event_Reserved_Bit & Event_End_Aborted & Event_End_In_Frame & Event_Start_In_Frame;

------------------------------------------------------------------------------------------------------------
--Process: Delay ALL_FIFO_Enable_0 and FIFO_Event_Data_0 (1 cycle)
------------------------------------------------------------------------------------------------------------
    Delay_Data: process(Clock,Reset_N)
    begin

        if(Reset_N = '0') then
            --ALL_FIFO_Enable <= '0';
            --FIFO_Event_Data <= (others => '0');

        elsif(Clock'event and Clock = '1') then
            --ALL_FIFO_Enable <= ALL_FIFO_Enable_0;
            --FIFO_Event_Data <= FIFO_Event_Data_0;

        end if;  

    end process;  


------------------------------------------------------------------------------------------------------------
-- ToDo : Logic switch trigger sources
------------------------------------------------------------------------------------------------------------
    ACQ_RunSignal <= Trigger_Edge_Valid; --prozatim jen dle "hrany"
    Control_Trigger_Out <= Trigger_Edge_Valid;

------------------------------------------------------------------------------------------------------------
--Process: Store last state of TRG_Detect_Vector 
------------------------------------------------------------------------------------------------------------
    Last_TRG_Detect_Vector_Store: process(Clock,Reset_N)
    begin

        if(Reset_N = '0') then
            Last_TRG_Detect_Vector <= (others => '0');

        elsif(Clock'event and Clock = '1') then
            Last_TRG_Detect_Vector <= TRG_Detect_Vector;
        
        end if;  

    end process;
    
------------------------------------------------------------------------------------------------------------
--Process: Look for 0 to 1 in Detect vectors (Trigger Edge Detect)
------------------------------------------------------------------------------------------------------------
  Trigger_Edge_Detect : process(TRG_Detect_Vector, Last_TRG_Detect_Vector)
  begin

    for i in 0 to (g_Num_Of_TRG_Units - 1) loop
      
        if(i = 0) then

            if(TRG_Detect_Vector(i) = '1' and Last_TRG_Detect_Vector(g_Num_Of_TRG_Units - 1) = '0') then
                Trigger_Edge_Valid <= '1';
                Trigger_Edge_Location <= i;
                exit;

            else
                Trigger_Edge_Valid <= '0'; 
                Trigger_Edge_Location <= -1;
            
            end if;

        else

            if(TRG_Detect_Vector(i) = '1' and TRG_Detect_Vector(i - 1) = '0') then
                Trigger_Edge_Valid <= '1';
                Trigger_Edge_Location <= i;
                exit;

            else
                Trigger_Edge_Valid <= '0'; 
                Trigger_Edge_Location <= -1;
            
            end if;
            
        end if;

    end loop;

  end process;

------------------------------------------------------------------------------------------------------------
--FSM: Acquisition Control
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
    process(next_state, state_reg, Control_Enable, Control_Abort, ACQ_RunSignal, ACQ_LastSampleTact)
    begin

        next_state <= state_reg;

        case state_reg is
        
            when IDLE =>
                if(Control_Enable = '1') then
                    next_state <= ACQ_ENABLE;
                end if;

            when ACQ_ENABLE =>
                if(Control_Enable = '0') then
                    next_state <= IDLE;
                
                elsif(ACQ_RunSignal = '1') then
                    next_state <= ACQ_START;	
                
                end if;

            when ACQ_START =>
                next_state <= ACQ_GO;	     

            when ACQ_GO =>
                if(ACQ_LastSampleTact = '1') then
                    next_state <= ACQ_ENABLE;
                
                elsif(Control_Abort = '1') then
                    next_state <= IDLE;	
           
                end if;

                
            when others =>
                next_state <= IDLE;	

        end case;
    end process;

    --output function
    process(state_reg, ACQ_LastSampleTact, ACQ_Abort)
    begin

        case state_reg is
        
            when IDLE =>
                Control_AcqStart <= '0';
                Control_Busy_Out <= '0';

                ALL_FIFO_Enable <= '0';
                SampleTactCounter_Enable <= '0';
                
                Event_Start_In_Frame <= '0';
                Event_End_In_Frame <= '0';
                Event_End_Aborted <= '0';
                Event_Reserved_Bit <= '0';
                Event_Info <= (others => '0');

            when ACQ_ENABLE =>
                Control_AcqStart <= '0';
                Control_Busy_Out <= '0';

                ALL_FIFO_Enable <= '0';
                SampleTactCounter_Enable <= '0';

                Event_Start_In_Frame <= '0';
                Event_End_In_Frame <= '0';
                Event_End_Aborted <= '0';
                Event_Reserved_Bit <= '0';
                Event_Info <= (others => '0');

            when ACQ_START =>
                Control_AcqStart <= '1';
                Control_Busy_Out <= '1';

                ALL_FIFO_Enable <= '1';
                SampleTactCounter_Enable <= '1';

                Event_Start_In_Frame <= '1';
                Event_End_In_Frame <= '0';
                Event_End_Aborted <= '0';
                Event_Reserved_Bit <= '0';
                Event_Info <= (others => '0');

            when ACQ_GO =>
                Control_AcqStart <= '0';
                Control_Busy_Out <= '1';

                ALL_FIFO_Enable <= '1';
                SampleTactCounter_Enable <= '1';

                Event_Start_In_Frame <= '0';
                Event_End_In_Frame <= ACQ_LastSampleTact;
                Event_End_Aborted <= ACQ_Abort;
                Event_Reserved_Bit <= '0';
                Event_Info <= (others => '0');

            when others =>
                Control_AcqStart <= '0';
                Control_Busy_Out <= '0';

                ALL_FIFO_Enable <= '0';
                SampleTactCounter_Enable <= '0';
                
                Event_Start_In_Frame <= '0';
                Event_End_In_Frame <= '0';
                Event_End_Aborted <= '0';
                Event_Reserved_Bit <= '0';
                Event_Info <= (others => '0');                

        end case;

    end process;


------------------------------------------------------------------------------------------------------------
--Samples Tact Counter
------------------------------------------------------------------------------------------------------------    
    process(Reset_N,Clock)
    begin

        if(Reset_N = '0') then
            SampleTactCounter <= (others => '0');
            ACQ_LastSampleTact <= '0';
        
        elsif(Clock'event and Clock = '1') then

            if(SampleTactCounter_Enable = '1') then

                if(Number_Of_SamplesTact_Per_Event = 0) then 
                    ACQ_LastSampleTact <= '1';
                
                elsif(SampleTactCounter >= Number_Of_SamplesTact_Per_Event - 1) then
                    ACQ_LastSampleTact <= '1';
                end if;

                SampleTactCounter <= SampleTactCounter + 1;

            else
                SampleTactCounter <= (others => '0');
                ACQ_LastSampleTact <= '0';
   

            end if;


        end if;
    end process;

end rtl;