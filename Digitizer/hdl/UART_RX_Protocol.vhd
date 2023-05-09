library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity UART_RX_Protocol is
    port
    (
        Clock : in std_logic;                                           --system clock
        Reset_N : in std_logic;                                         --system reset

        Number_Communication : std_logic_vector(3 downto 0);
        
        UART_RX_Data : in std_logic_vector(7 downto 0);
        UART_RX_Ready : in std_logic;
        UART_RX_OE_N : buffer std_logic;

        --fifo interface
        Fifo_Write_Data : out std_logic_vector(39 downto 0);              
        Fifo_Write_Enable : out std_logic;                              
        Fifo_Full : in std_logic;

        Diag_Valid : out std_logic

    );
end UART_RX_Protocol;


architecture rtl of UART_RX_Protocol is

    constant To_Fault_Count_Cycle     : integer := 7E6;

------------------------------------------------------------------------------------------------------------
--signal declarate
------------------------------------------------------------------------------------------------------------
    type FSM_state is ( IDLE, STX_CLEAR, WAIT_FOR_FIRST, FIRST_NIBBLE, CLEAR_FIRST, 
                        WAIT_FOR_SECOND, SECOND_NIBBLE, CLEAR_SECOND, 
                        VALIDATE_NIBBLES, STORE_BYTE, ETX_CLEAR ,WAIT_FOR_FIFO, WRITE_TO_FIFO, FAULT);
    signal state_reg, next_state : FSM_state;

    type Detect_FSM_state is(IDLE, DETECT, WAIT_FOR_CLEAR_READ, WAIT_1);
    signal Detect_state_reg : Detect_FSM_state;

    signal RX_Data_buffer : std_logic_vector(7 downto 0);
    signal Decode_data : std_logic_vector(31 downto 0);

    signal STX_Detect : std_logic;
    signal ETX_Detect : std_logic;
    signal Other_Detect : std_logic;

    signal store_byte_enable : std_logic;
    signal First_Nibble_enable : std_logic;
    signal Second_Nibble_enable : std_logic;
    signal Nibbles_Fault : std_logic;
    signal Clear_Reading : std_logic;

    signal First_Nibble_Value : std_logic_vector(3 downto 0);
    signal Second_Nibble_Value : std_logic_vector(3 downto 0);
    signal First_Nibble_Complementary : std_logic_vector(3 downto 0);
    signal Second_Nibble_Complementary : std_logic_vector(3 downto 0);

    signal Fault_Bit : std_logic;

    signal FaultCounter_Reset_N : std_logic;
    signal FaultCounter_Elapsed : std_logic;

begin

------------------------------------------------------------------------------------------------------------
--Sigal routing
------------------------------------------------------------------------------------------------------------

    --Fifo_Write_Data <= Fault_Bit & "000" & "0001" & Decode_data;
    Fifo_Write_Data <= Fault_Bit & "000" & Number_Communication & Decode_data;
    UART_RX_OE_N <= not Clear_Reading;

    RX_Data_buffer <= UART_RX_Data;
    
