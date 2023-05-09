library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity UART_TX_Protocol is
    port
    (
        Clock : in std_logic;                                           --system clock
        Reset_N : in std_logic;                                         --system reset

        UART_TX_Data : out std_logic_vector(7 downto 0);
        UART_TX_Enable : out std_logic;
        UART_TX_Ready : in std_logic;

        --fifo interface
        Fifo_Read_Data : in std_logic_vector(39 downto 0);              --Command data from FIFO
        Fifo_Read_Enable : out std_logic;                               --Read from fifo
        Fifo_Empty : in std_logic;                                      --Fifo is empty

        Diag_Valid : out std_logic  
    );
end UART_TX_Protocol;


architecture rtl of UART_TX_Protocol is

    type FSM_state is (IDLE, READ_FROM_FIFO, WAIT_STX, SEND_STX, GENERATE_BYTE, WAIT_GENERATE, WAIT_FIRST, SEND_FIRST, WAIT_SECOND, SEND_SECOND, NEXT_OR_END, WAIT_ETX, SEND_ETX, FAULT);
    signal state_reg, next_state : FSM_state;

    signal Fifo_Read_Data_Buffer : std_logic_vector(31 downto 0);

    signal Part_TX_Data : std_logic_vector(7 downto 0);
    signal First_Nibble : std_logic_vector(7 downto 0);
    signal Second_Nibble : std_logic_vector(7 downto 0);

    signal Counter_Reset_N : std_logic;
    signal Read_Data_Buffer_Enable : std_logic;
    signal Last_Byte : std_logic;
    signal Generate_Byte_Enable : std_logic;

begin

    --Part_TX_Data <= Fifo_Read_Data(7 downto 0);

    First_Nibble <= Part_TX_Data(7 downto 4) & not Part_TX_Data(7 downto 4);
    Second_Nibble <= Part_TX_Data(3 downto 0) & not Part_TX_Data(3 downto 0);


