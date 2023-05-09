library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.cmd_table.all;

entity Command_Decoder is
    port
    (
        Clock : in std_logic;                                           --system clock
        Reset_N : in std_logic;                                         --system reset

        --fifo interface
        Fifo_Read_Data : in std_logic_vector(39 downto 0);              --Command data from FIFO
        Fifo_Read_Enable : out std_logic;                               --Read from fifo
        Fifo_Empty : in std_logic;                                      --Fifo is empty

        --Answer encoder interface
        AE_CMD_Data : out std_logic_vector(39 downto 0);
        AE_enable_cmd : out std_logic;
        AE_busy : in std_logic;
        AE_FAULT_PROCESSED_EXECUTE : out std_logic;

        --System Controler
        SYS_busy : in std_logic;
        SYS_enable_cmd : out std_logic;
        SYS_write_read : out std_logic;
        SYS_addr : out std_logic_vector(7 downto 0);
        SYS_data : out std_logic_vector(15 downto 0);

        --registers
        REG_busy : in std_logic;
        REG_enable_cmd : out std_logic;
        REG_write_read : out std_logic;
        REG_addr : out std_logic_vector(15 downto 0);
        REG_data : out std_logic_vector(7 downto 0);

        --ADC ADI-SPI interface
        ADCSPI_busy : in std_logic;                                             --transfer active
        ADCSPI_enable_cmd : out std_logic;                                      --enable-start stransfer
        ADCSPI_write_read : out std_logic;                                      --write/read bit and command
        ADCSPI_addr_frame : out std_logic_vector(14 downto 0);        --send address
        ADCSPI_tx_data_frame : out std_logic_vector(7 downto 0);     --send data
        
        --Trigger
        TRG_busy : in std_logic;
        TRG_enable_cmd : out std_logic;
        TRG_write_read : out std_logic;
        TRG_addr : out std_logic_vector(7 downto 0);
        TRG_data : out std_logic_vector(15 downto 0);

        Diag_Valid : out std_logic
    

    );
end Command_Decoder;


architecture rtl of Command_Decoder is

    constant To_Fault_Count_Cycle     : integer := 200E6;

------------------------------------------------------------------------------------------------------------
--signal declarate
------------------------------------------------------------------------------------------------------------
    type FSM_state is (IDLE, READ_DATA, STORE_DATA , CMD_VALID, DECODE, DECODE_WAIT, ANSWER, ANSWER_WAIT, FAULT_COMM_EXECUTE, FAULT_PROCESSED_EXECUTE);
    signal state_reg, next_state : FSM_state;

    signal cmd_status_err : std_logic;
    signal cmd_status_dummy : std_logic_vector(2 downto 0);
    signal cmd_status_comm : std_logic_vector(3 downto 0);
    signal cmd_CDb : std_logic;
    signal cmd_ID : std_logic_vector(7 downto 0);
    signal cmd_data : std_logic_vector(23 downto 0);

    signal store_command_data : std_logic;
    signal data_valid_for_decode : std_logic;
    signal decode_vector : std_logic_vector(3 downto 0);

    signal Perif_BUSY : std_logic;
    signal Not_Decode_Value : std_logic;
    signal Has_Answer : std_logic;

    signal FaultCounter_Reset_N : std_logic;
    signal FaultCounter_Elapsed : std_logic;

    

begin

