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

    signal Communication_Data_Full : std_logic;
    signal Communication_Data_Enable : std_logic;
    signal Communication_Data_Frame : std_logic_vector(31 downto 0);
    signal Communication_Data_Req : std_logic;


    file output_buf : text;  -- text is keyword
    file output_buf_raw : text;

------------------------------------------------------------------------------------------------------------
--Component
------------------------------------------------------------------------------------------------------------    
    component Data_Block
        -- ports
        port( 
            -- Inputs
            C_enable_cmd : in std_logic;
            C_write_read : in std_logic;
            C_addr_frame : in std_logic_vector(7 downto 0);
            C_write_data_frame : in std_logic_vector(15 downto 0);
            Clock : in std_logic;
            Reset_N : in std_logic;
            Communication_Data_Full : in std_logic;

            -- Outputs
            C_read_data_frame : out std_logic_vector(15 downto 0);
            C_busy : out std_logic;
            Communication_Data_Enable : out std_logic;
            Communication_Data_Frame : out std_logic_vector(31 downto 0);
            Communication_Data_Req : out std_logic

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


begin

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
            C_addr_frame => CTRL_addr_frame,
            C_write_data_frame => CTRL_write_data_frame,
            Clock => SYSCLK,
            Reset_N => NSYSRESET,
            Communication_Data_Full => Communication_Data_Full,

            -- Outputs
            C_read_data_frame => CTRL_read_data_frame,
            C_busy =>  CTRL_busy,
            Communication_Data_Enable => Communication_Data_Enable,
            Communication_Data_Frame => Communication_Data_Frame,
            Communication_Data_Req => Communication_Data_Req

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

        --read threshold
        SEND_CMD( X"01", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        --set threshold
        SEND_CMD( X"01", X"0033", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        --set samples count
        SEND_CMD( X"02", X"0222", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
         

        wait for 200 ns;
        --Enable Acqusition
        SEND_CMD( X"00", X"0001", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        
        wait for 200 ns;
        --Enable Test Generator
        SEND_CMD( X"10", X"0001", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        


        wait for 13 us; 
        SEND_CMD( X"00", X"0000", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);-- disable Acqusition 
        SEND_CMD( X"10", X"0000", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);-- disble Test Generator


        SEND_CMD( X"01", X"0FAA", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy); --set threshold
        SEND_CMD( X"02", X"0150", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy); --set samples count

        SEND_CMD( X"00", X"0001", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy); --Enable Acqusition
        wait for 100 ns;
        SEND_CMD( X"10", X"0001", '0', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy); --Enable Test Generator



        
        wait for 10 us;
        SEND_CMD( X"04", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        SEND_CMD( X"06", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
       
        wait for 20 us;
        SEND_CMD( X"04", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        SEND_CMD( X"06", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
       
        wait for 10 us;
        SEND_CMD( X"04", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        SEND_CMD( X"06", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
       
        wait for 30 us;
        SEND_CMD( X"04", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        SEND_CMD( X"06", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
       
        wait for 10 us;
        SEND_CMD( X"04", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
        SEND_CMD( X"06", X"0000", '1', SYSCLK, CTRL_addr_frame, CTRL_write_data_frame, CTRL_enable_cmd, CTRL_write_read, CTRL_busy);
       

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

            if(Communication_Data_Enable = '1') then
      
                if(Communication_Data_Frame(31 downto 24) = X"FA") then
                    write(write_col_to_output_buf, string'(" "));
                    writeline(output_buf, write_col_to_output_buf); 
                    write(write_col_to_output_buf, string'("EVENT HEAD"));
                    write(write_col_to_output_buf, string'("; Event Num= "));
                    write(write_col_to_output_buf, Communication_Data_Frame(23 downto 0));
      
                elsif(Communication_Data_Frame(31 downto 24) = X"FB") then
                    write(write_col_to_output_buf, string'("EVENT TAIL"));
                    write(write_col_to_output_buf, string'("; Packet Count = "));
                    write(write_col_to_output_buf, Communication_Data_Frame(23 downto 0));

                elsif(Communication_Data_Frame(31 downto 24) = X"FC") then
                    write(write_col_to_output_buf, string'("PACKET HEAD"));
                    write(write_col_to_output_buf, string'("; Packet Number = "));
                    write(write_col_to_output_buf, Communication_Data_Frame(23 downto 0));

                elsif(Communication_Data_Frame(31 downto 24) = X"FD") then
                    write(write_col_to_output_buf, string'("PACKET TAIL"));
                    write(write_col_to_output_buf, string'("; Samples Count = "));
                    write(write_col_to_output_buf, Communication_Data_Frame(23 downto 0));

                elsif(Communication_Data_Frame(31) = '0') then
        
                    write(write_col_to_output_buf, string'("Frame = "));
                    write(write_col_to_output_buf, Communication_Data_Frame(30 downto 24));
        
                    write(write_col_to_output_buf, string'("; Sample1 = "));
                    write(write_col_to_output_buf, Communication_Data_Frame(11 downto 0));

                    write(write_col_to_output_buf, string'("; Sample2 = "));
                    write(write_col_to_output_buf, Communication_Data_Frame(23 downto 12));

                else  
                    write(write_col_to_output_buf, string'("??"));

                end if;

                writeline(output_buf, write_col_to_output_buf);  -- write in line 1

                write(write_col_to_output_buf_raw, Communication_Data_Frame);
                writeline(output_buf_raw, write_col_to_output_buf_raw); 


            end if;

        end if;
    
    end process;


------------------------------------------------------------------------------------------------------------
--communication request -> 
------------------------------------------------------------------------------------------------------------
    process
    begin
        Communication_Data_Full <= '1';
        wait until Communication_Data_Req = '1';
        wait for 40 ns;
        wait until SYSCLK'event and SYSCLK = '1';
        Communication_Data_Full <= '0';


        wait for 1 us;
        wait until SYSCLK'event and SYSCLK = '1';
        Communication_Data_Full <= '1';
        wait for 300 ns;
        wait until SYSCLK'event and SYSCLK = '1';
        Communication_Data_Full <= '0';

        
        wait until Communication_Data_Req = '0';
        wait until SYSCLK'event and SYSCLK = '1';
        Communication_Data_Full <= '1';
        

    end process;


end behavioral;

