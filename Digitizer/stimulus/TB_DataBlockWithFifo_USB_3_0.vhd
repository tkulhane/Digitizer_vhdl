--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: TB_DataBlockWithFifo.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::PolarFire> <Die::MPF300TS_ES> <Package::FCG1152>
-- Author: <Name>
--
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity TB_DataBlockWithFifo_USB_3_0 is
end TB_DataBlockWithFifo_USB_3_0;

architecture behavioral of TB_DataBlockWithFifo_USB_3_0 is

    constant SYSCLK_PERIOD : time := 5 ns; -- 200MHZ
    constant FTDICLK_PERIOD : time := 10 ns; -- 100MHZ
    constant READCLK_PERIOD : time := 20 ns; -- 100MHZ
    

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';


------------------------------------------------------------------------------------------------------------
--Signals Declaration
------------------------------------------------------------------------------------------------------------
    signal CTRL_enable_cmd : std_logic;
    signal CTRL_write_read : std_logic;
    signal CTRL_busy    : std_logic;
    signal CTRL_addr_frame : std_logic_vector(7 downto 0);
    signal CTRL_write_data_frame : std_logic_vector(15 downto 0);
    signal CTRL_read_data_frame : std_logic_vector(15 downto 0);

    signal Communication_Read : std_logic;
    signal Communication_Builder_RUN : std_logic;
    signal Communication_Empty : std_logic;
    signal Communication_Data_Frame : std_logic_vector(31 downto 0);
    signal Communication_Data_Req : std_logic;

    signal FTDI_CLK : std_logic := '0';
    signal FTDI_nRXF : std_logic;
    signal FTDI_nTXE : std_logic;

    signal TX_FIFO_WE : std_logic;
    signal TX_FIFO_Data : std_logic_vector(39 downto 0);

    signal FTDI_nWR : std_logic;
    signal FTDI_nOE : std_logic;
    signal FTDI_nRD : std_logic;
    signal FTDI_RESET_N : std_logic;

    signal TX_FULL : std_logic;

    signal FTDI_DATA : std_logic_vector(31 downto 0);
    signal FTDI_BE : std_logic_vector(3 downto 0);

    signal Data_Valid: std_logic;
    signal data_for_store : std_logic_vector(31 downto 0);

    signal TestFifoEmpty : std_logic;
    signal TestFifoData : std_logic_vector(31 downto 0);
    signal TestFifoRead : std_logic;

    
    file output_buf : text;  -- text is keyword
    file output_buf_raw : text;

    signal READ_CLK : std_logic := '0';

    type FSM_state is (IDLE, WAIT_FOR_DATA , READ_DATA);
    signal state_reg, next_state : FSM_state;


------------------------------------------------------------------------------------------------------------
--Component
------------------------------------------------------------------------------------------------------------    
    component Data_Block
        -- ports
        port( 
            -- Inputs
            C_enable_cmd : in std_logic;
            C_write_read : in std_logic;
            Clock : in std_logic;
            Communication_Read : in std_logic;
            Communication_Builder_RUN : in std_logic;
            Fifo_RESET_N : in std_logic;
            Reset_N : in std_logic;
            C_addr_frame : in std_logic_vector(7 downto 0);
            C_write_data_frame : in std_logic_vector(15 downto 0);

            -- Outputs
            C_busy : out std_logic;
            Communication_Empty : out std_logic;
            Diag_0 : out std_logic;
            Diag_1 : out std_logic;
            Diag_2 : out std_logic;
            Diag_3 : out std_logic;
            C_read_data_frame : out std_logic_vector(15 downto 0);
            Communication_Data_Frame : out std_logic_vector(31 downto 0);
            Communication_Data_Req : out std_logic

            -- Inouts

        );
    end component;


    component USB_3_Protocol
        -- ports
        port( 
            -- Inputs
            FTDI_CLK : in std_logic;
            FTDI_nRXF : in std_logic;
            FTDI_nTXE : in std_logic;
            Main_CLK : in std_logic;
            Main_RESET_N : in std_logic;
            RX_FIFO_RE : in std_logic;
            TX_FIFO_WE : in std_logic;
            MD_Fifo_Empty : in std_logic;
            TX_FIFO_Data : in std_logic_vector(39 downto 0);
            Communication_Number : in std_logic_vector(3 downto 0);
            MD_Fifo_Data : in std_logic_vector(31 downto 0);

            -- Outputs
            FTDI_nWR : out std_logic;
            FTDI_nOE : out std_logic;
            FTDI_nRD : out std_logic;
            FTDI_RESET_N : out std_logic;
            FTDI_GPIO_0 : out std_logic;
            FTDI_GPIO_1 : out std_logic;
            RX_FIFO_EMPTY : out std_logic;
            TX_FULL : out std_logic;
            SIWU_N : out std_logic;
            DBG_FIFO_WR : out std_logic;
            DBG_FIFO_RD : out std_logic;
            DBG_EMPTY : out std_logic;
            MD_Fifo_RE : out std_logic;
            RX_FIFO_Data : out std_logic_vector(39 downto 0);
            DBG_FIFO_AFULL : out std_logic;

            -- Inouts
            FTDI_DATA : inout std_logic_vector(31 downto 0);
            FTDI_BE : inout std_logic_vector(3 downto 0)

        );
    end component;


    component fifo_for_test
        -- ports
        port( 
            -- Inputs
            WE : in std_logic;
            RE : in std_logic;
            WRESET_N : in std_logic;
            RRESET_N : in std_logic;
            WCLOCK : in std_logic;
            RCLOCK : in std_logic;
            DATA : in std_logic_vector(31 downto 0);

            -- Outputs
            FULL : out std_logic;
            EMPTY : out std_logic;
            Q : out std_logic_vector(31 downto 0)

            -- Inouts

        );
    end component;