------------------------------------------------------------------------------------------------------------
--signal routing
------------------------------------------------------------------------------------------------------------
    Perif_BUSY <= SYS_busy OR ADCSPI_busy OR REG_busy OR TRG_busy;
    
    --write read
    SYS_write_read      <= Has_Answer;
    REG_write_read      <= Has_Answer;
    ADCSPI_write_read   <= Has_Answer;
    TRG_write_read      <= Has_Answer;

    --perif data routing
    SYS_addr    <= cmd_data(23 downto 16);
    SYS_data    <= cmd_data(15 downto 0);

    REG_addr                <= cmd_data(23 downto 8);
    REG_data                <= cmd_data(7 downto 0);

    ADCSPI_addr_frame       <= cmd_data(22 downto 8);
    ADCSPI_tx_data_frame    <= cmd_data(7 downto 0);

    TRG_addr    <= cmd_data(23 downto 16);
    TRG_data    <= cmd_data(15 downto 0);
    

    --decoder output routing to enable cmd signals
    SYS_enable_cmd      <= data_valid_for_decode and decode_vector(0);
    REG_enable_cmd      <= data_valid_for_decode and decode_vector(1);
    ADCSPI_enable_cmd   <= data_valid_for_decode and decode_vector(2);
    TRG_enable_cmd      <= data_valid_for_decode and decode_vector(3);

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
    process(next_state, state_reg, Perif_BUSY, Fifo_Empty, cmd_CDb, cmd_status_err, Not_Decode_Value, AE_busy, Has_Answer, decode_vector, FaultCounter_Elapsed)
    begin

        next_state <= state_reg;

        case state_reg is
        
            when IDLE =>
                if(Fifo_Empty = '0') then
                    next_state <= READ_DATA;
                end if;

            when READ_DATA =>
                next_state <= STORE_DATA;  
                
            when STORE_DATA =>
                next_state <= CMD_VALID; 

            when CMD_VALID =>
                if(cmd_status_err = '1') then
                    next_state <= FAULT_COMM_EXECUTE;
                elsif(cmd_CDb = '1') then
                    next_state <= DECODE;
                else
                    next_state <= IDLE;
                end if;

            when DECODE =>
                if(Not_Decode_Value = '1') then
                    next_state <= IDLE;
                elsif(unsigned(decode_vector) = 0) then
                    next_state <= ANSWER;
                elsif(Perif_BUSY = '1') then
                    next_state <= DECODE_WAIT;

                end if;

            when DECODE_WAIT =>
                if(Perif_BUSY = '0' and Has_Answer = '0') then
                    next_state <= IDLE;
                elsif(Perif_BUSY = '0' and Has_Answer = '1') then
                    next_state <= ANSWER;
                end if;

            when ANSWER =>
                if(AE_busy = '1') then
                    next_state <= ANSWER_WAIT;
                end if;

            when ANSWER_WAIT =>
                if(AE_busy = '0') then
                    next_state <= IDLE;
                end if;

            when FAULT_COMM_EXECUTE =>
                next_state <= IDLE; 

            when FAULT_PROCESSED_EXECUTE =>
                next_state <= IDLE;

            when others =>
                null; 

        end case;

        -- from any state to FAULT_PROCESSED_EXECUTE
        if(FaultCounter_Elapsed = '1') then
            next_state <= FAULT_PROCESSED_EXECUTE;
        end if;

    end process;

    --output function
    process(state_reg)
    begin

        case state_reg is
        
            when IDLE =>
                Fifo_Read_Enable        <= '0';
                store_command_data      <= '0';
                data_valid_for_decode   <= '0';
                Diag_Valid              <= '0';
                AE_enable_cmd           <= '0';
                FaultCounter_Reset_N    <= '0';
                AE_FAULT_PROCESSED_EXECUTE <= '0';

            when READ_DATA =>
                Fifo_Read_Enable        <= '1';
                store_command_data      <= '0';
                data_valid_for_decode   <= '0';
                Diag_Valid              <= '0';
                AE_enable_cmd           <= '0';
                FaultCounter_Reset_N    <= '1';
                AE_FAULT_PROCESSED_EXECUTE <= '0';
                
            when STORE_DATA =>
                Fifo_Read_Enable        <= '0';
                store_command_data      <= '1';
                data_valid_for_decode   <= '0';
                Diag_Valid              <= '0';
                AE_enable_cmd           <= '0';
                FaultCounter_Reset_N    <= '1';
                AE_FAULT_PROCESSED_EXECUTE <= '0';

            when CMD_VALID =>
                Fifo_Read_Enable        <= '0';
                store_command_data      <= '0';
                data_valid_for_decode   <= '0';
                Diag_Valid              <= '0';
                AE_enable_cmd           <= '0';
                FaultCounter_Reset_N    <= '1';
                AE_FAULT_PROCESSED_EXECUTE <= '0';

            when DECODE =>
                Fifo_Read_Enable        <= '0';
                store_command_data      <= '0';
                data_valid_for_decode   <= '1';
                Diag_Valid              <= '1';
                AE_enable_cmd           <= '0';
                FaultCounter_Reset_N    <= '1';
                AE_FAULT_PROCESSED_EXECUTE <= '0';
              
            when DECODE_WAIT =>
                Fifo_Read_Enable        <= '0';
                store_command_data      <= '0';
                data_valid_for_decode   <= '0';
                Diag_Valid              <= '0';
                AE_enable_cmd           <= '0'; 
                FaultCounter_Reset_N    <= '1'; 
                AE_FAULT_PROCESSED_EXECUTE <= '0';

            when ANSWER =>
                Fifo_Read_Enable        <= '0';
                store_command_data      <= '0';
                data_valid_for_decode   <= '0';
                Diag_Valid              <= '0';
                AE_enable_cmd           <= '1';
                FaultCounter_Reset_N    <= '1';
                AE_FAULT_PROCESSED_EXECUTE <= '0';

            when ANSWER_WAIT =>
                Fifo_Read_Enable        <= '0';
                store_command_data      <= '0';
                data_valid_for_decode   <= '0';
                Diag_Valid              <= '0';
                AE_enable_cmd           <= '0';
                FaultCounter_Reset_N    <= '1';
                AE_FAULT_PROCESSED_EXECUTE <= '0';

            when FAULT_COMM_EXECUTE =>
                Fifo_Read_Enable        <= '0'; 
                store_command_data      <= '0';
                data_valid_for_decode   <= '0';
                Diag_Valid              <= '0';
                AE_enable_cmd           <= '0'; 
                FaultCounter_Reset_N    <= '0';
                AE_FAULT_PROCESSED_EXECUTE <= '1';

            when FAULT_PROCESSED_EXECUTE =>
                Fifo_Read_Enable        <= '0'; 
                store_command_data      <= '0';
                data_valid_for_decode   <= '0';
                Diag_Valid              <= '0';
                AE_enable_cmd           <= '0'; 
                FaultCounter_Reset_N    <= '0';
                AE_FAULT_PROCESSED_EXECUTE <= '1';

            when others =>
                Fifo_Read_Enable        <= '0'; 
                store_command_data      <= '0';
                data_valid_for_decode   <= '0';
                Diag_Valid              <= '0';
                AE_enable_cmd           <= '0';  
                FaultCounter_Reset_N    <= '0';
                AE_FAULT_PROCESSED_EXECUTE <= '0';

        end case;

    end process;