------------------------------------------------------------------------------------------------------------
--FSM receiver rided
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
    process(next_state, state_reg, Fifo_Full, STX_DETECT, ETX_DETECT, Other_Detect, Nibbles_Fault, FaultCounter_Elapsed)
    begin

        next_state <= state_reg;

        case state_reg is
        
            when IDLE =>
                if(STX_DETECT = '1' or ETX_DETECT= '1' or Other_Detect = '1') then
                    next_state <= STX_CLEAR;
                end if;

            when STX_CLEAR =>
                next_state <= WAIT_FOR_FIRST;

            when WAIT_FOR_FIRST =>
                if(STX_DETECT = '1') then
                    next_state <= IDLE;
                elsif(ETX_DETECT = '1') then
                    next_state <= ETX_CLEAR;
                elsif(Other_Detect = '1') then
                    next_state <= FIRST_NIBBLE;
                end if;

            when FIRST_NIBBLE =>
                next_state <= CLEAR_FIRST;

            when CLEAR_FIRST =>
                next_state <= WAIT_FOR_SECOND;

            when WAIT_FOR_SECOND =>
                if(STX_DETECT = '1') then
                    next_state <= IDLE;
                elsif(ETX_DETECT = '1') then
                    next_state <= FAULT;
                elsif(Other_Detect = '1') then
                    next_state <= SECOND_NIBBLE;
                end if;

            when SECOND_NIBBLE =>
                next_state <= CLEAR_SECOND;

            when CLEAR_SECOND =>
                next_state <= VALIDATE_NIBBLES;

            when VALIDATE_NIBBLES =>
                if(Nibbles_Fault = '1') then
                    next_state <= FAULT;
                else
                    next_state <= STORE_BYTE;
                end if;

            when STORE_BYTE =>
                next_state <= WAIT_FOR_FIRST;

            when ETX_CLEAR =>
                next_state <= WAIT_FOR_FIFO;

            when WAIT_FOR_FIFO =>
                if(Fifo_Full = '0') then    
                    next_state <= WRITE_TO_FIFO;
                end if;

            when WRITE_TO_FIFO =>
                next_state <= IDLE;

            when FAULT =>
                next_state <= IDLE;

            when others =>
                null; 

        end case;

        -- from any state to FAULT_PROCESSED_EXECUTE
        if(FaultCounter_Elapsed = '1') then
            next_state <= FAULT;
        end if;

    end process;

    --output function
    process(state_reg)
    begin

        case state_reg is
        
            when IDLE =>
                First_Nibble_enable     <= '0';
                Second_Nibble_enable    <= '0';
                store_byte_enable       <= '0';
                Fifo_Write_Enable       <= '0';
                Fault_Bit               <= '0';
                Clear_Reading           <= '0';
                Diag_Valid              <= '0';
                FaultCounter_Reset_N    <= '0';

            when STX_CLEAR =>
                First_Nibble_enable     <= '0';
                Second_Nibble_enable    <= '0';
                store_byte_enable       <= '0';
                Fifo_Write_Enable       <= '0';
                Fault_Bit               <= '0';
                Clear_Reading           <= '1';
                Diag_Valid              <= '1';
                FaultCounter_Reset_N    <= '1';

            when WAIT_FOR_FIRST =>
                First_Nibble_enable     <= '0';
                Second_Nibble_enable    <= '0';
                store_byte_enable       <= '0';
                Fifo_Write_Enable       <= '0';
                Fault_Bit               <= '0';
                Clear_Reading           <= '0';
                Diag_Valid              <= '1';
                FaultCounter_Reset_N    <= '1';         

            when FIRST_NIBBLE =>
                First_Nibble_enable     <= '1';
                Second_Nibble_enable    <= '0';
                store_byte_enable       <= '0';
                Fifo_Write_Enable       <= '0';
                Fault_Bit               <= '0';
                Clear_Reading           <= '0';
                Diag_Valid              <= '1';
                FaultCounter_Reset_N    <= '1';           

            when CLEAR_FIRST =>
                First_Nibble_enable     <= '0';
                Second_Nibble_enable    <= '0';
                store_byte_enable       <= '0';
                Fifo_Write_Enable       <= '0';
                Fault_Bit               <= '0';
                Clear_Reading           <= '1';
                Diag_Valid              <= '1';
                FaultCounter_Reset_N    <= '1';   

            when WAIT_FOR_SECOND =>
                First_Nibble_enable     <= '0';
                Second_Nibble_enable    <= '0';
                store_byte_enable       <= '0';
                Fifo_Write_Enable       <= '0';
                Fault_Bit               <= '0';
                Clear_Reading           <= '0';
                Diag_Valid              <= '1';
                FaultCounter_Reset_N    <= '1';         

            when SECOND_NIBBLE =>
                First_Nibble_enable     <= '0';
                Second_Nibble_enable    <= '1';
                store_byte_enable       <= '0';
                Fifo_Write_Enable       <= '0';
                Fault_Bit               <= '0';
                Clear_Reading           <= '0';
                Diag_Valid              <= '1';
                FaultCounter_Reset_N    <= '1';

            when CLEAR_SECOND =>
                First_Nibble_enable     <= '0';
                Second_Nibble_enable    <= '0';
                store_byte_enable       <= '0';
                Fifo_Write_Enable       <= '0';
                Fault_Bit               <= '0';
                Clear_Reading           <= '1';
                Diag_Valid              <= '1';
                FaultCounter_Reset_N    <= '1';           

            when VALIDATE_NIBBLES =>
                First_Nibble_enable     <= '0';
                Second_Nibble_enable    <= '0';
                store_byte_enable       <= '0';
                Fifo_Write_Enable       <= '0';
                Fault_Bit               <= '0';
                Clear_Reading           <= '0';
                Diag_Valid              <= '1';
                FaultCounter_Reset_N    <= '1';

            when STORE_BYTE =>
                First_Nibble_enable     <= '0';
                Second_Nibble_enable    <= '0';
                store_byte_enable       <= '1';
                Fifo_Write_Enable       <= '0';
                Fault_Bit               <= '0';
                Clear_Reading           <= '0';
                Diag_Valid              <= '1';
                FaultCounter_Reset_N    <= '1';

            when ETX_CLEAR =>  
                First_Nibble_enable     <= '0';
                Second_Nibble_enable    <= '0';
                store_byte_enable       <= '0';
                Fifo_Write_Enable       <= '0';
                Fault_Bit               <= '0';
                Clear_Reading           <= '1';
                Diag_Valid              <= '1';
                FaultCounter_Reset_N    <= '1';  

            when WAIT_FOR_FIFO =>  
                First_Nibble_enable     <= '0';
                Second_Nibble_enable    <= '0';
                store_byte_enable       <= '0';
                Fifo_Write_Enable       <= '0';
                Fault_Bit               <= '0';
                Clear_Reading           <= '0';
                Diag_Valid              <= '1';
                FaultCounter_Reset_N    <= '1';    

            when WRITE_TO_FIFO =>
                First_Nibble_enable     <= '0';
                Second_Nibble_enable    <= '0';
                store_byte_enable       <= '0';
                Fifo_Write_Enable       <= '1';
                Fault_Bit               <= '0';
                Clear_Reading           <= '0';
                Diag_Valid              <= '1';
                FaultCounter_Reset_N    <= '1';

            when FAULT =>
                First_Nibble_enable     <= '0';
                Second_Nibble_enable    <= '0';
                store_byte_enable       <= '0';
                Fifo_Write_Enable       <= '1';
                Fault_Bit               <= '1';
                Clear_Reading           <= '1';
                Diag_Valid              <= '0';
                FaultCounter_Reset_N    <= '0';                         

            when others =>
                First_Nibble_enable     <= '0';
                Second_Nibble_enable    <= '0';
                store_byte_enable       <= '0';
                Fifo_Write_Enable       <= '0';
                Clear_Reading           <= '0';
                Diag_Valid              <= '0';
                FaultCounter_Reset_N    <= '0';         

        end case;

    end process;