------------------------------------------------------------------------------------------------------------
--FSM decoder ride
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
    process(next_state, state_reg, Fifo_Empty,UART_TX_Ready,Last_Byte)
    begin

        next_state <= state_reg;

        case state_reg is
        
            when IDLE =>
                if(Fifo_Empty = '0') then
                    next_state <= READ_FROM_FIFO;
                end if;

            when READ_FROM_FIFO =>
                next_state <= WAIT_STX;

            when WAIT_STX =>
                if(UART_TX_Ready = '1') then
                    next_state <= SEND_STX;
                end if;

            when SEND_STX =>
                next_state <= GENERATE_BYTE;

            when GENERATE_BYTE =>
                next_state <= WAIT_GENERATE;

            when WAIT_GENERATE =>
                next_state <= WAIT_FIRST;

            when WAIT_FIRST =>
                if(UART_TX_Ready = '1') then
                    next_state <= SEND_FIRST;
                end if;

            when SEND_FIRST =>
                next_state <= WAIT_SECOND;
            
            when WAIT_SECOND =>
                if(UART_TX_Ready = '1') then
                    next_state <= SEND_SECOND;
                end if;

            when SEND_SECOND =>
                next_state <= NEXT_OR_END;

            when NEXT_OR_END =>
                if(Last_Byte = '1') then
                    next_state <= WAIT_ETX;
                else
                    next_state <= GENERATE_BYTE;
                end if;

            when WAIT_ETX =>
                if(UART_TX_Ready = '1') then
                    next_state <= SEND_ETX;
                end if;

            when SEND_ETX =>
                next_state <= IDLE;

            when FAULT =>
                next_state <= IDLE;

            when others =>
                null; 

        end case;
    end process;

    --output function
    process(state_reg,First_Nibble,Second_Nibble)
    begin

        case state_reg is
        
            when IDLE =>
                UART_TX_Data        <= (others => '0');
                UART_TX_Enable      <= '0';
                Fifo_Read_Enable    <= '0';
                Counter_Reset_N     <= '0';
                Read_Data_Buffer_Enable <= '0';
                Generate_Byte_Enable <= '0';
                Diag_Valid          <= '0';

            when READ_FROM_FIFO =>
                UART_TX_Data        <= (others => '0');
                UART_TX_Enable      <= '0';
                Fifo_Read_Enable    <= '1';
                Counter_Reset_N     <= '1';
                Read_Data_Buffer_Enable <= '0';
                Generate_Byte_Enable <= '0';
                Diag_Valid          <= '1';

            when WAIT_STX =>
                UART_TX_Data        <= X"02";
                UART_TX_Enable      <= '0';
                Fifo_Read_Enable    <= '0';
                Counter_Reset_N     <= '1';
                Read_Data_Buffer_Enable <= '1';
                Generate_Byte_Enable <= '0';
                Diag_Valid          <= '1';

            when SEND_STX =>
                UART_TX_Data        <= X"02";
                UART_TX_Enable      <= '1';
                Fifo_Read_Enable    <= '0';
                Counter_Reset_N     <= '1';
                Read_Data_Buffer_Enable <= '0';
                Generate_Byte_Enable <= '0';
                Diag_Valid          <= '1';

            when GENERATE_BYTE =>
                UART_TX_Data        <= (others => '0');
                UART_TX_Enable      <= '0';
                Fifo_Read_Enable    <= '0';
                Counter_Reset_N     <= '1';
                Read_Data_Buffer_Enable <= '0';
                Generate_Byte_Enable <= '1';
                Diag_Valid          <= '1';

            when WAIT_GENERATE =>
                UART_TX_Data        <= (others => '0');
                UART_TX_Enable      <= '0';
                Fifo_Read_Enable    <= '0';
                Counter_Reset_N     <= '1';
                Read_Data_Buffer_Enable <= '0';
                Generate_Byte_Enable <= '0';
                Diag_Valid          <= '1';

            when WAIT_FIRST =>
                UART_TX_Data        <= First_Nibble;
                UART_TX_Enable      <= '0';
                Fifo_Read_Enable    <= '0';
                Counter_Reset_N     <= '1';
                Read_Data_Buffer_Enable <= '0';
                Generate_Byte_Enable <= '0';
                Diag_Valid          <= '1';

            when SEND_FIRST =>
                UART_TX_Data        <= First_Nibble;
                UART_TX_Enable      <= '1';
                Fifo_Read_Enable    <= '0';
                Counter_Reset_N     <= '1';
                Read_Data_Buffer_Enable <= '0';
                Generate_Byte_Enable <= '0';
                Diag_Valid          <= '1';
            
            when WAIT_SECOND =>
                UART_TX_Data        <= Second_Nibble;
                UART_TX_Enable      <= '0';
                Fifo_Read_Enable    <= '0';
                Counter_Reset_N     <= '1';
                Read_Data_Buffer_Enable <= '0';
                Generate_Byte_Enable <= '0';
                Diag_Valid          <= '1';

            when SEND_SECOND =>
                UART_TX_Data        <= Second_Nibble;
                UART_TX_Enable      <= '1';
                Fifo_Read_Enable    <= '0';
                Counter_Reset_N     <= '1';
                Read_Data_Buffer_Enable <= '0';
                Generate_Byte_Enable <= '0';
                Diag_Valid          <= '1';

            when NEXT_OR_END =>
                UART_TX_Data        <= (others => '0');
                UART_TX_Enable      <= '0';
                Fifo_Read_Enable    <= '0';
                Counter_Reset_N     <= '1';
                Read_Data_Buffer_Enable <= '0';
                Generate_Byte_Enable <= '0';
                Diag_Valid          <= '1';

            when WAIT_ETX =>
                UART_TX_Data        <= X"03";
                UART_TX_Enable      <= '0';
                Fifo_Read_Enable    <= '0';
                Counter_Reset_N     <= '1';
                Read_Data_Buffer_Enable <= '0';
                Generate_Byte_Enable <= '0';
                Diag_Valid          <= '1';

            when SEND_ETX =>
                UART_TX_Data        <= X"03";
                UART_TX_Enable      <= '1';
                Fifo_Read_Enable    <= '0';
                Counter_Reset_N     <= '1';
                Read_Data_Buffer_Enable <= '0';
                Generate_Byte_Enable <= '0';
                Diag_Valid          <= '1';

            when FAULT =>
                UART_TX_Data        <= (others => '0');
                UART_TX_Enable      <= '0';
                Fifo_Read_Enable    <= '0';
                Counter_Reset_N     <= '0';
                Read_Data_Buffer_Enable <= '0';
                Generate_Byte_Enable <= '0';
                Diag_Valid          <= '0';

            when others =>
                UART_TX_Data        <= (others => '0');
                UART_TX_Enable      <= '0';
                Fifo_Read_Enable    <= '0';
                Counter_Reset_N     <= '0';
                Read_Data_Buffer_Enable <= '0';
                Generate_Byte_Enable <= '0';
                Diag_Valid          <= '0';


        end case;

    end process;

   
------------------------------------------------------------------------------------------------------------
--generate nibbles
------------------------------------------------------------------------------------------------------------
    process(Counter_Reset_N,Clock)

        variable Counter : unsigned (4 downto 0);

    begin

        if(Counter_Reset_N = '0') then
            Counter := (others => '0');
            Last_Byte <= '0';
            Fifo_Read_Data_Buffer <= (others => '0');
            Part_TX_Data <= (others => '0');

        elsif(Clock'event and clock = '1') then

            if(Read_Data_Buffer_Enable = '1') then
                Fifo_Read_Data_Buffer <= Fifo_Read_Data(31 downto 0);
            end if;
            
            if(Generate_Byte_Enable = '1') then

                if(Counter >= 3) then
                    Last_Byte <= '1';
                end if;

                Part_TX_Data <= Fifo_Read_Data_Buffer(31 downto 24);
                Fifo_Read_Data_Buffer <= Fifo_Read_Data_Buffer(23 downto 0) & X"00";

                Counter := Counter + 1;
            
            end if;

        end if;

    end process;        



end rtl;