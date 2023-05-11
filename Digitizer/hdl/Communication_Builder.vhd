library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Communication_Builder is
    port
    (
        Clock : in std_logic;                                           --system clock
        Reset_N : in std_logic;                                         --system reset

        Event_RAM_R_Address : out std_logic_vector(9 downto 0);
        Event_RAM_R_Data_Start_ADDR : in std_logic_vector(19 downto 0);
        Event_RAM_R_Data_Number : in std_logic_vector(19 downto 0);
        Event_RAM_R_Data_Size : in std_logic_vector(19 downto 0);
        Event_RAM_R_Data_Status : in std_logic_vector(7 downto 0);
        Event_RAM_W_Enable_Status : out std_logic;
        Event_RAM_W_Data_Status : out std_logic_vector(7 downto 0);

        Sample_RAM_R_Address : out std_logic_vector(15 downto 0);
        Sample_RAM_R_Block_Address : out std_logic_vector(3 downto 0);
        Sample_RAM_R_Data : in std_logic_vector(63 downto 0);

        --communication interface
        Communication_Data_Frame : out std_logic_vector(31 downto 0);
        Communication_Data_Enable : out std_logic;
        Communication_Data_Full : in std_logic;
        Communication_Data_Req : out std_logic
        

    );
end Communication_Builder;


architecture rtl of Communication_Builder is


    constant Event_Status_ID_Free           : std_logic_vector := X"00";
    constant Event_Status_ID_InWrite        : std_logic_vector := X"01";
    constant Event_Status_ID_WriteDone      : std_logic_vector := X"02";
    constant Event_Status_ID_InRead         : std_logic_vector := X"03";

    

------------------------------------------------------------------------------------------------------------
--Signals Declaration
------------------------------------------------------------------------------------------------------------ 
    type FSM_state is   ( 
                            IDLE,               --IDLE
                            COMMUNICATION_REQ,  --Request for selecrted communication 
                            READ_EVENT_INFO,    --Read event info RAMs     
                            SEND_EVENT_HEAD,    --Send event head to communication
                            SEND_PACKET_HEAD,   --Send packet head to communication
                            READ_SAMPLE_DATA,   --Read sample data frm RAM
                            SEND_DATA_FRAMES,   --Sending data frames composits from 3 samples
                            SEND_PACKET_TAIL,   --Send packet tail to communication
                            SEND_EVENT_TAIL,    --Send event tail to communication
                            NEXT_EVENT_ADDR,    --Generate next event ram address
                            END_WAIT           --Wait for generate address
                    
                        );
    signal state_reg, next_state : FSM_state;


    signal Event_RAM_ADDR_GEN_Enable : std_logic;
    signal Event_RAM_R_Address_Integer : integer range 0 to 1024-1 := 0;

    signal Sample_RAM_ADDR_GEN_Reset_N : std_logic;
    signal Sample_RAM_ADDR_GEN_Init : std_logic;
    signal Sample_RAM_ADDR_GEN_Enable : std_logic;
    signal Sample_RAM_ADDR_GEN_Modulo : std_logic;
    signal Sample_RAM_R_Address_Unsigned : unsigned(19 downto 0);
    signal Sample_RAM_R_Order_Unsigned : unsigned(19 downto 0);

    signal Status_Event_WriteDone : std_logic; 

    signal Event_Info_Buffer_Store : std_logic;
    signal Event_Start_ADDR_Buffer : std_logic_vector(19 downto 0);
    signal Event_Number_Buffer : std_logic_vector(19 downto 0);
    signal Event_Size_Buffer : std_logic_vector(19 downto 0);

    signal Data_Counter_Go : std_logic;
    signal Data_Counter_Modulo : std_logic;
    signal Data_Counter_Reset_N : std_logic;
    signal Data_Counter : unsigned (7 downto 0);

    signal DATA_FRAME : std_logic_vector(31 downto 0);

    signal EVENT_HEAD : std_logic_vector(7 downto 0)  := X"AA";
    signal EVENT_TAIL : std_logic_vector(7 downto 0)  := X"BB";
    signal PACKET_HEAD : std_logic_vector(7 downto 0) := X"CC";
    signal PACKET_TAIL : std_logic_vector(7 downto 0) := X"DD";

begin

------------------------------------------------------------------------------------------------------------
--Signals Routing
------------------------------------------------------------------------------------------------------------   
    Event_RAM_R_Address <= std_logic_vector(to_unsigned(Event_RAM_R_Address_Integer, 10));
    
    Sample_RAM_R_Address        <= std_logic_vector(Sample_RAM_R_Address_Unsigned(15 downto 0));
    Sample_RAM_R_Block_Address  <= std_logic_vector(Sample_RAM_R_Address_Unsigned(19 downto 16));

    DATA_FRAME <= X"01234567";
   
    Event_RAM_W_Data_Status <= Event_Status_ID_Free;

