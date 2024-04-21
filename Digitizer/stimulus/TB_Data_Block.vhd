--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: TB_Data_Block.vhd
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

library work;
use work.cmd_table_trigger.all;

entity TB_Data_Block is
end TB_Data_Block;

architecture behavioral of TB_Data_Block is

    constant SYSCLK_PERIOD : time := 10 ns; -- 100MHZ

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

    signal Control_Fifo_Data : std_logic_vector(39 downto 0);
    signal Control_Fifo_Empty : std_logic;
    signal Control_Fifo_RE : std_logic;
        
    signal TX_Fifo_Full : std_logic;
    signal TX_Fifo_WE : std_logic;
    signal TX_Fifo_Data : std_logic_vector(39 downto 0);      

    signal Data_Valid: std_logic;
    signal data_for_store : std_logic_vector(31 downto 0);

    signal Input_Data_0_00 :  std_logic_vector(11 downto 0);
    signal Input_Data_3_00 :  std_logic_vector(11 downto 0);
    signal Input_Data_2_00 :  std_logic_vector(11 downto 0);
    signal Input_Data_1_00 :  std_logic_vector(11 downto 0);
    signal Input_Data_0_01 :  std_logic_vector(11 downto 0);
    signal Input_Data_3_01 :  std_logic_vector(11 downto 0);
    signal Input_Data_2_01 :  std_logic_vector(11 downto 0);
    signal Input_Data_1_01 :  std_logic_vector(11 downto 0);

    
    file output_buf : text;  -- text is keyword
    file output_buf_raw : text;

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
            Communication_Read : in std_logic;
            Communication_Builder_RUN : in std_logic;
            Fifo_RESET_N : in std_logic;
            Reset_N : in std_logic;
            Clock : in std_logic;
            C_addr_frame : in std_logic_vector(7 downto 0);
            C_write_data_frame : in std_logic_vector(15 downto 0);
            Input_Data_0_00 : in std_logic_vector(11 downto 0);
            Input_Data_3_00 : in std_logic_vector(11 downto 0);
            Input_Data_2_00 : in std_logic_vector(11 downto 0);
            Input_Data_1_00 : in std_logic_vector(11 downto 0);
            Input_Data_0_01 : in std_logic_vector(11 downto 0);
            Input_Data_3_01 : in std_logic_vector(11 downto 0);
            Input_Data_2_01 : in std_logic_vector(11 downto 0);
            Input_Data_1_01 : in std_logic_vector(11 downto 0);

            -- Outputs
            C_busy : out std_logic;
            Communication_Empty : out std_logic;
            Diag_0 : out std_logic;
            Diag_1 : out std_logic;
            Diag_2 : out std_logic;
            Diag_3 : out std_logic;
            Communication_Data_Req : out std_logic;
            Control_Test_Generator_Enable : out std_logic;
            C_read_data_frame : out std_logic_vector(15 downto 0);
            Communication_Data_Frame : out std_logic_vector(31 downto 0)

            -- Inouts

        );
    end component;


    component Communication_TX_Arbiter2 is
    port
    (
        Clock : in std_logic;                                           --system clock
        Reset_N : in std_logic;                                         --system reset
        
        -- fifo from controler
        Control_Fifo_Data : in std_logic_vector(39 downto 0);
        Control_Fifo_Empty : in std_logic;
        Control_Fifo_RE : out std_logic;
        
        --measurement data interface
        MD_Fifo_Data : in std_logic_vector(31 downto 0);             
        MD_Fifo_Empty : in std_logic;                              
        MD_Fifo_RE : out std_logic;

        --tx communication fifo
        TX_Fifo_Full : in std_logic;
        TX_Fifo_WE : out std_logic;
        TX_Fifo_Data : out std_logic_vector(39 downto 0)      

    );
    end component;


    component Test_Generator_for_Lanes is
    generic
    (
        g_Data_Length : Natural := 12
    );
    port
    (
        Clock : in std_logic;
        Reset_N : in std_logic;

        Test_Enable : in std_logic;

        Test_Data_0 : out std_logic_vector(g_Data_Length - 1 downto 0);
        Test_Data_1 : out std_logic_vector(g_Data_Length - 1 downto 0);
        Test_Data_2 : out std_logic_vector(g_Data_Length - 1 downto 0);
        Test_Data_3 : out std_logic_vector(g_Data_Length - 1 downto 0);
        Test_Data_4 : out std_logic_vector(g_Data_Length - 1 downto 0);
        Test_Data_5 : out std_logic_vector(g_Data_Length - 1 downto 0);
        Test_Data_6 : out std_logic_vector(g_Data_Length - 1 downto 0);
        Test_Data_7 : out std_logic_vector(g_Data_Length - 1 downto 0)

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
                                signal Control_Fifo_Data : out std_logic_vector(39 downto 0);
                                signal Control_Fifo_Empty : out std_logic;
                                signal Control_Fifo_RE : in std_logic
                            ) is
    begin

        wait until Clock'event and Clock = '1';
        Control_Fifo_Data <= x"00" & '1' & ID(6 downto 0) & DATA;
        Control_Fifo_Empty <= '0';
        wait until Control_Fifo_RE'event and Control_Fifo_RE = '1';
        wait until Clock'event and Clock = '1';
        Control_Fifo_Empty <= '1';


    end STORE_CMD_ANW;   



