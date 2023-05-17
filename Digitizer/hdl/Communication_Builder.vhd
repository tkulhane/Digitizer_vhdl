library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.cmd_table.all;

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
        Communication_Data_Req : out std_logic;
        Communication_DATA_Ack : in std_logic;

        Diag_0 : out std_logic;
        Diag_1 : out std_logic;
        Diag_2 : out std_logic
        

    );
end Communication_Builder;


architecture rtl of Communication_Builder is


    constant Event_Status_ID_Free           : std_logic_vector := X"00";
    constant Event_Status_ID_InWrite        : std_logic_vector := X"01";
    constant Event_Status_ID_WriteDone      : std_logic_vector := X"02";
    constant Event_Status_ID_InRead         : std_logic_vector := X"03";

    constant NumOfFramesInPacket : integer range 0 to 32 := 30;

    

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
                            SEND_DATA_FRAMES_1,   --Sending data frames composits from 2 samples
                            SEND_DATA_FRAMES_2,   --Sending data frames composits from 2 samples
                            SEND_PACKET_TAIL,   --Send packet tail to communication
                            SEND_EVENT_TAIL,    --Send event tail to communication
                            NEXT_EVENT_ADDR,    --Generate next event ram address
                            END_WAIT,           --Wait for generate address
                            WAIT_FOR_FIFO
                    
                        );
    signal state_reg, next_state, wait_next_state : FSM_state;


    --signal NumOfFramesInPacket : integer range 0 to 32 := 30;

    signal Event_RAM_ADDR_GEN_Enable : std_logic;
    signal Event_RAM_R_Address_Integer : integer range 0 to 1024-1;

    signal Sample_RAM_ADDR_GEN_Reset_N : std_logic;
    signal Sample_RAM_ADDR_GEN_Init : std_logic;
    signal Sample_RAM_ADDR_GEN_Enable : std_logic;
    signal Sample_RAM_ADDR_GEN_Modulo : std_logic;
    signal Sample_RAM_R_Address_Unsigned : unsigned(19 downto 0);
    signal Sample_RAM_R_Order_Unsigned : unsigned(19 downto 0);

    signal Status_Event_WriteDone : std_logic; 

    signal Sample_Buffer_Store : std_logic;

    signal Event_Info_Buffer_Store : std_logic;
    signal Event_Start_ADDR_Buffer : std_logic_vector(19 downto 0);
    signal Event_Number_Buffer : std_logic_vector(19 downto 0);
    signal Event_Size_Buffer : std_logic_vector(19 downto 0);

    signal Event_Size_Buffer_Unsigned : unsigned(19 downto 0); 

    signal Frame_Counter_Go : std_logic;
    signal Frame_Counter_Modulo : std_logic;
    signal Frame_Counter_Reset_N : std_logic;
    signal Frame_Counter : unsigned (5 downto 0);

    signal Packet_Counter_Go : std_logic;
    --signal Packet_Counter_Modulo : std_logic;
    signal Packet_Counter_Reset_N : std_logic;
    signal Packet_Counter : unsigned (23 downto 0);

    signal Read_sID_Sample_0 : std_logic_vector(3 downto 0);
    signal Read_sID_Sample_1 : std_logic_vector(3 downto 0);
    signal Read_sID_Sample_2 : std_logic_vector(3 downto 0);
    signal Read_sID_Sample_3 : std_logic_vector(3 downto 0);

    signal Read_Sample_0 : std_logic_vector(11 downto 0);
    signal Read_Sample_1 : std_logic_vector(11 downto 0);
    signal Read_Sample_2 : std_logic_vector(11 downto 0);
    signal Read_Sample_3 : std_logic_vector(11 downto 0);

    signal Data_Frame_1 : std_logic_vector(31 downto 0);
    signal Data_Frame_2 : std_logic_vector(31 downto 0);

    signal EVENT_HEAD : std_logic_vector(31 downto 0);
    signal EVENT_TAIL : std_logic_vector(31 downto 0);
    signal PACKET_HEAD : std_logic_vector(31 downto 0);
    signal PACKET_TAIL : std_logic_vector(31 downto 0);

    signal Communication_Data_Frame_F : std_logic_vector(31 downto 0);
    signal Communication_Data_Enable_F : std_logic;
    --signal Communication_Data_Full : std_logic;
    signal Communication_Data_Req_F : std_logic;
    signal Diag_0_F : std_logic;
    signal Diag_1_F : std_logic;
    signal Diag_2_F : std_logic;