------------------------------------------------------------------------------------------------------------
--Procedure
------------------------------------------------------------------------------------------------------------
    procedure SEND_CMD( REG_ADDR : in std_logic_vector(7 downto 0);
                        REG_DATA : in std_logic_vector(15 downto 0);
                        Write_Read : in std_logic;

                        signal Clock : in std_logic;
                        signal CTRL_addr_frame : out std_logic_vector(7 downto 0);
                        signal CTRL_write_data_frame : out std_logic_vector(15 downto 0);
                        signal CTRL_enable_cmd : out std_logic;
                        signal CTRL_write_read : out std_logic;
                        signal CTRL_busy : in std_logic
                    ) is
    begin

        wait until Clock'event and Clock = '1';

        CTRL_addr_frame <= REG_ADDR;
        CTRL_write_data_frame <= REG_DATA;

        CTRL_write_read <= Write_Read;

        CTRL_enable_cmd <= '1';
        wait until Clock'event and Clock = '1';
        wait until CTRL_busy'event and CTRL_busy = '1';
        CTRL_enable_cmd <= '0';
        wait until CTRL_busy'event and CTRL_busy = '0';
        CTRL_enable_cmd <= '0';
        wait until Clock'event and Clock = '1';

    end SEND_CMD; 



    procedure STORE_CMD_ANW(    ID : in std_logic_vector(7 downto 0);
                                DATA : in std_logic_vector(23 downto 0);

                                signal Clock : in std_logic;
                                signal TX_FIFO_Data : out std_logic_vector(39 downto 0);
                                signal TX_FIFO_WE : out std_logic
                            ) is
    begin

        wait until Clock'event and Clock = '1';
        TX_FIFO_Data <= x"00" & '1' & ID(6 downto 0) & DATA;
        TX_FIFO_WE <= '1';
        wait until Clock'event and Clock = '1';
        TX_FIFO_WE <= '0';

    end STORE_CMD_ANW;   




