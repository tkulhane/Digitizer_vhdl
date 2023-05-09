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
        
        ALL_FIFO_Enable : out std_logic;
        FIFO_Event_Data : out std_logic_vector(17 downto 0);
        FIFO_Event_A_Full : in std_logic;

        TRG_Threshold : out std_logic_vector(g_Data_Length - 1 downto 0);

        TRG_Enable_Vector : out std_logic_vector(g_Num_Of_TRG_Units - 1 downto 0);
        TRG_Detect_Vector : in std_logic_vector(g_Num_Of_TRG_Units - 1 downto 0);
        TRG_First_Is_First : out std_logic;
        TRG_Last_Is_Last : out std_logic

    );
end Trigger_Main;


architecture rtl of Trigger_Main is

    constant Event_Location_Length     : integer := 7;

------------------------------------------------------------------------------------------------------------
--Signals Declaration
------------------------------------------------------------------------------------------------------------ 
    signal Number_Of_Samples_Per_Event : integer range 0 to 1000000 := 500; 
    signal Remaining_Number_Of_Samples : integer range 0 to 1000000 := 0; 

    signal Last_TRG_Detect_Vector : std_logic_vector(g_Num_Of_TRG_Units - 1 downto 0);
    signal Trigger_Edge_Valid : std_logic;
    signal Trigger_Edge_Location : integer range -1 to g_Num_Of_TRG_Units - 1 := -1;
    signal Enable_Acquisition : std_logic;      
    
    signal Event_Start_In_Frame : std_logic;
    signal Event_End_In_Frame : std_logic;
    signal Event_End_Aborted : std_logic;
    signal Event_Reserved_Bit : std_logic;
    signal Event_Start_Location : std_logic_vector(Event_Location_Length - 1 downto 0);
    signal Event_End_Location : std_logic_vector(Event_Location_Length - 1 downto 0);

    signal ALL_FIFO_Enable_0 : std_logic;
    signal FIFO_Event_Data_0 : std_logic_vector(17 downto 0);

begin

------------------------------------------------------------------------------------------------------------
--Signals Routing
------------------------------------------------------------------------------------------------------------   
    TRG_Threshold <= Control_Threshold;
    Number_Of_Samples_Per_Event <= to_integer(unsigned(Control_Sample_Per_Event));

    Control_Trigger_Out <= Trigger_Edge_Valid;
    Control_Busy_Out <= Enable_Acquisition;

    FIFO_Event_Data_0 <= Event_End_Location & Event_Start_Location & Event_Reserved_Bit & Event_End_Aborted & Event_End_In_Frame & Event_Start_In_Frame;