begin

------------------------------------------------------------------------------------------------------------
--Signals Routing
------------------------------------------------------------------------------------------------------------   
    Event_RAM_R_Address <= std_logic_vector(to_unsigned(Event_RAM_R_Address_Integer, 10));
    
    Sample_RAM_R_Address        <= std_logic_vector(Sample_RAM_R_Address_Unsigned(15 downto 0));
    Sample_RAM_R_Block_Address  <= std_logic_vector(Sample_RAM_R_Address_Unsigned(19 downto 16));


    Data_Frame_1 <= CMD_CONST_CDb_Data & '0' & std_logic_vector(Frame_Counter) & Read_Sample_1 & Read_Sample_0;
    Data_Frame_2 <= CMD_CONST_CDb_Data & '0' & std_logic_vector(Frame_Counter) & Read_Sample_3 & Read_Sample_2;

    --Data_Frame_1 <= X"00" & Read_Sample_1 & Read_Sample_0;
    --Data_Frame_2 <= X"00" & Read_Sample_3 & Read_Sample_2;

    EVENT_HEAD  <= CMD_CONST_CDb_Command & CMD_CONST_EVENT_HEAD(6 downto 0) & "0000" & Event_Number_Buffer;
    EVENT_TAIL  <= CMD_CONST_CDb_Command & CMD_CONST_EVENT_TAIL(6 downto 0) & std_logic_vector(Packet_Counter);
    PACKET_HEAD <= CMD_CONST_CDb_Command & CMD_CONST_PACKET_HEAD(6 downto 0) & std_logic_vector(Packet_Counter);
    PACKET_TAIL <= CMD_CONST_CDb_Command & CMD_CONST_PACKET_TAIL(6 downto 0) & "000000000000000000" & std_logic_vector(Frame_Counter);

   
    Event_RAM_W_Data_Status <= Event_Status_ID_Free;

    Diag_0 <= Frame_Counter_Modulo;
    Diag_1 <= Sample_RAM_ADDR_GEN_Modulo;
    Diag_2 <= Diag_2_F;

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
    process(next_state, state_reg, Communication_DATA_Ack, wait_next_state, Status_Event_WriteDone, Communication_Data_Full, Sample_RAM_ADDR_GEN_Modulo, Frame_Counter_Modulo)
    begin

        next_state <= state_reg;

        case state_reg is
        
            when IDLE =>
                if(Status_Event_WriteDone = '1') then
                    next_state <= COMMUNICATION_REQ;
                end if;

            when COMMUNICATION_REQ =>
                if(Communication_DATA_Ack = '1') then
                    next_state <= READ_EVENT_INFO;
                end if;

            when READ_EVENT_INFO =>
                next_state <= SEND_EVENT_HEAD;
                wait_next_state <= SEND_EVENT_HEAD;

                if(Communication_Data_Full = '1') then -- wait for fifo
                    next_state <= WAIT_FOR_FIFO;
                end if;

            when SEND_EVENT_HEAD =>
                next_state <= SEND_PACKET_HEAD;
                wait_next_state <= SEND_PACKET_HEAD;

                if(Communication_Data_Full = '1') then -- wait for fifo
                    next_state <= WAIT_FOR_FIFO;
                end if;

            when SEND_PACKET_HEAD =>
                next_state <= READ_SAMPLE_DATA;

            when READ_SAMPLE_DATA =>
                next_state <= SEND_DATA_FRAMES_1;
                wait_next_state <= SEND_DATA_FRAMES_1;

                if(Communication_Data_Full = '1') then -- wait for fifo
                    next_state <= WAIT_FOR_FIFO;
                end if;

            when SEND_DATA_FRAMES_1 =>
                next_state <= SEND_DATA_FRAMES_2;
                wait_next_state <= SEND_DATA_FRAMES_2;

                if(Communication_Data_Full = '1') then -- wait for fifo
                    next_state <= WAIT_FOR_FIFO;
                end if;

            when SEND_DATA_FRAMES_2 =>
                if(Frame_Counter_Modulo = '1' or Sample_RAM_ADDR_GEN_Modulo = '1') then
                     next_state <= SEND_PACKET_TAIL;
                     wait_next_state <= SEND_PACKET_TAIL;
                else
                    next_state <= READ_SAMPLE_DATA;
                    wait_next_state <= READ_SAMPLE_DATA;
                end if;

                if(Communication_Data_Full = '1') then -- wait for fifo
                    next_state <= WAIT_FOR_FIFO;
                end if;

            when SEND_PACKET_TAIL =>
                if(Sample_RAM_ADDR_GEN_Modulo = '1') then
                    next_state <= SEND_EVENT_TAIL;
                    wait_next_state <= SEND_EVENT_TAIL;
                else
                    next_state <= SEND_PACKET_HEAD;
                    wait_next_state <= SEND_PACKET_HEAD;
                end if;

                if(Communication_Data_Full = '1') then -- wait for fifo
                    next_state <= WAIT_FOR_FIFO;
                end if;    

            when SEND_EVENT_TAIL =>
                next_state <= NEXT_EVENT_ADDR;

            when NEXT_EVENT_ADDR =>
                next_state <= END_WAIT;

            when END_WAIT =>
                next_state <= IDLE;



            when WAIT_FOR_FIFO =>
                if(Communication_Data_Full = '0') then
                    next_state <= wait_next_state;
                end if;


            when others =>
                null; 

        end case;

                

    end process;

    --output function
    process(state_reg, EVENT_HEAD, PACKET_HEAD, PACKET_TAIL, EVENT_TAIL, Data_Frame_1, Data_Frame_2)
    begin

        case state_reg is
        
            when IDLE =>
                Event_Info_Buffer_Store     <= '0';
                Event_RAM_ADDR_GEN_Enable   <= '0';

                Sample_RAM_ADDR_GEN_Reset_N <= '0';
                Sample_RAM_ADDR_GEN_Init    <= '0';
                Sample_RAM_ADDR_GEN_Enable  <= '0';

                Sample_Buffer_Store         <= '0';

                Frame_Counter_Reset_N       <= '0'; 
                Frame_Counter_Go            <= '0';
                Packet_Counter_Reset_N      <= '0';
                Packet_Counter_Go           <= '0';

                Communication_Data_Req_F      <= '0';
                Communication_Data_Enable_F   <= '0';
                Communication_Data_Frame_F    <= (others => '0');

                Event_RAM_W_Enable_Status   <= '0';
                Diag_0_F    <= '0';
                Diag_1_F    <= '0';
                Diag_2_F    <= '0';

            when COMMUNICATION_REQ =>
                Event_RAM_ADDR_GEN_Enable   <= '0';
                Event_Info_Buffer_Store     <= '0';

                Sample_RAM_ADDR_GEN_Reset_N <= '0';
                Sample_RAM_ADDR_GEN_Init    <= '0';
                Sample_RAM_ADDR_GEN_Enable  <= '0';

                Sample_Buffer_Store         <= '0';

                Frame_Counter_Reset_N       <= '0'; 
                Frame_Counter_Go            <= '0';
                Packet_Counter_Reset_N      <= '0';
                Packet_Counter_Go           <= '0';

                Communication_Data_Req_F      <= '1';
                Communication_Data_Enable_F   <= '0';
                Communication_Data_Frame_F    <= (others => '0');

                Event_RAM_W_Enable_Status   <= '0';
                Diag_0_F    <= '0';
                Diag_1_F    <= '0';
                Diag_2_F    <= '0';

            when READ_EVENT_INFO =>
                Event_RAM_ADDR_GEN_Enable   <= '0';
                Event_Info_Buffer_Store     <= '1';

                Sample_RAM_ADDR_GEN_Reset_N <= '1';
                Sample_RAM_ADDR_GEN_Init    <= '0';
                Sample_RAM_ADDR_GEN_Enable  <= '0';

                Sample_Buffer_Store         <= '0';

                Frame_Counter_Reset_N       <= '0'; 
                Frame_Counter_Go            <= '0';
                Packet_Counter_Reset_N      <= '0';
                Packet_Counter_Go           <= '0';

                Communication_Data_Req_F      <= '1';
                Communication_Data_Enable_F   <= '0';
                Communication_Data_Frame_F    <= (others => '0');

                Event_RAM_W_Enable_Status   <= '0';
                Diag_0_F    <= '0';
                Diag_1_F    <= '0';
                Diag_2_F    <= '0';

            when SEND_EVENT_HEAD =>
                Event_RAM_ADDR_GEN_Enable   <= '0';
                Event_Info_Buffer_Store     <= '0';

                Sample_RAM_ADDR_GEN_Reset_N <= '1';
                Sample_RAM_ADDR_GEN_Init    <= '1';
                Sample_RAM_ADDR_GEN_Enable  <= '0';

                Sample_Buffer_Store         <= '0';

                Frame_Counter_Reset_N       <= '0'; 
                Frame_Counter_Go            <= '0';
                Packet_Counter_Reset_N      <= '1';
                Packet_Counter_Go           <= '0';

                Communication_Data_Req_F      <= '1';
                Communication_Data_Enable_F   <= '1';
                Communication_Data_Frame_F    <= EVENT_HEAD;

                Event_RAM_W_Enable_Status   <= '0';
                Diag_0_F    <= '0';
                Diag_1_F    <= '0';
                Diag_2_F    <= '0';

            when SEND_PACKET_HEAD =>
                Event_RAM_ADDR_GEN_Enable   <= '0';
                Event_Info_Buffer_Store     <= '0';

                Sample_RAM_ADDR_GEN_Reset_N <= '1';
                Sample_RAM_ADDR_GEN_Init    <= '0';
                Sample_RAM_ADDR_GEN_Enable  <= '0';

                Sample_Buffer_Store         <= '0';

                Frame_Counter_Reset_N       <= '0'; 
                Frame_Counter_Go            <= '0';
                Packet_Counter_Reset_N      <= '1';
                Packet_Counter_Go           <= '0';

                Communication_Data_Req_F      <= '1';
                Communication_Data_Enable_F   <= '1';
                Communication_Data_Frame_F    <= PACKET_HEAD;

                Event_RAM_W_Enable_Status   <= '0';
                Diag_0_F    <= '0';
                Diag_1_F    <= '0';
                Diag_2_F    <= '0';

            when READ_SAMPLE_DATA =>
                Event_RAM_ADDR_GEN_Enable   <= '0';
                Event_Info_Buffer_Store     <= '0';

                Sample_RAM_ADDR_GEN_Reset_N <= '1';
                Sample_RAM_ADDR_GEN_Init    <= '0';
                Sample_RAM_ADDR_GEN_Enable  <= '1';

                Sample_Buffer_Store         <= '1';

                Frame_Counter_Reset_N       <= '1'; 
                Frame_Counter_Go            <= '0';
                Packet_Counter_Reset_N      <= '1';
                Packet_Counter_Go           <= '0';

                Communication_Data_Req_F      <= '1';
                Communication_Data_Enable_F   <= '0';
                Communication_Data_Frame_F    <= (others => '0');

                Event_RAM_W_Enable_Status   <= '0';
                Diag_0_F    <= '0';
                Diag_1_F    <= '0';
                Diag_2_F    <= '0';

            when SEND_DATA_FRAMES_1 =>
                Event_RAM_ADDR_GEN_Enable   <= '0';
                Event_Info_Buffer_Store     <= '0';

                Sample_RAM_ADDR_GEN_Reset_N <= '1';
                Sample_RAM_ADDR_GEN_Init    <= '0';
                Sample_RAM_ADDR_GEN_Enable  <= '0';

                Sample_Buffer_Store         <= '0';

                Frame_Counter_Reset_N       <= '1'; 
                Frame_Counter_Go            <= '1';
                Packet_Counter_Reset_N      <= '1';
                Packet_Counter_Go           <= '0';

                Communication_Data_Req_F      <= '1';
                Communication_Data_Enable_F   <= '1';
                Communication_Data_Frame_F    <= Data_Frame_1;

                Event_RAM_W_Enable_Status   <= '0';
                Diag_0_F    <= '0';
                Diag_1_F    <= '0';
                Diag_2_F    <= '0';

            when SEND_DATA_FRAMES_2 =>
                Event_RAM_ADDR_GEN_Enable   <= '0';
                Event_Info_Buffer_Store     <= '0';

                Sample_RAM_ADDR_GEN_Reset_N <= '1';
                Sample_RAM_ADDR_GEN_Init    <= '0';
                Sample_RAM_ADDR_GEN_Enable  <= '0';

                Sample_Buffer_Store         <= '0';

                Frame_Counter_Reset_N       <= '1'; 
                Frame_Counter_Go            <= '1';
                Packet_Counter_Reset_N      <= '1';
                Packet_Counter_Go           <= '0';

                Communication_Data_Req_F      <= '1';
                Communication_Data_Enable_F   <= '1';
                Communication_Data_Frame_F    <= Data_Frame_2;

                Event_RAM_W_Enable_Status   <= '0';
                Diag_0_F    <= '0';
                Diag_1_F    <= '0';
                Diag_2_F    <= '0';

            when SEND_PACKET_TAIL =>
                Event_RAM_ADDR_GEN_Enable   <= '0';
                Event_Info_Buffer_Store     <= '0';

                Sample_RAM_ADDR_GEN_Reset_N <= '1';
                Sample_RAM_ADDR_GEN_Init    <= '0';
                Sample_RAM_ADDR_GEN_Enable  <= '0';

                Sample_Buffer_Store         <= '0';

                Frame_Counter_Reset_N       <= '1'; 
                Frame_Counter_Go            <= '0';
                Packet_Counter_Reset_N      <= '1';
                Packet_Counter_Go           <= '1';

                Communication_Data_Req_F      <= '1';
                Communication_Data_Enable_F   <= '1';
                Communication_Data_Frame_F    <= PACKET_TAIL;

                Event_RAM_W_Enable_Status   <= '0';
                Diag_0_F    <= '0';
                Diag_1_F    <= '1';
                Diag_2_F    <= '0';

            when SEND_EVENT_TAIL =>
                Event_RAM_ADDR_GEN_Enable   <= '0';
                Event_Info_Buffer_Store     <= '0';

                Sample_RAM_ADDR_GEN_Reset_N <= '0';
                Sample_RAM_ADDR_GEN_Init    <= '0';
                Sample_RAM_ADDR_GEN_Enable  <= '0';

                Sample_Buffer_Store         <= '0';

                Frame_Counter_Reset_N       <= '0'; 
                Frame_Counter_Go            <= '0';
                Packet_Counter_Reset_N      <= '1';
                Packet_Counter_Go           <= '0';

                Communication_Data_Req_F      <= '1';
                Communication_Data_Enable_F   <= '1';
                Communication_Data_Frame_F    <= EVENT_TAIL;

                Event_RAM_W_Enable_Status   <= '1';
                Diag_0_F    <= '0';
                Diag_1_F    <= '0';
                Diag_2_F    <= '0';

            when NEXT_EVENT_ADDR =>
                Event_RAM_ADDR_GEN_Enable   <= '1';
                Event_Info_Buffer_Store     <= '0';

                Sample_RAM_ADDR_GEN_Reset_N <= '0';
                Sample_RAM_ADDR_GEN_Init    <= '0';
                Sample_RAM_ADDR_GEN_Enable  <= '0';
                
                Sample_Buffer_Store         <= '0';

                Frame_Counter_Reset_N       <= '0'; 
                Frame_Counter_Go            <= '0';
                Packet_Counter_Reset_N      <= '0';
                Packet_Counter_Go           <= '0';

                Communication_Data_Req_F      <= '1';
                Communication_Data_Enable_F   <= '0';
                Communication_Data_Frame_F    <= (others => '0');

                Event_RAM_W_Enable_Status   <= '0';
                Diag_0_F    <= '0';
                Diag_1_F    <= '0';
                Diag_2_F    <= '0';

            when END_WAIT =>
                Event_RAM_ADDR_GEN_Enable   <= '0';
                Event_Info_Buffer_Store     <= '0';

                Sample_RAM_ADDR_GEN_Reset_N <= '0';
                Sample_RAM_ADDR_GEN_Init    <= '0';
                Sample_RAM_ADDR_GEN_Enable  <= '0';

                Sample_Buffer_Store         <= '0';

                Frame_Counter_Reset_N       <= '0'; 
                Frame_Counter_Go            <= '0';
                Packet_Counter_Reset_N      <= '0';
                Packet_Counter_Go           <= '0';

                Communication_Data_Req_F      <= '1';
                Communication_Data_Enable_F   <= '0';
                Communication_Data_Frame_F    <= (others => '0');

                Event_RAM_W_Enable_Status   <= '0';
                Diag_0_F    <= '0';
                Diag_1_F    <= '0';
                Diag_2_F    <= '0';

            when WAIT_FOR_FIFO =>
                Event_Info_Buffer_Store     <= '0';
                Event_RAM_ADDR_GEN_Enable   <= '0';

                Sample_RAM_ADDR_GEN_Reset_N <= '1';
                Sample_RAM_ADDR_GEN_Init    <= '0';
                Sample_RAM_ADDR_GEN_Enable  <= '0';

                Sample_Buffer_Store         <= '0';

                Frame_Counter_Reset_N       <= '1'; 
                Frame_Counter_Go            <= '0';
                Packet_Counter_Reset_N      <= '1';
                Packet_Counter_Go           <= '0';

                Communication_Data_Req_F      <= '1';
                Communication_Data_Enable_F   <= '0';
                Communication_Data_Frame_F    <= (others => '0');

                Event_RAM_W_Enable_Status   <= '0';
                Diag_0_F    <= '0';
                Diag_1_F    <= '0';
                Diag_2_F    <= '1';

            when others =>
                Event_RAM_ADDR_GEN_Enable   <= '0';
                Event_Info_Buffer_Store     <= '0';

                Sample_RAM_ADDR_GEN_Reset_N <= '0';
                Sample_RAM_ADDR_GEN_Init    <= '0';
                Sample_RAM_ADDR_GEN_Enable  <= '0';

                Sample_Buffer_Store         <= '0';

                Frame_Counter_Reset_N       <= '0'; 
                Frame_Counter_Go            <= '0';
                Packet_Counter_Reset_N      <= '0';
                Packet_Counter_Go           <= '0';

                Communication_Data_Req_F      <= '0';
                Communication_Data_Enable_F   <= '0';
                Communication_Data_Frame_F    <= (others => '0');

                Event_RAM_W_Enable_Status   <= '0';
                Diag_0_F    <= '0';
                Diag_1_F    <= '0';
                Diag_2_F    <= '0';
                

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
--process sample buffer
------------------------------------------------------------------------------------------------------------
process(Clock,Reset_N)

