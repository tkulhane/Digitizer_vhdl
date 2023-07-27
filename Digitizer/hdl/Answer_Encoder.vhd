library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.cmd_table.all;


entity Answer_Encoder is
    port
    (
        Clock : in std_logic;                                           --system clock
        Reset_N : in std_logic;                                         --system reset

        --fifo interface
        Fifo_Write_Data : out std_logic_vector(39 downto 0);              
        Fifo_Write_Enable : out std_logic;                              
        Fifo_Full : in std_logic;

        --Command Decoder interface
        CD_CMD_Data : in std_logic_vector(39 downto 0);
        CD_enable_cmd : in std_logic;
        CD_busy : out std_logic;
        CD_FAULT_PROCESSED_EXECUTE : in std_logic; 

        --System Controler
        SYS_rx_data : in std_logic_vector(15 downto 0);

        --registers
        REG_rx_data : in std_logic_vector(7 downto 0);

        --ADC ADI-SPI interface
        ADCSPI_rx_data : in std_logic_vector(7 downto 0);

        --HMC HMC-SPI interface
        HMCSPI_rx_data : in std_logic_vector(7 downto 0);

        --LMX1 SPI interface
        LMX1SPI_rx_data : in std_logic_vector(15 downto 0);

        --LMX2 SPI interface
        LMX2SPI_rx_data : in std_logic_vector(15 downto 0);
        
        --Trigger
        TRG_rx_data : in std_logic_vector(15 downto 0);


        Diag_Valid : out std_logic                                     
    );
end Answer_Encoder;


architecture rtl of Answer_Encoder is

    type FSM_state is (IDLE, READ_P_DATA, WAIF_FOR_FIFO, WRITE_TO_FIFO, FAULT_PROCESSED_EXECUTE);
    signal state_reg, next_state : FSM_state;

    signal cmd_all_data : std_logic_vector(39 downto 0);
    signal cmd_status_err : std_logic;
    signal cmd_status_dummy : std_logic_vector(2 downto 0);
    signal cmd_status_comm : std_logic_vector(3 downto 0);
    signal cmd_CDb : std_logic;
    signal cmd_ID : std_logic_vector(7 downto 0);
    --signal cmd_data : std_logic_vector(23 downto 0);

    signal store_data : std_logic;
    signal periph_data : std_logic_vector(23 downto 0);
    signal periph_data_buffer : std_logic_vector(23 downto 0); 
    
    signal CMD_STATUS_Part: std_logic_vector(7 downto 0);
    signal CMD_ID_Part : std_logic_vector(7 downto 0);
    signal CMD_DATA_Part_2 : std_logic_vector(7 downto 0);
    signal CMD_DATA_Part_1 : std_logic_vector(7 downto 0);
    signal CMD_DATA_Part_0 : std_logic_vector(7 downto 0);

begin

------------------------------------------------------------------------------------------------------------
--signal routing
------------------------------------------------------------------------------------------------------------

    CMD_STATUS_Part     <= CD_CMD_Data(39 downto 32);
    CMD_ID_Part         <= CD_CMD_Data(31 downto 24);
    CMD_DATA_Part_2     <= CD_CMD_Data(23 downto 16);
    CMD_DATA_Part_1     <= CD_CMD_Data(15 downto 8);
    CMD_DATA_Part_0     <= CD_CMD_Data(7 downto 0);

    --Fifo_Write_Data <= CMD_STATUS_Part & CMD_ID_Part & periph_data_buffer;
    Fifo_Write_Data <= cmd_status_err & cmd_status_dummy & cmd_status_comm & cmd_CDb & cmd_ID(6 downto 0) & periph_data_buffer;

------------------------------------------------------------------------------------------------------------
--FSM encoder ride
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
    process(next_state, state_reg, CD_enable_cmd, Fifo_Full, CD_FAULT_PROCESSED_EXECUTE)
    begin

        next_state <= state_reg;

        case state_reg is
        
            when IDLE =>
                if(CD_FAULT_PROCESSED_EXECUTE = '1') then
                    next_state <= FAULT_PROCESSED_EXECUTE;
                elsif(CD_enable_cmd = '1') then
                    next_state <= READ_P_DATA;
                end if;

            when READ_P_DATA =>
                next_state <= WAIF_FOR_FIFO;  
                --if(Fifo_Full = '1') then
                --    next_state <= WAIF_FOR_FIFO;
                --else
                --    next_state <= WRITE_TO_FIFO;
                --end if;

            when WAIF_FOR_FIFO =>
                if(Fifo_Full = '0') then
                    next_state <= WRITE_TO_FIFO;
                end if;

            when WRITE_TO_FIFO =>
                next_state <= IDLE;

            when FAULT_PROCESSED_EXECUTE =>
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
                CD_busy             <= '0';
                Fifo_Write_Enable   <= '0';
                store_data          <= '0';
                Diag_Valid          <= '0';

            when READ_P_DATA =>
                CD_busy             <= '1';
                Fifo_Write_Enable   <= '0';
                store_data          <= '1';
                Diag_Valid          <= '1';

            when WAIF_FOR_FIFO =>
                CD_busy             <= '1';
                Fifo_Write_Enable   <= '0';
                store_data          <= '0';
                Diag_Valid          <= '1';
            
            when WRITE_TO_FIFO =>
                CD_busy             <= '1';
                Fifo_Write_Enable   <= '1';
                store_data          <= '0';
                Diag_Valid          <= '1';

            when FAULT_PROCESSED_EXECUTE =>
                CD_busy             <= '0';
                Fifo_Write_Enable   <= '1';
                store_data          <= '1';
                Diag_Valid          <= '1';

            when others =>
                CD_busy             <= '0';
                Fifo_Write_Enable   <= '0';
                store_data          <= '0';
                Diag_Valid          <= '0';

        end case;

    end process;