------------------------------------------------------------------------------------------------------------
--Process: Delay ALL_FIFO_Enable_0 and FIFO_Event_Data_0 (1 cycle)
------------------------------------------------------------------------------------------------------------
    Delay_Data: process(Clock,Reset_N)
    begin

        if(Reset_N = '0') then
            ALL_FIFO_Enable <= '0';
            FIFO_Event_Data <= (others => '0');

        elsif(Clock'event and Clock = '1') then
            ALL_FIFO_Enable <= ALL_FIFO_Enable_0;
            FIFO_Event_Data <= FIFO_Event_Data_0;

        end if;  

    end process;  

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
--Process: Acquisition Control
------------------------------------------------------------------------------------------------------------
    Event_Counter: process(Clock,Reset_N)
    begin

        if(Reset_N = '0') then
            TRG_Enable_Vector <= (others => '0');
            Enable_Acquisition <= '0';
            TRG_First_Is_First <= '0';
            TRG_Last_Is_Last <= '0';
            Event_Start_In_Frame <= '0';
            Event_End_In_Frame <= '0';
            Event_End_Aborted <= '0';
            Event_Start_Location <= (others => '0');
            Event_End_Location <=   (others => '0');
            Event_Reserved_Bit <= '0';
            ALL_FIFO_Enable_0 <= '0'; 

        elsif(Clock'event and Clock = '1') then
            
            --Abort Acquisition
            if(Control_Abort = '1' or FIFO_Event_A_Full = '1') then

                if(Enable_Acquisition = '0') then
                    TRG_First_Is_First <= '0';
                    TRG_Last_Is_Last <= '0';
                    TRG_Enable_Vector <= (others => '1');
                    Remaining_Number_Of_Samples <= 0;
                    Enable_Acquisition <= '0';

                    Event_Start_In_Frame <= '0';
                    Event_End_In_Frame <= '0';
                    Event_Start_Location <= std_logic_vector(to_unsigned(0, Event_Location_Length));
                    Event_End_Location <=   std_logic_vector(to_unsigned(0, Event_Location_Length));
                    Event_End_Aborted <= '0';
                    ALL_FIFO_Enable_0 <= '0';

                elsif(Remaining_Number_Of_Samples >= g_Num_Of_TRG_Units) then
                    TRG_First_Is_First <= '0';
                    TRG_Last_Is_Last <= '1';
                    TRG_Enable_Vector <= (others => '1');
                    Remaining_Number_Of_Samples <= 0;
                    Enable_Acquisition <= '0';

                    Event_Start_In_Frame <= '0';
                    Event_End_In_Frame <= '1';
                    Event_Start_Location <= std_logic_vector(to_unsigned(0, Event_Location_Length));
                    Event_End_Location <=   std_logic_vector(to_unsigned(g_Num_Of_TRG_Units - 1, Event_Location_Length));
                    Event_End_Aborted <= '1';
                    ALL_FIFO_Enable_0 <= '1';

                elsif(Remaining_Number_Of_Samples < g_Num_Of_TRG_Units) then

                    for i in 0 to (g_Num_Of_TRG_Units - 1) loop
                        if(i < Remaining_Number_Of_Samples) then
                            TRG_Enable_Vector(i) <= '1';
                        else
                            TRG_Enable_Vector(i) <= '0';
                        end if;

                    end loop;
                    
                    Remaining_Number_Of_Samples <= 0;
                    Enable_Acquisition <= '0';
                    TRG_First_Is_First <= '0';
                    TRG_Last_Is_Last <= '0';

                    Event_Start_In_Frame <= '0';
                    Event_End_In_Frame <= '1';
                    Event_Start_Location <= std_logic_vector(to_unsigned(0, Event_Location_Length));
                    Event_End_Location <=   std_logic_vector(to_unsigned(Remaining_Number_Of_Samples, Event_Location_Length));
                    Event_End_Aborted <= '1';   
                    ALL_FIFO_Enable_0 <= '1';     

                end if;
                
            --Acquisition Go
            elsif(Enable_Acquisition = '1') then

                if(Remaining_Number_Of_Samples = g_Num_Of_TRG_Units) then
                    TRG_First_Is_First <= '0';
                    TRG_Last_Is_Last <= '1';
                    TRG_Enable_Vector <= (others => '1');
                    Remaining_Number_Of_Samples <= 0;
                    Enable_Acquisition <= '0';

                    Event_Start_In_Frame <= '0';
                    Event_End_In_Frame <= '1';
                    Event_Start_Location <= std_logic_vector(to_unsigned(0, Event_Location_Length));
                    Event_End_Location <=   std_logic_vector(to_unsigned(g_Num_Of_TRG_Units - 1, Event_Location_Length));
                    Event_End_Aborted <= '0';
                    ALL_FIFO_Enable_0 <= '1';

                elsif(Remaining_Number_Of_Samples < g_Num_Of_TRG_Units) then

                    for i in 0 to (g_Num_Of_TRG_Units - 1) loop
                        if(i < Remaining_Number_Of_Samples) then
                            TRG_Enable_Vector(i) <= '1';
                        else
                            TRG_Enable_Vector(i) <= '0';
                        end if;

                    end loop;
                    
                    Remaining_Number_Of_Samples <= 0;
                    Enable_Acquisition <= '0';
                    TRG_First_Is_First <= '0';
                    TRG_Last_Is_Last <= '0';

                    Event_Start_In_Frame <= '0';
                    Event_End_In_Frame <= '1';
                    Event_Start_Location <= std_logic_vector(to_unsigned(0, Event_Location_Length));
                    Event_End_Location <=   std_logic_vector(to_unsigned(Remaining_Number_Of_Samples, Event_Location_Length));
                    Event_End_Aborted <= '0';  
                    ALL_FIFO_Enable_0 <= '1';      

                else
                    Remaining_Number_Of_Samples <= Remaining_Number_Of_Samples - g_Num_Of_TRG_Units;
                    TRG_Enable_Vector <= (others => '1');
                    TRG_First_Is_First <= '0';
                    TRG_Last_Is_Last <= '0';

                    Event_Start_In_Frame <= '0';
                    Event_End_In_Frame <= '0';
                    Event_Start_Location <= std_logic_vector(to_unsigned(0, Event_Location_Length));
                    Event_End_Location <=   std_logic_vector(to_unsigned(0, Event_Location_Length));
                    Event_End_Aborted <= '0';
                    ALL_FIFO_Enable_0 <= '1';

                end if;

            --Start Acquisition
            elsif(Trigger_Edge_Valid = '1' and Control_Enable = '1') then
                Enable_Acquisition <= '1';
                TRG_Last_Is_Last <= '0'; 
                Remaining_Number_Of_Samples <= Number_Of_Samples_Per_Event - (g_Num_Of_TRG_Units - Trigger_Edge_Location);

                Event_Start_In_Frame <= '1';
                Event_End_In_Frame <= '0';
                Event_Start_Location <= std_logic_vector(to_unsigned(Trigger_Edge_Location, Event_Location_Length));
                Event_End_Location <=   std_logic_vector(to_unsigned(0, Event_Location_Length));
                Event_End_Aborted <= '0';
                ALL_FIFO_Enable_0 <= '1';

                for i in 0 to (g_Num_Of_TRG_Units - 1) loop
                    if(i >= Trigger_Edge_Location) then
                        TRG_Enable_Vector(i) <= '1';
                    else
                        TRG_Enable_Vector(i) <= '0';
                    end if;

                end loop;

                if(Trigger_Edge_Location = 0) then
                    TRG_First_Is_First <= '1';

                else
                    TRG_First_Is_First <= '0';

                end if;

            --IDLE    
            else
                TRG_Enable_Vector <= (others => '0');
                Enable_Acquisition <= '0';
                TRG_First_Is_First <= '0';  
                TRG_Last_Is_Last <= '0';
                
                Event_Start_In_Frame <= '0';
                Event_End_In_Frame <= '0';
                
                Event_Start_In_Frame <= '0';
                Event_End_In_Frame <= '0';
                Event_Start_Location <= std_logic_vector(to_unsigned(0, Event_Location_Length));
                Event_End_Location <=   std_logic_vector(to_unsigned(0, Event_Location_Length));
                Event_End_Aborted <= '0';
                ALL_FIFO_Enable_0 <= '0';
                   
            end if;
        
        end if;  

    end process;    



end rtl;