begin

    data_for_store <= TX_Fifo_Data(31 downto 0);
    Data_Valid <= TX_Fifo_WE;


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

    -- Instantiate Unit Under Test:  Data_Block
    Data_Block_0 : Data_Block
        -- port map
        port map( 
            -- Inputs
            C_enable_cmd => CTRL_enable_cmd,
            C_write_read => CTRL_write_read,
            Communication_Read => Communication_Read,
            Communication_Builder_RUN => Communication_Builder_RUN,
            Fifo_RESET_N => NSYSRESET,
            Reset_N => NSYSRESET,
            Clock => SYSCLK,
            C_addr_frame => CTRL_addr_frame,
            C_write_data_frame => CTRL_write_data_frame,
            Input_Data_0_00 => Input_Data_0_00,
            Input_Data_3_00 => Input_Data_3_00,
            Input_Data_2_00 => Input_Data_2_00,
            Input_Data_1_00 => Input_Data_1_00,
            Input_Data_0_01 => Input_Data_0_01,
            Input_Data_3_01 => Input_Data_3_01,
            Input_Data_2_01 => Input_Data_2_01,
            Input_Data_1_01 => Input_Data_1_01,

            -- Outputs
            C_busy =>  CTRL_busy,
            Communication_Empty =>  Communication_Empty,
            Diag_0 =>  open,
            Diag_1 =>  open,
            Diag_2 =>  open,
            Diag_3 =>  open,
            Communication_Data_Req =>  Communication_Data_Req,
            Control_Test_Generator_Enable =>  open,
            C_read_data_frame => CTRL_read_data_frame,
            Communication_Data_Frame => Communication_Data_Frame

            -- Inouts

        );


    --instatce of Communication_TX_Arbiter2
    inst_Communication_TX_Arbiter2 : Communication_TX_Arbiter2
    port map
    (
        Clock => SYSCLK,
        Reset_N => NSYSRESET,
        
        -- fifo from controler
        Control_Fifo_Data => Control_Fifo_Data,
        Control_Fifo_Empty => Control_Fifo_Empty,
        Control_Fifo_RE => Control_Fifo_RE,
        
        --measurement data interface
        MD_Fifo_Data => Communication_Data_Frame,     
        MD_Fifo_Empty => Communication_Empty,                           
        MD_Fifo_RE => Communication_Read,

        --tx communication fifo
        TX_Fifo_Full => TX_Fifo_Full,
        TX_Fifo_WE => TX_Fifo_WE,
        TX_Fifo_Data => TX_Fifo_Data    

    );


    inst_Test_Generator_for_Lanes : Test_Generator_for_Lanes
    generic map 
    (
        g_Data_Length => 12
    )
    port map
    (
        Clock => SYSCLK,
        Reset_N => NSYSRESET,

        Test_Enable => '1',

        Test_Data_0 => Input_Data_0_00,
        Test_Data_1 => Input_Data_1_00,
        Test_Data_2 => Input_Data_2_00,
        Test_Data_3 => Input_Data_3_00,
        Test_Data_4 => Input_Data_0_01,
        Test_Data_5 => Input_Data_1_01,
        Test_Data_6 => Input_Data_2_01,
        Test_Data_7 => Input_Data_3_01

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
        --TX_Fifo_Full <= '0';

        Control_Fifo_Data <= (others => '0');
        Control_Fifo_Data(31) <= '1';
        Control_Fifo_Empty <= '1';

        --read threshold
        --SEND_CMD( X"01", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        
        --set threshold
        SEND_CMD( CMD_TRG_THRESHOLD, X"0DAC", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        --set samples count
        SEND_CMD( CMD_TRG_SAMPLE_PER_EVENT_L, X"270F", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        --set event count
        SEND_CMD( CMD_TRG_SET_NUMBERS_OF_EVENTS_L, X"0004", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        --mode
        --SEND_CMD( CMD_TRG_ABORT_MODE, X"0001", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);

        wait for 100 ns;
        --Enable Acqusition
        SEND_CMD( CMD_TRG_ENABLE, X"0001", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        
        wait for 200 ns;
        --Enable Test Generator
        --SEND_CMD( X"30", X"0001", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        

        wait for 6 us;
        --STORE_CMD_ANW(X"11", X"ABCDEF", SYSCLK, Control_Fifo_Data, Control_Fifo_Empty, Control_Fifo_RE );


        wait for 8 us; 
        --SEND_CMD( X"00", X"0000", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);-- disable Acqusition 
        --SEND_CMD( X"30", X"0000", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);-- disble Test Generator


        --SEND_CMD( X"01", X"0FAA", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy); --set threshold
        --SEND_CMD( X"02", X"0150", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy); --set samples count

        --SEND_CMD( X"00", X"0001", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy); --Enable Acqusition
        --wait for 100 ns;
        --SEND_CMD( X"30", X"0001", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy); --Enable Test Generator



        
        wait for 10 us;
        --SEND_CMD( X"04", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        --SEND_CMD( X"06", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
       
        wait for 20 us;
        --SEND_CMD( X"04", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        --SEND_CMD( X"06", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
       
        wait for 10 us;
        --SEND_CMD( X"04", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        --SEND_CMD( X"06", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
       
        wait for 30 us;
        --SEND_CMD( X"04", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        --SEND_CMD( X"06", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
       
        wait for 10 us;
        --SEND_CMD( X"04", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        --SEND_CMD( X"06", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
       

        wait;

    end process;




------------------------------------------------------------------------------------------------------------
--Data write process
------------------------------------------------------------------------------------------------------------
    process(NSYSRESET,SYSCLK)

        variable write_col_to_output_buf : line; -- line is keyword
        variable write_col_to_output_buf_raw : line;

    begin

        if(NSYSRESET = '0') then
            null;
        

        elsif(SYSCLK'event and SYSCLK = '1') then

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




    process(NSYSRESET,SYSCLK)

        variable Counter : unsigned (31 downto 0);


    begin

        if(NSYSRESET = '0') then
            Counter := (others => '0');
            TX_Fifo_Full <= '0';
        

        elsif(SYSCLK'event and SYSCLK = '1') then

            if(Data_Valid = '1') then
                Counter :=  Counter + 1;

            else
                if(Counter > 0) then
                    Counter :=  Counter - 1;
                end if;

            end if;


            if(Counter > 1000) then
                TX_Fifo_Full <= '1';
            
            elsif(Counter < 980) then
                TX_Fifo_Full <= '0';
            
            end if;


        end if;

    end process;



end behavioral;