------------------------------------------------------------------------------------------------------------
--FSM builder ride
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
    process(next_state, state_reg, Status_Event_WriteDone, Communication_Data_Full, Sample_RAM_ADDR_GEN_Modulo, Data_Counter_Modulo)
    begin

        next_state <= state_reg;

        case state_reg is
        
            when IDLE =>
                if(Status_Event_WriteDone = '1') then
                    next_state <= COMMUNICATION_REQ;
                end if;

            when COMMUNICATION_REQ =>
                if(Communication_Data_Full = '0') then
                    next_state <= READ_EVENT_INFO;
                end if;

            when READ_EVENT_INFO =>
                next_state <= SEND_EVENT_HEAD;

            when SEND_EVENT_HEAD =>
                next_state <= SEND_PACKET_HEAD;

            when SEND_PACKET_HEAD =>
                next_state <= READ_SAMPLE_DATA;

            when READ_SAMPLE_DATA =>
                next_state <= SEND_DATA_FRAMES;

            when SEND_DATA_FRAMES =>
                if(Data_Counter_Modulo = '1' or Sample_RAM_ADDR_GEN_Modulo = '1') then
                     next_state <= SEND_PACKET_TAIL;
                else
                    next_state <= READ_SAMPLE_DATA;
                end if;

            when SEND_PACKET_TAIL =>
                if(Sample_RAM_ADDR_GEN_Modulo = '1') then
                    next_state <= SEND_EVENT_TAIL;
                else
                    next_state <= SEND_PACKET_HEAD;
                end if;    

            when SEND_EVENT_TAIL =>
                next_state <= NEXT_EVENT_ADDR;

            when NEXT_EVENT_ADDR =>
                next_state <= END_WAIT;

            when END_WAIT =>
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
                Event_RAM_ADDR_GEN_Enable   <= '0';
                Event_Info_Buffer_Store     <= '0';

                Sample_RAM_ADDR_GEN_Reset_N <= '0';
                Sample_RAM_ADDR_GEN_Init    <= '0';
                Sample_RAM_ADDR_GEN_Enable  <= '0';

                Data_Counter_Reset_N         <= '0'; 
                Data_Counter_Go             <= '0';

                Communication_Data_Req      <= '0';
                Communication_Data_Enable   <= '0';
                Communication_Data_Frame    <= (others => '0');

                Event_RAM_W_Enable_Status   <= '0';

            when COMMUNICATION_REQ =>
                Event_RAM_ADDR_GEN_Enable   <= '0';
                Event_Info_Buffer_Store     <= '0';

                Sample_RAM_ADDR_GEN_Reset_N <= '0';
                Sample_RAM_ADDR_GEN_Init    <= '0';
                Sample_RAM_ADDR_GEN_Enable  <= '0';

                Data_Counter_Reset_N         <= '0'; 
                Data_Counter_Go             <= '0';

                Communication_Data_Req      <= '1';
                Communication_Data_Enable   <= '0';
                Communication_Data_Frame    <= (others => '0');

                Event_RAM_W_Enable_Status   <= '0';

            when READ_EVENT_INFO =>
                Event_RAM_ADDR_GEN_Enable   <= '0';
                Event_Info_Buffer_Store     <= '1';

                Sample_RAM_ADDR_GEN_Reset_N <= '1';
                Sample_RAM_ADDR_GEN_Init    <= '0';
                Sample_RAM_ADDR_GEN_Enable  <= '0';

                Data_Counter_Reset_N         <= '0'; 
                Data_Counter_Go             <= '0';

                Communication_Data_Req      <= '0';
                Communication_Data_Enable   <= '0';
                Communication_Data_Frame    <= (others => '0');

                Event_RAM_W_Enable_Status   <= '0';

            when SEND_EVENT_HEAD =>
                Event_RAM_ADDR_GEN_Enable   <= '0';
                Event_Info_Buffer_Store     <= '0';

                Sample_RAM_ADDR_GEN_Reset_N <= '1';
                Sample_RAM_ADDR_GEN_Init    <= '1';
                Sample_RAM_ADDR_GEN_Enable  <= '0';

                Data_Counter_Reset_N         <= '0'; 
                Data_Counter_Go             <= '0';

                Communication_Data_Req      <= '0';
                Communication_Data_Enable   <= '1';
                Communication_Data_Frame    <= EVENT_HEAD & X"000000";

                Event_RAM_W_Enable_Status   <= '0';

            when SEND_PACKET_HEAD =>
                Event_RAM_ADDR_GEN_Enable   <= '0';
                Event_Info_Buffer_Store     <= '0';

                Sample_RAM_ADDR_GEN_Reset_N <= '1';
                Sample_RAM_ADDR_GEN_Init    <= '0';
                Sample_RAM_ADDR_GEN_Enable  <= '0';

                Data_Counter_Reset_N         <= '1'; 
                Data_Counter_Go             <= '0';

                Communication_Data_Req      <= '0';
                Communication_Data_Enable   <= '0';
                Communication_Data_Frame    <= PACKET_HEAD & X"000000";

                Event_RAM_W_Enable_Status   <= '0';

            when READ_SAMPLE_DATA =>
                Event_RAM_ADDR_GEN_Enable   <= '0';
                Event_Info_Buffer_Store     <= '0';

                Sample_RAM_ADDR_GEN_Reset_N <= '1';
                Sample_RAM_ADDR_GEN_Init    <= '0';
                Sample_RAM_ADDR_GEN_Enable  <= '1';

                Data_Counter_Reset_N         <= '1'; 
                Data_Counter_Go             <= '0';

                Communication_Data_Req      <= '0';
                Communication_Data_Enable   <= '0';
                Communication_Data_Frame    <= (others => '0');

                Event_RAM_W_Enable_Status   <= '0';

            when SEND_DATA_FRAMES =>
                Event_RAM_ADDR_GEN_Enable   <= '0';
                Event_Info_Buffer_Store     <= '0';

                Sample_RAM_ADDR_GEN_Reset_N <= '1';
                Sample_RAM_ADDR_GEN_Init    <= '0';
                Sample_RAM_ADDR_GEN_Enable  <= '0';

                Data_Counter_Reset_N         <= '1'; 
                Data_Counter_Go             <= '1';

                Communication_Data_Req      <= '0';
                Communication_Data_Enable   <= '1';
                Communication_Data_Frame    <= DATA_FRAME;

                Event_RAM_W_Enable_Status   <= '0';

            when SEND_PACKET_TAIL =>
                Event_RAM_ADDR_GEN_Enable   <= '0';
                Event_Info_Buffer_Store     <= '0';

                Sample_RAM_ADDR_GEN_Reset_N <= '1';
                Sample_RAM_ADDR_GEN_Init    <= '0';
                Sample_RAM_ADDR_GEN_Enable  <= '0';

                Data_Counter_Reset_N         <= '0'; 
                Data_Counter_Go             <= '0';

                Communication_Data_Req      <= '0';
                Communication_Data_Enable   <= '1';
                Communication_Data_Frame    <= PACKET_TAIL & X"000000";

                Event_RAM_W_Enable_Status   <= '0';

            when SEND_EVENT_TAIL =>
                Event_RAM_ADDR_GEN_Enable   <= '0';
                Event_Info_Buffer_Store     <= '0';

                Sample_RAM_ADDR_GEN_Reset_N <= '0';
                Sample_RAM_ADDR_GEN_Init    <= '0';
                Sample_RAM_ADDR_GEN_Enable  <= '0';

                Data_Counter_Reset_N         <= '0'; 
                Data_Counter_Go             <= '0';

                Communication_Data_Req      <= '0';
                Communication_Data_Enable   <= '1';
                Communication_Data_Frame    <= EVENT_TAIL & X"000000";

                Event_RAM_W_Enable_Status   <= '1';

            when NEXT_EVENT_ADDR =>
                Event_RAM_ADDR_GEN_Enable   <= '1';
                Event_Info_Buffer_Store     <= '0';

                Sample_RAM_ADDR_GEN_Reset_N <= '0';
                Sample_RAM_ADDR_GEN_Init    <= '0';
                Sample_RAM_ADDR_GEN_Enable  <= '0';

                Data_Counter_Reset_N         <= '0'; 
                Data_Counter_Go             <= '0';

                Communication_Data_Req      <= '0';
                Communication_Data_Enable   <= '0';
                Communication_Data_Frame    <= (others => '0');

                Event_RAM_W_Enable_Status   <= '0';

            when END_WAIT =>
                Event_RAM_ADDR_GEN_Enable   <= '0';
                Event_Info_Buffer_Store     <= '0';

                Sample_RAM_ADDR_GEN_Reset_N <= '0';
                Sample_RAM_ADDR_GEN_Init    <= '0';
                Sample_RAM_ADDR_GEN_Enable  <= '0';

                Data_Counter_Reset_N         <= '0'; 
                Data_Counter_Go             <= '0';

                Communication_Data_Req      <= '0';
                Communication_Data_Enable   <= '0';
                Communication_Data_Frame    <= (others => '0');

                Event_RAM_W_Enable_Status   <= '0';

            when others =>
                Event_RAM_ADDR_GEN_Enable   <= '0';
                Event_Info_Buffer_Store     <= '0';

                Sample_RAM_ADDR_GEN_Reset_N <= '0';
                Sample_RAM_ADDR_GEN_Init    <= '0';
                Sample_RAM_ADDR_GEN_Enable  <= '0';

                Data_Counter_Reset_N         <= '0'; 
                Data_Counter_Go             <= '0';

                Communication_Data_Req      <= '0';
                Communication_Data_Enable   <= '0';
                Communication_Data_Frame    <= (others => '0');

                Event_RAM_W_Enable_Status   <= '0';
                

        end case;

    end process;