------------------------------------------------------------------------------------------------------------
--store rx data
------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------
--store byte from nibbles
------------------------------------------------------------------------------------------------------------
    process(Reset_N,Clock)

    begin

        if(Reset_N = '0') then
            Decode_data <= (others => '0');

        elsif(Clock'event and clock = '1') then

            if(store_byte_enable = '1') then
                Decode_data <= Decode_data(23 downto 0) & First_Nibble_Value & Second_Nibble_Value;
            end if;

        end if;

    end process;        

------------------------------------------------------------------------------------------------------------
--nibbles decoder
------------------------------------------------------------------------------------------------------------
    process(Reset_N,Clock)

    begin

        if(Reset_N = '0') then

            First_Nibble_Value <= (others => '0');
            Second_Nibble_Value <= (others => '0');
            First_Nibble_Complementary <= (others => '0');
            Second_Nibble_Complementary <= (others => '0');

        elsif(Clock'event and clock = '1') then

            if(First_Nibble_enable = '1') then
                First_Nibble_Value <= RX_Data_buffer(7 downto 4);
                First_Nibble_Complementary <= RX_Data_buffer(3 downto 0);

            elsif(Second_Nibble_enable = '1') then
                Second_Nibble_Value <= RX_Data_buffer(7 downto 4);
                Second_Nibble_Complementary <= RX_Data_buffer(3 downto 0);

            end if;

        end if;

    end process;


------------------------------------------------------------------------------------------------------------
--nibbles validator
------------------------------------------------------------------------------------------------------------
    process(First_Nibble_Complementary,First_Nibble_Value,Second_Nibble_Complementary,Second_Nibble_Value)

    begin

            if( unsigned(not First_Nibble_Complementary) = unsigned(First_Nibble_Value) 
                and 
                unsigned(not Second_Nibble_Complementary) = unsigned(Second_Nibble_Value)
                ) 
                then
                
                Nibbles_Fault <= '0';
            else
                Nibbles_Fault <= '1';
            end if;

    end process;


------------------------------------------------------------------------------------------------------------
--New data detect -> STX ETX detect
------------------------------------------------------------------------------------------------------------
    process(Reset_N, Clock,RX_Data_buffer,UART_RX_Ready)

    begin


        if(Reset_N = '0') then
            Detect_state_reg <= IDLE;
            
            STX_DETECT <= '0';
            ETX_DETECT <= '0';
            Other_Detect <= '0';
            


        elsif(Clock'event and clock = '1') then

            case Detect_state_reg is

                when IDLE =>
                    if(UART_RX_Ready = '1') then
                        Detect_state_reg <= DETECT;
                    end if;

                    STX_DETECT <= '0';
                    ETX_DETECT <= '0';
                    Other_Detect <= '0';  

                when DETECT =>
                    Detect_state_reg <= WAIT_FOR_CLEAR_READ;

                    if(unsigned(RX_Data_buffer) = X"02") then
                        STX_DETECT <= '1';
                        ETX_DETECT <= '0';
                        Other_Detect <= '0';

                    elsif(unsigned(RX_Data_buffer) = X"03") then
                        STX_DETECT <= '0';
                        ETX_DETECT <= '1';
                        Other_Detect <= '0';

                    else
                        STX_DETECT <= '0';
                        ETX_DETECT <= '0';
                        Other_Detect <= '1';   

                    end if;

                when WAIT_FOR_CLEAR_READ =>
                    if(Clear_Reading = '1') then
                        Detect_state_reg <= WAIT_1;
                    end if;    
                    
                    STX_DETECT <= '0';
                    ETX_DETECT <= '0';
                    Other_Detect <= '0';  


                when WAIT_1 =>
                    Detect_state_reg <= IDLE;

                    STX_DETECT <= '0';
                    ETX_DETECT <= '0';
                    Other_Detect <= '0'; 

                when others =>

                    STX_DETECT <= '0';
                    ETX_DETECT <= '0';
                    Other_Detect <= '0';  

            end case;

        end if;

    end process;


------------------------------------------------------------------------------------------------------------
--error counter
------------------------------------------------------------------------------------------------------------
    process(FaultCounter_Reset_N,Clock)

        variable Counter : unsigned (31 downto 0) := (others => '0');

    begin

        if(FaultCounter_Reset_N = '0') then
			Counter := (others => '0');
            FaultCounter_Elapsed <= '0';
		
		elsif(Clock'event and Clock = '1') then

            if(Counter > To_Fault_Count_Cycle) then
                FaultCounter_Elapsed <= '1';

            else
                FaultCounter_Elapsed <= '0';

            end if;
            
            Counter := Counter + 1;

		end if;		

    end process;    



end architecture;