begin

    data_for_store <= TestFifoData;
    --Data_Valid <= not FTDI_nWR;



    process
        variable vhdl_initial : BOOLEAN := TRUE;

    begin
        if ( vhdl_initial ) then
            -- Assert Reset
            NSYSRESET <= '0';
            wait for ( SYSCLK_PERIOD * 10 );
            
            NSYSRESET <= '1';
            wait;
        end if;
    end process;

    -- Clock Driver
    SYSCLK <= not SYSCLK after (SYSCLK_PERIOD / 2.0 );


    --ftdi clock driver
    FTDI_CLK <= not FTDI_CLK after (FTDICLK_PERIOD / 2.0 );


    READ_CLK <= not READ_CLK after (READCLK_PERIOD / 2.0 );

    -- Instantiate Unit Under Test:  Data_Block
    Data_Block_0 : Data_Block
        -- port map
        port map( 
            -- Inputs
            C_enable_cmd => CTRL_enable_cmd,
            C_write_read => CTRL_write_read,
            Clock => SYSCLK,
            Communication_Read => Communication_Read,
            Communication_Builder_RUN => Communication_Builder_RUN,
            Fifo_RESET_N => NSYSRESET,
            Reset_N => NSYSRESET,
            C_addr_frame => CTRL_addr_frame,
            C_write_data_frame => CTRL_write_data_frame,

            -- Outputs
            C_busy =>  CTRL_busy,
            Communication_Empty =>  Communication_Empty,
            Diag_0 =>  open,
            Diag_1 =>  open,
            Diag_2 =>  open,
            Diag_3 =>  open,
            C_read_data_frame => CTRL_read_data_frame,
            Communication_Data_Frame => Communication_Data_Frame,
            Communication_Data_Req => Communication_Data_Req 

            -- Inouts

        );



    inst_USB_3_Protocol : USB_3_Protocol
        -- ports
        port map( 
            -- Inputs
            FTDI_CLK => FTDI_CLK,
            FTDI_nRXF => FTDI_nRXF,
            FTDI_nTXE => FTDI_nTXE,
            Main_CLK => SYSCLK,
            Main_RESET_N => NSYSRESET,
            RX_FIFO_RE => '0',
            TX_FIFO_WE => TX_FIFO_WE,
            MD_Fifo_Empty => Communication_Empty,
            TX_FIFO_Data => TX_FIFO_Data,
            Communication_Number => x"0",
            MD_Fifo_Data => Communication_Data_Frame,

            -- Outputs
            FTDI_nWR => FTDI_nWR,
            FTDI_nOE => FTDI_nOE,
            FTDI_nRD => FTDI_nRD,
            FTDI_RESET_N => FTDI_RESET_N,
            FTDI_GPIO_0 => open,
            FTDI_GPIO_1 => open,
            RX_FIFO_EMPTY => open,
            TX_FULL => TX_FULL,
            SIWU_N => open,
            DBG_FIFO_WR => open,
            DBG_FIFO_RD => open,
            DBG_EMPTY => open,
            MD_Fifo_RE => Communication_Read,
            RX_FIFO_Data => open,
            DBG_FIFO_AFULL => open,

            -- Inouts
            FTDI_DATA => FTDI_DATA,
            FTDI_BE => FTDI_BE

        );


    inst_fifo_for_test : fifo_for_test
        -- ports
        port map( 
            -- Inputs
            WE => not FTDI_nWR,
            RE => TestFifoRead,
            WRESET_N => NSYSRESET,
            RRESET_N => NSYSRESET,
            WCLOCK => FTDI_CLK,
            RCLOCK => READ_CLK,
            DATA => FTDI_DATA,

            -- Outputs
            FULL => FTDI_nTXE,
            EMPTY => TestFifoEmpty,
            Q => TestFifoData

            -- Inouts

        );