------------------------------------------------------------------------------------------------------------
--store rx peripherial data
------------------------------------------------------------------------------------------------------------
    process(Reset_N,Clock)

    begin

        if(Reset_N = '0') then
            periph_data_buffer <= (others => '0');

        elsif(Clock'event and clock = '1') then

            if(store_data = '1') then
                periph_data_buffer <= periph_data;
            end if;

        end if;

    end process;

------------------------------------------------------------------------------------------------------------
--store command data
------------------------------------------------------------------------------------------------------------
    process(Reset_N,Clock)

    begin

        if(Reset_N = '0') then
            cmd_all_data <= (others => '0');
            cmd_status_err      <= '0';
            cmd_status_dummy    <= (others => '0');
            cmd_status_comm     <= (others => '0');
            cmd_CDb             <= '0';
            cmd_ID              <= (others => '0');
            --cmd_data            <= (others => '0');

        elsif(Clock'event and clock = '1') then

            if(CD_FAULT_PROCESSED_EXECUTE = '1') then
                cmd_all_data        <= (others => '0');
                cmd_status_err      <= CD_CMD_Data(39);
                cmd_status_dummy    <= CD_CMD_Data(38 downto 36);
                cmd_status_comm     <= CD_CMD_Data(35 downto 32);
                cmd_CDb             <= '1';
                cmd_ID              <= '0' & CMD_CONST_FAULT(6 downto 0);

            elsif(CD_enable_cmd = '1') then
                cmd_all_data <= CD_CMD_Data;
                cmd_status_err      <= CD_CMD_Data(39);
                cmd_status_dummy    <= CD_CMD_Data(38 downto 36);
                cmd_status_comm     <= CD_CMD_Data(35 downto 32);
                cmd_CDb             <= CD_CMD_Data(31);
                cmd_ID              <= '0' & CD_CMD_Data(30 downto 24);
                --cmd_data            <= CD_CMD_Data(23 downto 0);
            
            end if;

        end if;

    end process;

------------------------------------------------------------------------------------------------------------
--encoder
------------------------------------------------------------------------------------------------------------
    process(cmd_ID,ADCSPI_rx_data,REG_rx_data,CD_CMD_Data,CMD_DATA_Part_2,CMD_DATA_Part_1,CMD_DATA_Part_0,TRG_rx_data,SYS_rx_data)
    begin

        case cmd_ID is

            when CMD_CONST_Loopback =>
                periph_data <= CMD_DATA_Part_2 & CMD_DATA_Part_1 & CMD_DATA_Part_0;

            when CMD_CONST_FAULT =>
                periph_data <= (others => '1');

            --system controler
            when CMD_CONST_SET_System_Controler =>
                periph_data <= (others => '0');

            when CMD_CONST_GET_System_Controler =>
                periph_data <= CMD_DATA_Part_2 & SYS_rx_data;

            --Test registers
            when CMD_CONST_SET_TestRegisters =>
                periph_data <= (others => '0');

            when CMD_CONST_GET_TestRegisters=>
                periph_data <= CMD_DATA_Part_2 & CMD_DATA_Part_1 & REG_rx_data;

            --ADC
            when CMD_CONST_SET_AdcRegisters =>
                periph_data <= (others => '0');

            when CMD_CONST_GET_AdcRegisters =>
                periph_data <= CMD_DATA_Part_2 & CMD_DATA_Part_1 & ADCSPI_rx_data;

            --HMC
            when CMD_CONST_SET_HmcRegisters =>
                periph_data <= (others => '0');

            when CMD_CONST_GET_HmcRegisters =>
                periph_data <= CMD_DATA_Part_2 & CMD_DATA_Part_1 & HMCSPI_rx_data;

            --LMX1
            when CMD_CONST_SET_Lmx1Registers =>
                periph_data <= (others => '0');

            when CMD_CONST_GET_Lmx1Registers =>
                periph_data <= CMD_DATA_Part_2 & LMX1SPI_rx_data;

            --LMX2
            when CMD_CONST_SET_Lmx2Registers =>
                periph_data <= (others => '0');

            when CMD_CONST_GET_Lmx2Registers =>
                periph_data <= CMD_DATA_Part_2 & LMX2SPI_rx_data;
        
            --Trigger
            when CMD_CONST_SET_TriggerRegisters=>
                periph_data <= (others => '0');

            when CMD_CONST_GET_TriggerRegisters=>
                periph_data <= CMD_DATA_Part_2 & TRG_rx_data;


            when others =>
                periph_data <= (others => '0');
                    
        end case;

    end process;


end rtl;