------------------------------------------------------------------------------------------------------------
--process event info buffer
------------------------------------------------------------------------------------------------------------
process(Clock,Reset_N)

begin

    if(Reset_N = '0') then
        Event_Start_ADDR_Buffer <= (others => '0');
        Event_Number_Buffer <= (others => '0');
        Event_Size_Buffer <= (others => '0');

    elsif(Clock'event and Clock = '1') then

        if(Event_Info_Buffer_Store = '1')then
            Event_Start_ADDR_Buffer <= Event_RAM_R_Data_Start_ADDR;
            Event_Number_Buffer <= Event_RAM_R_Data_Number;
            Event_Size_Buffer <= Event_RAM_R_Data_Size;

        end if;
        
    end if;

end process;

------------------------------------------------------------------------------------------------------------
--process Event RAM Read Address Generator
------------------------------------------------------------------------------------------------------------
    process(Clock,Reset_N)

    begin

        if(Reset_N = '0') then
            Event_RAM_R_Address_Integer <= 0;
		
		elsif(Clock'event and Clock = '1') then
            
            if(Event_RAM_ADDR_GEN_Enable = '1') then
                
                if(Event_RAM_R_Address_Integer >= 1023) then
                    Event_RAM_R_Address_Integer <= 0;
                else
                    Event_RAM_R_Address_Integer <= Event_RAM_R_Address_Integer + 1;
                end if;

            end if;
	
		end if;

    end process;

------------------------------------------------------------------------------------------------------------
--process Sample RAM Read Address Generator
------------------------------------------------------------------------------------------------------------
    process(Clock,Sample_RAM_ADDR_GEN_Reset_N)

    begin

        if(Sample_RAM_ADDR_GEN_Reset_N = '0') then
            Sample_RAM_R_Address_Unsigned <= (others => '0');
            Sample_RAM_R_Order_Unsigned <= (others => '0');
            Sample_RAM_ADDR_GEN_Modulo <= '0';
		
		elsif(Clock'event and Clock = '1') then
            
            if(Sample_RAM_ADDR_GEN_Init = '1') then
                Sample_RAM_ADDR_GEN_Modulo <= '0';
                Sample_RAM_R_Address_Unsigned <= unsigned(Event_Start_ADDR_Buffer);
                Sample_RAM_R_Order_Unsigned <= (others => '0');

            elsif(Sample_RAM_ADDR_GEN_Enable = '1') then
                
                if(Sample_RAM_R_Order_Unsigned >= unsigned(Event_Size_Buffer) - 1) then
                    Sample_RAM_ADDR_GEN_Modulo <= '1';

                else
                    Sample_RAM_ADDR_GEN_Modulo <= '0';
                
                end if;

                Sample_RAM_R_Address_Unsigned <= Sample_RAM_R_Address_Unsigned + 1;
                Sample_RAM_R_Order_Unsigned <= Sample_RAM_R_Order_Unsigned + 1;

            else
                Sample_RAM_R_Address_Unsigned <= Sample_RAM_R_Address_Unsigned;
                Sample_RAM_R_Order_Unsigned <= Sample_RAM_R_Order_Unsigned;

            end if;
	
		end if;

    end process;    

------------------------------------------------------------------------------------------------------------
--process status watcher
------------------------------------------------------------------------------------------------------------
    process(Clock,Reset_N)

    begin

        if(Reset_N = '0') then
            Status_Event_WriteDone <= '0';

		elsif(Clock'event and Clock = '1') then

            if(Event_RAM_R_Data_Status = Event_Status_ID_WriteDone) then
                Status_Event_WriteDone <= '1';
            else
                Status_Event_WriteDone <= '0';
            end if;
            
		end if;

    end process;

------------------------------------------------------------------------------------------------------------
--data frames counter
------------------------------------------------------------------------------------------------------------
    process(Data_Counter_Reset_N,Clock)

    begin

        if(Data_Counter_Reset_N = '0') then
            Data_Counter <= (others => '0');
            Data_Counter_Modulo <= '0';

        elsif(Clock'event and Clock = '1') then

            if(Data_Counter_Go = '1') then
            
                if(Data_Counter >= 8 - 2) then
                
                    Data_Counter_Modulo <= '1';
            
                else
                
                    Data_Counter_Modulo <= '0';
                    Data_Counter <= Data_Counter + 1;
            
                end if;

            --else
                
                --Data_Counter_Modulo <= '0'; 
                --Data_Counter := (others => '0');       
                    
            end if;

        end if;

    end process;

   




end rtl;