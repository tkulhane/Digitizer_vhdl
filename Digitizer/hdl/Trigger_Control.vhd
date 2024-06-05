library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.cmd_table_trigger.all;


entity Trigger_Control is
    generic
    (
        g_Num_Of_TRG_Units : natural := 8;
        g_Data_Length : Natural := 12
    );
    port
    (
        Clock : in std_logic;
        Reset_N : in std_logic;

        busy : out std_logic;
        enable_cmd : in std_logic;
        write_read : in std_logic;
        addr_frame : in std_logic_vector(7 downto 0);
        write_data_frame : in std_logic_vector(15 downto 0);
        read_data_frame : out std_logic_vector(15 downto 0);

        FIFO_Event_A_Full : in std_logic;
        FIFO_SampleEventComparator : in std_logic;

        Control_EventNum : out std_logic_vector(14 - 1 downto 0);

        Control_Test_Generator_Enable : out std_logic;
        Control_Mux_DataTest_Sel : out std_logic;
        
        Control_Enable : out std_logic;
        Control_Abort : out std_logic;
        --Control_EnableRst : in std_logic; 
        Control_Threshold : out std_logic_vector(g_Data_Length - 1 downto 0);
        Control_Sample_Per_Event : out std_logic_vector(31 downto 0);
        Control_TriggerSelect : out std_logic_vector(3 downto 0);
        Control_Trigger_Out : in std_logic;
        Control_Busy_Out : in std_logic
        --Control_AcqStart : in std_logic
        

    );
end Trigger_Control;


architecture rtl of Trigger_Control is

------------------------------------------------------------------------------------------------------------
--Signals Declaration
------------------------------------------------------------------------------------------------------------  


    type FSM_state is (IDLE, WAIT_STATE_1, PREPARATION, READ_DATA, WRITE_DATA, WAIT_STATE_2);
    signal state_reg, next_state : FSM_state;

    signal address : std_logic_vector(7 downto 0);

    signal write_signal : std_logic;
    signal read_signal : std_logic;
    
    signal internal_write_signal : std_logic;

    signal last_Control_Trigger_Out : std_logic;
    signal last_Control_Busy_Out : std_logic;

    signal Internal_Enable_Reset : std_logic;

    signal REQ_Counters_Reset : std_logic;
    signal ACQ_Counters_Reset : std_logic;

    signal REG_Set_Number_of_Events_Unsigned : unsigned(31 downto 0) := (others => '0');

    signal InternalEnableAbort : std_logic;
    signal Enable_X_Mask : std_logic; 
    signal AbortMode_Vector : std_logic_vector(2 downto 0);

------------------------------------------------------------------------------------------------------------
--Signals Declaration -> memory registers
------------------------------------------------------------------------------------------------------------  

    signal Counter_Incoming_Events : std_logic_vector(31 downto 0);
    signal Counter_Processed_Events : std_logic_vector(31 downto 0);

    
    signal REG_Enable : std_logic;
    signal REG_MODE : std_logic_vector(3 downto 0);
    signal REG_ABORT_MODE : std_logic_vector(3 downto 0);
    signal REG_Threshold : std_logic_vector(12 - 1 downto 0);
    signal REG_Sample_Per_Event_L : std_logic_vector(16 - 1 downto 0);
    signal REG_Sample_Per_Event_M : std_logic_vector(16 - 1 downto 0);
    signal REG_Test_Generator_Enable : std_logic;
    signal REG_Set_Number_of_Events_L : std_logic_vector(16 - 1 downto 0);
    signal REG_Set_Number_of_Events_M : std_logic_vector(16 - 1 downto 0);
    signal REG_TriggerSelect : std_logic_vector(3 downto 0);
    signal REG_Control_Mux_DataTest_Sel : std_logic;

begin

------------------------------------------------------------------------------------------------------------
--Signals Routing
------------------------------------------------------------------------------------------------------------
    address <= addr_frame;
    REG_Set_Number_of_Events_Unsigned <= unsigned(REG_Set_Number_of_Events_M & REG_Set_Number_of_Events_L);
    
    internal_write_signal <= ACQ_Counters_Reset or Internal_Enable_Reset; --or ... or ...


