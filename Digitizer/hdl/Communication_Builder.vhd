library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Communication_Builder is
    port
    (
        Clock : in std_logic;                                           --system clock
        Reset_N : in std_logic;                                         --system reset

        Event_RAM_R_Address : out std_logic_vector(9 downto 0);
        Event_RAM_R_Data_Start_ADDR : out std_logic_vector(19 downto 0);
        Event_RAM_R_Data_Number : out std_logic_vector(19 downto 0);
        Event_RAM_R_Data_Size : out std_logic_vector(19 downto 0);
        Event_RAM_R_Data_Status : out std_logic_vector(7 downto 0);
        Event_RAM_W_Enable_Status : out std_logic;
        Event_RAM_W_Data_Status : in std_logic_vector(7 downto 0);

        Sample_RAM_R_Address : out std_logic_vector(15 downto 0);
        Sample_RAM_R_Block_Address : out std_logic_vector(3 downto 0);
        Sample_RAM_R_Data : out std_logic_vector(63 downto 0);

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
                            READ_EVENT_INFO,    --Read event info RAMs     

                            COMMUNICATION_REQ,  --Request for selecrted communication 
                            SEND_EVENT_HEAD,    --Send event head to communication
                            SEND_PACKET_HEAD,   --Send packet head to communication
                            SEND_DATA_FRAMES,   --Sending data frames composits from 3 samples
                            SEND_PACKET_TAIL,   --Send packet tail to communication
                            SEND_EVENT_TAIL     --Send event tail to communication
                    
                        );
    signal state_reg, next_state : FSM_state;


    signal Event_RAM_ADDR_GEN_Enable : std_logic;
    signal Event_RAM_R_Address_Integer : integer range 0 to 1024-1 := 0;

    signal Status_Event_WriteDone : std_logic; 

    signal Event_Info_Buffer_Store : std_logic;
    signal Event_Start_ADDR_Buffer : std_logic_vector(19 downto 0);
    signal Event_Number_Buffer : std_logic_vector(19 downto 0);
    signal Event_Size_Buffer : std_logic_vector(19 downto 0);

begin

------------------------------------------------------------------------------------------------------------
--Signals Routing
------------------------------------------------------------------------------------------------------------   
    Event_RAM_R_Address <= std_logic_vector(to_unsigned(Event_RAM_R_Address_Integer, 10));


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
    process(next_state, state_reg, )
    begin

        next_state <= state_reg;

        case state_reg is
        
            when IDLE =>
                if(Status_Event_WriteDone = '1') then
                    next_state <= READ_EVENT_INFO;
                end if;

            when READ_EVENT_INFO =>
                
            
            when others =>
                null; 

        end case;
    end process;

    --output function
    process(state_reg)
    begin

        case state_reg is
        
            when IDLE =>
                Event_RAM_ADDR_GEN_Enable <= '0';
                Event_Info_Buffer_Store <= '0';

            when others =>

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
--process Event RAM Write Address Generator
------------------------------------------------------------------------------------------------------------
    process(Clock,Reset_N)

    begin

        if(Reset_N = '0') then
            Event_RAM_R_Address_Integer <= 0;
		
		elsif(Clock'event and Clock = '1') then
            
            if(Event_RAM_ADDR_GEN_Enable = '1') then
                
                if(Event_RAM_W_Address_Integer >= 1023) then
                    Event_RAM_R_Address_Integer <= 0;
                else
                    Event_RAM_R_Address_Integer <= Event_RAM_R_Address_Integer + 1;
                end if;

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

   




end rtl;