------------------------------------------------------------------------------------------------------------
--Test Process
------------------------------------------------------------------------------------------------------------
    process
        variable write_col_to_output_buf : line; -- line is keyword
    begin

        --init test file
        file_open(output_buf, "test_output_file.txt",  write_mode);
        write(write_col_to_output_buf, string'("START Test..."));
        writeline(output_buf, write_col_to_output_buf);

        file_open(output_buf_raw, "test_output_file_raw.txt",  write_mode);



        wait until NSYSRESET'event and NSYSRESET = '1';
        wait for 100 ns;
        wait until SYSCLK'event and SYSCLK = '1';

        Communication_Builder_RUN <= '1';
        FTDI_nRXF <= '1';
        --FTDI_nTXE <= '0';



        --read threshold
        SEND_CMD( X"01", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        --set threshold
        SEND_CMD( X"01", X"0033", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        --set samples count
        --SEND_CMD( X"02", X"0222", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        SEND_CMD( X"02", X"01A0", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy); --set samples count 
        SEND_CMD( X"04", X"000C", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy); --set num of events

        wait for 200 ns;
        --Enable Acqusition
        SEND_CMD( X"00", X"0001", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        
        wait for 200 ns;
        --Enable Test Generator
        SEND_CMD( X"30", X"0001", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        

        wait for 6 us;
        STORE_CMD_ANW(X"11", X"ABCDEF", SYSCLK, TX_FIFO_Data, TX_FIFO_WE);


        wait for 7 us; 
        --SEND_CMD( X"00", X"0000", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);-- disable Acqusition 
        --SEND_CMD( X"30", X"0000", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);-- disble Test Generator


        --SEND_CMD( X"01", X"0FAA", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy); --set threshold
        --SEND_CMD( X"02", X"0150", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy); --set samples count

        --SEND_CMD( X"00", X"0001", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy); --Enable Acqusition
        --wait for 100 ns;
        --SEND_CMD( X"30", X"0001", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy); --Enable Test Generator



        
        --wait for 10 us;
        --SEND_CMD( X"04", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        --SEND_CMD( X"06", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
       
        --wait for 20 us;
        --SEND_CMD( X"04", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        --SEND_CMD( X"06", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
       
        --wait for 10 us;
        --SEND_CMD( X"04", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        --SEND_CMD( X"06", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
       
        --wait for 30 us;
        --SEND_CMD( X"04", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        --SEND_CMD( X"06", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
       
        --wait for 10 us;
        --SEND_CMD( X"04", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        --SEND_CMD( X"06", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
       

        wait;

    end process;




------------------------------------------------------------------------------------------------------------
--Data write process
------------------------------------------------------------------------------------------------------------
    process(NSYSRESET,READ_CLK)

        variable write_col_to_output_buf : line; -- line is keyword
        variable write_col_to_output_buf_raw : line;

    begin

        if(NSYSRESET = '0') then
            null;
        

        elsif(READ_CLK'event and READ_CLK = '1') then

            if(Data_Valid = '1') then

      
                if(data_for_store(31 downto 24) = X"FA") then
                    write(write_col_to_output_buf, string'(" "));
                    writeline(output_buf, write_col_to_output_buf); 
                    write(write_col_to_output_buf, string'("EVENT HEAD"));
                    write(write_col_to_output_buf, string'("; Event Num= "));
                    write(write_col_to_output_buf, to_hstring(data_for_store(23 downto 0)));
      
                elsif(data_for_store(31 downto 24) = X"FB") then
                    write(write_col_to_output_buf, string'("EVENT TAIL"));
                    write(write_col_to_output_buf, string'("; Packet Count = "));
                    write(write_col_to_output_buf, to_hstring(data_for_store(23 downto 0)));

                elsif(data_for_store(31 downto 24) = X"FC") then
                    write(write_col_to_output_buf, string'("PACKET HEAD"));
                    write(write_col_to_output_buf, string'("; Packet Number = "));
                    write(write_col_to_output_buf, to_hstring(data_for_store(23 downto 0)));

                elsif(data_for_store(31 downto 24) = X"FD") then
                    write(write_col_to_output_buf, string'("PACKET TAIL"));
                    write(write_col_to_output_buf, string'("; Samples Count = "));
                    write(write_col_to_output_buf, to_hstring(data_for_store(23 downto 0)));

                elsif(data_for_store(31) = '0') then
        
                    write(write_col_to_output_buf, string'("Frame = "));
                    write(write_col_to_output_buf, to_hstring(data_for_store(30 downto 24)));
        
                    write(write_col_to_output_buf, string'("; Sample1 = "));
                    write(write_col_to_output_buf, to_hstring(data_for_store(11 downto 0)));

                    write(write_col_to_output_buf, string'("; Sample2 = "));
                    write(write_col_to_output_buf, to_hstring(data_for_store(23 downto 12)));

                elsif(data_for_store(31) = '1') then
                    write(write_col_to_output_buf, string'("-------------------------------------------- CMD: "));
                    write(write_col_to_output_buf, string'("ID = "));
                    write(write_col_to_output_buf, to_hstring(data_for_store(30 downto 24)));
                    write(write_col_to_output_buf, string'("; DATA = "));
                    write(write_col_to_output_buf, to_hstring(data_for_store(23 downto 0)));

                else  
                    write(write_col_to_output_buf, string'("??"));

                end if;

                writeline(output_buf, write_col_to_output_buf);  -- write in line 1

                write(write_col_to_output_buf_raw, data_for_store);
                writeline(output_buf_raw, write_col_to_output_buf_raw); 


            end if;

        end if;
    
    end process;


------------------------------------------------------------------------------------------------------------
--fifo read
------------------------------------------------------------------------------------------------------------
    process(NSYSRESET,READ_CLK)
    begin

        if(NSYSRESET = '0') then
            state_reg <= IDLE;
        
        elsif(READ_CLK'event and READ_CLK = '1') then
            state_reg <= next_state;

        end if;
    end process;

    --translation function
    process(next_state, state_reg, TestFifoEmpty )
    begin

        next_state <= state_reg;

        case state_reg is
        
            when IDLE =>
                if(TestFifoEmpty = '0') then
                    next_state <= WAIT_FOR_DATA; 
                end if;

            when WAIT_FOR_DATA =>
                next_state <= READ_DATA;  

            when READ_DATA =>
                if(TestFifoEmpty = '1') then
                    next_state <= IDLE;  
                end if;
                

            when others =>
                null; 

        end case;
    end process;

    --output function
    process(state_reg)
    begin

        case state_reg is
        
            when IDLE =>
                TestFifoRead  <= '0';
                Data_Valid          <= '0';

            when WAIT_FOR_DATA=>
                TestFifoRead  <= '1';
                Data_Valid          <= '0';

            when READ_DATA =>
                TestFifoRead  <= '1';
                Data_Valid          <= '1';

            when others =>
                TestFifoRead  <= '0';
                Data_Valid          <= '0';

        end case;

    end process;





end behavioral;