------------------------------------------------------------------------------------------------------------
--Signals Routing for Output Control
------------------------------------------------------------------------------------------------------------
    Control_Test_Generator_Enable <= REG_Test_Generator_Enable;
    Control_Enable <= REG_Enable and Enable_X_Mask;
    Control_Threshold <= REG_Threshold;
    Control_Sample_Per_Event <= REG_Sample_Per_Event_M & REG_Sample_Per_Event_L;

    Control_EventNum <= Counter_Processed_Events(13 downto 0);

    Control_TriggerSelect <= REG_TriggerSelect;
    
    Control_Mux_DataTest_Sel <= REG_Control_Mux_DataTest_Sel;

------------------------------------------------------------------------------------------------------------
--Signals Routing for aborts signals and FIFO SampleEventComparator
------------------------------------------------------------------------------------------------------------
    Control_Abort <=        AbortMode_Vector(0) and FIFO_Event_A_Full; --for event abort
    InternalEnableAbort <=  AbortMode_Vector(1) and FIFO_Event_A_Full; --for acq enable abort
    
    Enable_X_Mask <=   not (AbortMode_Vector(2) and FIFO_SampleEventComparator);

    --AbortMode_Vector decoder
    process(REG_ABORT_MODE)
    begin

        case REG_ABORT_MODE is

            when "0000" => AbortMode_Vector <="000";
            when "0001" => AbortMode_Vector <="001";
            when "0010" => AbortMode_Vector <="011";
            when "0011" => AbortMode_Vector <="111";
            when others => AbortMode_Vector <="000";

        end case;

    end process;



------------------------------------------------------------------------------------------------------------
--FSM control store setting
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
    process(next_state, state_reg, enable_cmd,write_read)
    begin

        next_state <= state_reg;

        case state_reg is
        
            when IDLE =>
                if(enable_cmd = '1') then
                    next_state <= WAIT_STATE_1;
                end if;
                
            when WAIT_STATE_1 =>
                next_state <= PREPARATION;

            when PREPARATION =>
                if(write_read = '1') then
                    next_state <= READ_DATA;
                else 
                    next_state <= WRITE_DATA;
                end if;

            when READ_DATA =>
                next_state <= WAIT_STATE_2;

            when WRITE_DATA =>
                next_state <= WAIT_STATE_2;
                
            when WAIT_STATE_2 =>
                next_state <= IDLE;

            when others =>
                null; 

        end case;
    end process;

    --output function
    process(state_reg)
    begin

        case state_reg is
        
            when IDLE =>
                busy            <= '0';
                write_signal    <= '0';
                read_signal     <= '0';
                
            when WAIT_STATE_1 =>
                busy            <= '1';
                write_signal    <= '0';
                read_signal     <= '0'; 

            when PREPARATION =>
                busy            <= '1';
                write_signal    <= '0';
                read_signal     <= '0';            

            when READ_DATA =>
                busy            <= '1';
                write_signal    <= '0';
                read_signal     <= '1';            

            when WRITE_DATA =>
                busy            <= '1';
                write_signal    <= '1';
                read_signal     <= '0';
    
            when WAIT_STATE_2 =>
                busy            <= '1';
                write_signal    <= '0';
                read_signal     <= '0';     

            when others =>
                busy            <= '0';
                write_signal    <= '0';
                read_signal     <= '0';

        end case;

    end process;