begin

    if(Reset_N = '0') then

        Read_sID_Sample_0 <= (others => '0');
        Read_sID_Sample_1 <= (others => '0');
        Read_sID_Sample_2 <= (others => '0');
        Read_sID_Sample_3 <= (others => '0');
    
        Read_Sample_0 <= (others => '0');
        Read_Sample_1 <= (others => '0');
        Read_Sample_2 <= (others => '0');
        Read_Sample_3 <= (others => '0');


    elsif(Clock'event and Clock = '1') then

        if(Sample_Buffer_Store = '1') then

            Read_sID_Sample_0 <= Sample_RAM_R_Data(15 downto 12);
            Read_sID_Sample_1 <= Sample_RAM_R_Data(31 downto 28);
            Read_sID_Sample_2 <= Sample_RAM_R_Data(47 downto 44);
            Read_sID_Sample_3 <= Sample_RAM_R_Data(63 downto 60);
        
            Read_Sample_0 <= Sample_RAM_R_Data(11 downto 0);
            Read_Sample_1 <= Sample_RAM_R_Data(27 downto 16);
            Read_Sample_2 <= Sample_RAM_R_Data(43 downto 32);
            Read_Sample_3 <= Sample_RAM_R_Data(59 downto 48);

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
            Event_Size_Buffer_Unsigned <= (others => '0');
            Sample_RAM_ADDR_GEN_Modulo <= '0';
		
		elsif(Clock'event and Clock = '1') then
            
            if(Sample_RAM_ADDR_GEN_Init = '1') then
                Sample_RAM_ADDR_GEN_Modulo <= '0';
                Sample_RAM_R_Address_Unsigned <= unsigned(Event_Start_ADDR_Buffer);
                Event_Size_Buffer_Unsigned <= unsigned(Event_Size_Buffer);
                Sample_RAM_R_Order_Unsigned <= (others => '0');

            elsif(Sample_RAM_ADDR_GEN_Enable = '1') then
                
                if(Sample_RAM_R_Order_Unsigned >= Event_Size_Buffer_Unsigned - 1) then
                    Sample_RAM_ADDR_GEN_Modulo <= '1';
                else
                    Sample_RAM_ADDR_GEN_Modulo <= '0';
                end if;

                Sample_RAM_R_Address_Unsigned <= Sample_RAM_R_Address_Unsigned + 1;
                Sample_RAM_R_Order_Unsigned <= Sample_RAM_R_Order_Unsigned + 1;

            else

                if(Sample_RAM_R_Order_Unsigned >= Event_Size_Buffer_Unsigned - 1) then
                    Sample_RAM_ADDR_GEN_Modulo <= '1';
                else
                    Sample_RAM_ADDR_GEN_Modulo <= '0';
                end if;

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
    process(Reset_N,Clock)

    begin

        if(Reset_N = '0') then
            Frame_Counter <= (others => '0');
            Frame_Counter_Modulo <= '0';

        elsif(Clock'event and Clock = '1') then

            if(Frame_Counter_Reset_N = '0') then
                Frame_Counter <= (others => '0');
                Frame_Counter_Modulo <= '0';
            
            else

                --if(Frame_Counter >= (20 - 2)) then
                    --Frame_Counter_Modulo <= '1';
                --else
                    --Frame_Counter_Modulo <= '0';
                --end if;


                if(Frame_Counter_Go = '1') then
                    
                    if(Frame_Counter >= (20 - 2)) then
                        Frame_Counter_Modulo <= '1';
                    end if;
                    
                    Frame_Counter <= Frame_Counter + 1; 
                end if;

            end if;

        end if;

    end process;

------------------------------------------------------------------------------------------------------------
--packet frames counter
------------------------------------------------------------------------------------------------------------
process(Packet_Counter_Reset_N,Clock)

begin

    if(Packet_Counter_Reset_N = '0') then
        Packet_Counter <= (others => '0');

    elsif(Clock'event and Clock = '1') then

        if(Packet_Counter_Go = '1') then
        
            Packet_Counter <= Packet_Counter + 1;
        
                
        end if;

    end if;

end process;


------------------------------------------------------------------------------------------------------------
--fifo output register
------------------------------------------------------------------------------------------------------------
process(Reset_N,Clock)

begin

    if(Reset_N = '0') then
        Communication_Data_Frame <= (others => '0');
        Communication_Data_Enable <= '0';
        Communication_Data_Req <= '0';


    elsif(Clock'event and Clock = '1') then
        Communication_Data_Frame <= Communication_Data_Frame_F;
        Communication_Data_Enable <= Communication_Data_Enable_F;
        Communication_Data_Req <= Communication_Data_Req_F;


    end if;

end process;

   



end rtl;