------------------------------------------------------------------------------------------------------------
--store command data
------------------------------------------------------------------------------------------------------------
    process(Reset_N,Clock)

    begin

        if(Reset_N = '0') then
            cmd_status_err      <= '0';
            cmd_status_dummy    <= (others => '0');
            cmd_status_comm     <= (others => '0');
            cmd_CDb             <= '0';
            cmd_ID              <= (others => '0');
            cmd_data            <= (others => '0');
            AE_CMD_Data         <= (others => '0');

        elsif(Clock'event and clock = '1') then

            if(store_command_data = '1') then
                cmd_status_err      <= Fifo_Read_Data(39);
                cmd_status_dummy    <= Fifo_Read_Data(38 downto 36);
                cmd_status_comm     <= Fifo_Read_Data(35 downto 32);
                cmd_CDb             <= Fifo_Read_Data(31);
                cmd_ID              <= '0' & Fifo_Read_Data(30 downto 24);
                cmd_data            <= Fifo_Read_Data(23 downto 0);
                AE_CMD_Data         <= Fifo_Read_Data;
            
            end if;

        end if;

    end process;



------------------------------------------------------------------------------------------------------------
--decoder
------------------------------------------------------------------------------------------------------------
    process(Reset_N,Clock)

    begin

        if(Reset_N = '0') then

            decode_vector <= (others => '0');
            Not_Decode_Value <= '1';
            Has_Answer <= '0';

        elsif(Clock'event and Clock = '1') then    

            case cmd_ID is

                when CMD_CONST_Loopback =>
                    decode_vector       <= "0000";
                    Has_Answer          <= '1';
                    Not_Decode_Value    <= '0'; 

                when CMD_CONST_SET_System_Controler =>
                    decode_vector       <= "0001";
                    Has_Answer          <= '0';
                    Not_Decode_Value    <= '0';

                when CMD_CONST_GET_System_Controler =>
                    decode_vector       <= "0001";
                    Has_Answer          <= '1';
                    Not_Decode_Value    <= '0';

                when CMD_CONST_SET_MainRegisters =>
                    decode_vector       <= "0010";
                    Has_Answer          <= '0';
                    Not_Decode_Value    <= '0';

                when CMD_CONST_GET_MainRegisters=>
                    decode_vector       <= "0010";
                    Has_Answer          <= '1';
                    Not_Decode_Value    <= '0';

                when CMD_CONST_SET_InfoRegisters=>
                    decode_vector       <= "0000";
                    Has_Answer          <= '0';
                    Not_Decode_Value    <= '0';

                when CMD_CONST_GET_InfoRegisters=>
                    decode_vector       <= "0000";
                    Has_Answer          <= '1';
                    Not_Decode_Value    <= '0';

                when CMD_CONST_SET_AdcRegisters =>
                    decode_vector       <= "0100";
                    Has_Answer          <= '0';
                    Not_Decode_Value    <= '0';

                when CMD_CONST_GET_AdcRegisters =>
                    decode_vector       <= "0100";
                    Has_Answer          <= '1';
                    Not_Decode_Value    <= '0';
                    
                when CMD_CONST_SET_TriggerRegisters =>
                    decode_vector       <= "1000";
                    Has_Answer          <= '0';
                    Not_Decode_Value    <= '0';
                    
                when CMD_CONST_GET_TriggerRegisters =>
                    decode_vector       <= "1000";
                    Has_Answer          <= '1';
                    Not_Decode_Value    <= '0';
                    
                    
                when others =>
                    decode_vector <= (others => '0');
                    Has_Answer <= '0';
                    Not_Decode_Value <= '1';
                    
            end case;

        --else

            --decode_vector <= (others => '0');
            --Has_Answer <= '0';
            --Not_Decode_Value <= '0';

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
    

end rtl;