------------------------------------------------------------------------------------------------------------
--Setting registers Read
------------------------------------------------------------------------------------------------------------
    process(Clock,Reset_N)
    begin

        if(Reset_N = '0') then
            read_data_frame <= (others => '0');
            --read_data_frame <= X"1234";


        elsif(Clock'event and Clock = '1') then    

            if(read_signal = '1') then

                read_data_frame <= (others => '0');

                case(address) is

                    when CMD_TRG_ENABLE => 
                        read_data_frame <= "000000000000000" & REG_Enable;

                    when CMD_TRG_MODE =>
                        read_data_frame <= "000000000000" & REG_MODE;

                    when CMD_TRG_ABORT_MODE =>
                        read_data_frame <= "000000000000" & REG_ABORT_MODE;

                    when CMD_TRG_THRESHOLD =>
                        read_data_frame <= "0000" & REG_Threshold;

                    when CMD_TRG_SAMPLE_PER_EVENT_L =>
                        read_data_frame <= REG_Sample_Per_Event_L;

                    when CMD_TRG_SAMPLE_PER_EVENT_M =>
                        read_data_frame <= REG_Sample_Per_Event_M;

                    when CMD_TRG_COUNTER_EVENT_INCOMING_L =>
                        read_data_frame <= Counter_Incoming_Events(15 downto 0);

                    when CMD_TRG_COUNTER_EVENT_INCOMING_M =>
                        read_data_frame <= Counter_Incoming_Events(31 downto 16);

                    when CMD_TRG_COUNTER_EVENT_PROCESSED_L =>
                        read_data_frame <= Counter_Processed_Events(15 downto 0);

                    when CMD_TRG_COUNTER_EVENT_PROCESSED_M =>
                        read_data_frame <= Counter_Processed_Events(31 downto 16);

                    when CMD_TRG_SET_NUMBERS_OF_EVENTS_L =>
                        read_data_frame <= REG_Set_Number_of_Events_L;

                    when CMD_TRG_SET_NUMBERS_OF_EVENTS_M =>
                        read_data_frame <= REG_Set_Number_of_Events_M;

                    when CMD_TRG_TEST_GENERATOR_ENABLE  =>
                        read_data_frame <= "000000000000000" & REG_Test_Generator_Enable;
                        
                    when CMD_TRG_DATA_TEST_MUX =>
                        read_data_frame <= "000000000000000" & REG_Control_Mux_DataTest_Sel;

                    when CMD_TRG_TRIGGER_SELECT =>
                        read_data_frame(3 downto 0) <= REG_TriggerSelect;

                    when others =>
                        read_data_frame <= (others => '0');
                        --read_data_frame <= X"5678";

                end case;

            end if;

        end if;

    end process;    

------------------------------------------------------------------------------------------------------------
--Setting registers write and internal back write
------------------------------------------------------------------------------------------------------------
    process(Clock,Reset_N)
    begin

        if(Reset_N = '0') then
            REG_Test_Generator_Enable <= '0';
            REG_Control_Mux_DataTest_Sel <= '0';
            REG_Enable  <= '0';
            REG_Threshold <= X"121";
            REG_Sample_Per_Event_L <= X"000A";
            REG_Sample_Per_Event_M <= X"0000";
            REG_Set_Number_of_Events_L <= X"0000";
            REG_Set_Number_of_Events_M <= X"0000";
            REG_ABORT_MODE <= "0011";
            REG_TriggerSelect <= "0000";
            
            REQ_Counters_Reset <= '0';

        elsif(Clock'event and Clock = '1') then 

            --internal write (backwrite)
            if(internal_write_signal = '1') then
                
                if(ACQ_Counters_Reset = '1') then
                    REQ_Counters_Reset <= '0';
                
                elsif(Internal_Enable_Reset = '1') then
                    REG_Enable <= '0';
                
                --elsif() then

                end if;

            --write setting user
            elsif(write_signal = '1') then

                case(address) is

                    when CMD_TRG_ENABLE => 
                        REG_Enable <= write_data_frame(0);

                    when CMD_TRG_MODE =>
                        REG_MODE <= write_data_frame(3 downto 0);

                    when CMD_TRG_ABORT_MODE =>
                        REG_ABORT_MODE <= write_data_frame(3 downto 0);

                    when CMD_TRG_THRESHOLD =>
                        REG_Threshold <= write_data_frame(11 downto 0);

                    when CMD_TRG_SAMPLE_PER_EVENT_L =>
                        REG_Sample_Per_Event_L <= write_data_frame;

                    when CMD_TRG_SAMPLE_PER_EVENT_M =>
                        REG_Sample_Per_Event_M <= write_data_frame;

                    when CMD_TRG_SET_NUMBERS_OF_EVENTS_L =>
                        REG_Set_Number_of_Events_L <= write_data_frame;

                    when CMD_TRG_SET_NUMBERS_OF_EVENTS_M =>
                        REG_Set_Number_of_Events_M <= write_data_frame;

                    when CMD_TRG_TEST_GENERATOR_ENABLE  =>
                        REG_Test_Generator_Enable <= write_data_frame(0);
                        
                    when CMD_TRG_DATA_TEST_MUX =>
                        REG_Control_Mux_DataTest_Sel <= write_data_frame(0);

                    when CMD_TRG_COUNTERS_RESET =>
                        REQ_Counters_Reset <= '1';

                    when CMD_TRG_TRIGGER_SELECT =>
                        REG_TriggerSelect <= write_data_frame(3 downto 0);
                    
                    when others =>
                        null;

                end case;

            end if;

        end if;

    end process;



------------------------------------------------------------------------------------------------------------
--Process:Event Counters
------------------------------------------------------------------------------------------------------------
    Event_Counters: process(Clock,Reset_N)
    begin

        if(Reset_N = '0') then
            ACQ_Counters_Reset <= '0';
            Counter_Incoming_Events <= (others => '0');
            Counter_Processed_Events <= (others => '0');

        elsif(Clock'event and Clock = '1') then
            
            --Counter Incoming
            if(Control_Trigger_Out = '1' and last_Control_Trigger_Out = '0') then
                Counter_Incoming_Events <= std_logic_vector( unsigned(Counter_Incoming_Events) + 1 );
            end if;
            last_Control_Trigger_Out <= Control_Trigger_Out;
            
            --Counter Processed
            if(Control_Busy_Out = '1' and last_Control_Busy_Out = '0') then
                Counter_Processed_Events <= std_logic_vector( unsigned(Counter_Processed_Events) + 1 );
            end if;
            last_Control_Busy_Out <= Control_Busy_Out;

            --reset counters
            if(REQ_Counters_Reset = '1') then
                ACQ_Counters_Reset <= '1';
                Counter_Incoming_Events <= (others => '0');
                Counter_Processed_Events <= (others => '0');
            end if;
            
            --acq reset
            if(REQ_Counters_Reset = '0') then
                ACQ_Counters_Reset <= '0';
            end if;
        
        end if;  

    end process;    
    
------------------------------------------------------------------------------------------------------------
--Process:finite number of events logic
------------------------------------------------------------------------------------------------------------
    Finite_Events: process(Clock,Reset_N)

        variable Finite_Event_Counter : unsigned(31 downto 0) := (others => '0');

    begin

        if(Reset_N = '0') then
            Finite_Event_Counter := (others => '0');
            Internal_Enable_Reset <= '0';

            --Control_Abort <= '0';

        elsif(Clock'event and Clock = '1') then
            
            --internal enebla reset
            if(Internal_Enable_Reset = '1') then
                Internal_Enable_Reset <= '0';
            end if;

            --reset enable from xxx
            if(InternalEnableAbort = '1') then
                Internal_Enable_Reset <= '1';
            end if;
            
            --if set>0 and enable=1 -> active finite set events
            if(REG_Set_Number_of_Events_Unsigned > 0 and REG_Enable = '1') then
                
                --count events
                if(Control_Busy_Out = '1' and last_Control_Busy_Out = '0') then
                    Finite_Event_Counter := Finite_Event_Counter + 1;
                
                end if;

                --reset eneble register
                if(Finite_Event_Counter >= REG_Set_Number_of_Events_Unsigned) then
                    Internal_Enable_Reset <= '1';
                end if;
                
            else
                Finite_Event_Counter := (others => '0');    
                Internal_Enable_Reset <= '0';

            end if;
        
        end if;  

    end process;    
    






end rtl;