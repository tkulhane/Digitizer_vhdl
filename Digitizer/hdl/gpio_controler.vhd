library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity gpio_controler is
    port
    (
        Clock : in std_logic;                                           --system clock
        Reset_N : in std_logic;                                         --system reset

        busy : out std_logic;
        enable_cmd : in std_logic;
        write_read : in std_logic;
        addr_frame : in std_logic_vector(7 downto 0);
        write_data_frame : in std_logic_vector(15 downto 0);
        read_data_frame : out std_logic_vector(15 downto 0);
        
        Inputs : in std_logic_vector(15 downto 0);
        Outputs : out std_logic_vector(15 downto 0);

        Diag_Valid : out std_logic
    
    );
end gpio_controler;


architecture rtl of gpio_controler is

    constant CMD_GPIO_OUTPUT_STATE      : std_logic_vector(7 downto 0) := x"11";
    constant CMD_GPIO_OUTPUT_TOOGLE     : std_logic_vector(7 downto 0) := x"12";
    constant CMD_GPIO_OUTPUT_SET        : std_logic_vector(7 downto 0) := x"13";
    constant CMD_GPIO_OUTPUT_CLEAR      : std_logic_vector(7 downto 0) := x"14";
    
    constant CMD_GPIO_INPUT_STATE                       : std_logic_vector(7 downto 0) := x"21";
    constant CMD_GPIO_INPUT_RISING                      : std_logic_vector(7 downto 0) := x"22";
    constant CMD_GPIO_INPUT_FALLING                     : std_logic_vector(7 downto 0) := x"23";
    constant CMD_GPIO_INPUT_RISING_COUNTER              : std_logic_vector(7 downto 0) := x"24";
    constant CMD_GPIO_INPUT_FALLING_COUNTER             : std_logic_vector(7 downto 0) := x"25";

    constant CMD_GPIO_INPUT_RISING_CLEAR                : std_logic_vector(7 downto 0) := x"A1";
    constant CMD_GPIO_INPUT_FALLING_CLEAR               : std_logic_vector(7 downto 0) := x"A2";
    constant CMD_GPIO_INPUT_RISING_COUNTER_CLEAR        : std_logic_vector(7 downto 0) := x"A3";
    constant CMD_GPIO_INPUT_FALLING_COUNTER_CLEAR       : std_logic_vector(7 downto 0) := x"A4";
    constant CMD_GPIO_INPUT_COUNTERs_OR_MASK            : std_logic_vector(7 downto 0) := x"AA";



    type mem is array (0 to 255) of std_logic_vector(7 downto 0);
    signal memory : mem := (others => (others => '0'));

    type FSM_state is (IDLE, WAIT_STATE_1, PREPARATION, READ_DATA, WRITE_DATA, WAIT_STATE_2);
    signal state_reg, next_state : FSM_state;

    signal write_signal : std_logic;
    signal read_signal : std_logic;
    
    signal integer_write_data : integer;
    signal address : std_logic_vector(7 downto 0);

    signal Inputs_Last : std_logic_vector(15 downto 0);

    signal Counter_RF_Input_Last : std_logic;   
    signal Counter_RF_Input : std_logic;

    signal REG_RF_Counter_OR_Mask : std_logic_vector(15 downto 0);
    signal REG_RF_Counter_OR_MaskedInputs : std_logic_vector(15 downto 0);
    signal TMP_OR_Counter_Input : std_logic_vector(15 downto 0);

    signal CLEAR_REG_INPUTs_RISING : std_logic;
    signal CLEAR_REG_INPUTs_FALLING : std_logic;
    signal CLEAR_REG_INPUTs_RISING_COUNTER : std_logic;
    signal CLEAR_REG_INPUTs_FALLING_COUNTER : std_logic;  

    signal REG_INPUTs_RISING : std_logic_vector(15 downto 0);
    signal REG_INPUTs_FALLING : std_logic_vector(15 downto 0);
    signal REG_INPUTs_RISING_COUNTER : unsigned(15 downto 0);
    signal REG_INPUTs_FALLING_COUNTER : unsigned(15 downto 0);  

    signal CLEAR_REG_RF_MASK : std_logic_vector(15 downto 0);



begin

    
    --Counter_RF_Input <= Inputs(0);


    address <= addr_frame; 
    integer_write_data <= to_integer(unsigned(write_data_frame(15 downto 0)));

------------------------------------------------------------------------------------------------------------
--FSM memory ride
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
    process(next_state, state_reg, enable_cmd,write_read)
    begin

        next_state <= state_reg;

        case state_reg is
        
            when IDLE =>
                if(enable_cmd = '1') then
                    next_state <= WAIT_STATE_1;
                end if;
                
            when WAIT_STATE_1 =>
                next_state <= PREPARATION;

            when PREPARATION =>
                if(write_read = '1') then
                    next_state <= READ_DATA;
                else 
                    next_state <= WRITE_DATA;
                end if;

            when READ_DATA =>
                next_state <= WAIT_STATE_2;

            when WRITE_DATA =>
                next_state <= WAIT_STATE_2;
                
            when WAIT_STATE_2 =>
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
                busy            <= '0';
                write_signal    <= '0';
                read_signal     <= '0';
                
            when WAIT_STATE_1 =>
                busy            <= '1';
                write_signal    <= '0';
                read_signal     <= '0'; 

            when PREPARATION =>
                busy            <= '1';
                write_signal    <= '0';
                read_signal     <= '0';            

            when READ_DATA =>
                busy            <= '1';
                write_signal    <= '0';
                read_signal     <= '1';            

            when WRITE_DATA =>
                busy            <= '1';
                write_signal    <= '1';
                read_signal     <= '0';
    
            when WAIT_STATE_2 =>
                busy            <= '1';
                write_signal    <= '0';
                read_signal     <= '0';     

            when others =>
                busy            <= '0';
                write_signal    <= '0';
                read_signal     <= '0';

        end case;

    end process;

------------------------------------------------------------------------------------------------------------
--reads and write registers
------------------------------------------------------------------------------------------------------------

    process(Reset_N, Clock)

    begin
    
        if(Reset_N = '0') then 
            read_data_frame <= (others => '0');
            Outputs <= (others => '0');

            CLEAR_REG_INPUTs_RISING <= '0';
            CLEAR_REG_INPUTs_FALLING <= '0';
            CLEAR_REG_INPUTs_RISING_COUNTER <= '0';
            CLEAR_REG_INPUTs_FALLING_COUNTER <= '0';
            CLEAR_REG_RF_MASK <= (others => '0');


        elsif(Clock'event and Clock = '1') then    
            
            CLEAR_REG_INPUTs_RISING <= '0';
            CLEAR_REG_INPUTs_FALLING <= '0';
            CLEAR_REG_INPUTs_RISING_COUNTER <= '0';
            CLEAR_REG_INPUTs_FALLING_COUNTER <= '0';
            CLEAR_REG_RF_MASK <= (others => '0');

            if(write_signal = '1') then
                
                if(address = CMD_GPIO_OUTPUT_STATE) then
                    Outputs <= write_data_frame;

                elsif(address = CMD_GPIO_OUTPUT_TOOGLE) then  --toogle
                    Outputs <= Outputs xor write_data_frame;

                elsif(address = CMD_GPIO_OUTPUT_SET) then   --set
                    Outputs <= Outputs OR write_data_frame;

                elsif(address = CMD_GPIO_OUTPUT_CLEAR) then   --reset
                    Outputs <= Outputs AND  (not write_data_frame);
                    
                elsif(address = CMD_GPIO_INPUT_RISING_CLEAR) then
                    CLEAR_REG_INPUTs_RISING <= '1';
                    CLEAR_REG_RF_MASK <= write_data_frame;

                elsif(address = CMD_GPIO_INPUT_FALLING_CLEAR) then
                    CLEAR_REG_INPUTs_FALLING <= '1';
                    CLEAR_REG_RF_MASK <= write_data_frame;

                elsif(address = CMD_GPIO_INPUT_RISING_COUNTER_CLEAR) then
                    CLEAR_REG_INPUTs_RISING_COUNTER <= '1';

                elsif(address = CMD_GPIO_INPUT_FALLING_COUNTER_CLEAR) then
                    CLEAR_REG_INPUTs_FALLING_COUNTER <= '1';

                elsif(address = CMD_GPIO_INPUT_COUNTERs_OR_MASK) then 
                    REG_RF_Counter_OR_Mask <= write_data_frame;

                end if;


            elsif(read_signal = '1') then
                
                if(address = CMD_GPIO_OUTPUT_STATE) then
                    read_data_frame <= Outputs;

                elsif(address = CMD_GPIO_INPUT_STATE) then
                    read_data_frame <= Inputs;

                elsif(address = CMD_GPIO_INPUT_RISING) then
                    read_data_frame <= REG_INPUTs_RISING;

                elsif(address = CMD_GPIO_INPUT_FALLING) then
                    read_data_frame <= REG_INPUTs_FALLING;

                elsif(address = CMD_GPIO_INPUT_RISING_COUNTER) then
                    read_data_frame <= std_logic_vector(REG_INPUTs_RISING_COUNTER);

                elsif(address = CMD_GPIO_INPUT_FALLING_COUNTER) then
                    read_data_frame <= std_logic_vector(REG_INPUTs_FALLING_COUNTER);
                       
                else
                    read_data_frame <= (others => '0');

                end if;
                
                
            end if;


        end if;

    end process;


------------------------------------------------------------------------------------------------------------
--edges detection
------------------------------------------------------------------------------------------------------------
    process(Reset_N, Clock)

    begin
    
        if(Reset_N = '0') then 
            REG_INPUTs_RISING <= (others => '0');
            REG_INPUTs_FALLING <= (others => '0');
            Inputs_Last <= (others => '0');

        elsif(Clock'event and Clock = '1') then    
            
            if(CLEAR_REG_INPUTs_RISING = '1') then
                --REG_INPUTs_RISING <= (others => '0');
                REG_INPUTs_RISING <= REG_INPUTs_RISING AND  (not CLEAR_REG_RF_MASK);

            else

                Rising_Edge_Detector : for i in 0 to (16 - 1) loop
          
                    if( Inputs(i) = '1' and Inputs_Last(i) = '0' ) then
                        REG_INPUTs_RISING(i) <= '1';
                    end if;

                end loop Rising_Edge_Detector;

            end if;


            if(CLEAR_REG_INPUTs_FALLING = '1') then
                --REG_INPUTs_FALLING <= (others => '0');
                REG_INPUTs_FALLING <= REG_INPUTs_FALLING AND  (not CLEAR_REG_RF_MASK);

            else

                Falling_Edge_Detector : for i in 0 to (16 - 1) loop

                    if( Inputs(i) = '0' and Inputs_Last(i) = '1' ) then
                        REG_INPUTs_FALLING(i) <= '1';
                    end if;

                end loop Falling_Edge_Detector;

            end if;
      

            Inputs_Last <= Inputs;

        end if;

    end process;



------------------------------------------------------------------------------------------------------------
--counters
------------------------------------------------------------------------------------------------------------
    process(Reset_N, Clock)

    begin
    
        if(Reset_N = '0') then 
            Counter_RF_Input_Last <= '0';
            REG_INPUTs_RISING_COUNTER <= (others => '0');
            REG_INPUTs_FALLING_COUNTER <= (others => '0');

        elsif(Clock'event and Clock = '1') then    
            
            if(CLEAR_REG_INPUTs_RISING_COUNTER = '1') then
                REG_INPUTs_RISING_COUNTER <= (others => '0');

            elsif(Counter_RF_Input = '1' and Counter_RF_Input_Last = '0') then
                REG_INPUTs_RISING_COUNTER <= REG_INPUTs_RISING_COUNTER + 1; 

            end if;


            if(CLEAR_REG_INPUTs_FALLING_COUNTER = '1') then
                REG_INPUTs_FALLING_COUNTER <= (others => '0');

            elsif(Counter_RF_Input = '0' and Counter_RF_Input_Last = '1') then
                REG_INPUTs_FALLING_COUNTER <= REG_INPUTs_FALLING_COUNTER + 1; 

            end if;
      

            Counter_RF_Input_Last <= Counter_RF_Input;

        end if;

    end process;


------------------------------------------------------------------------------------------------------------
--counters input masked OR function
------------------------------------------------------------------------------------------------------------
    process(Reset_N, Clock)

    begin
    
        if(Reset_N = '0') then 
            Counter_RF_Input <= '0';
            REG_RF_Counter_OR_MaskedInputs <= (others => '0');

        elsif(Clock'event and Clock = '1') then    
            --Counter_RF_Input <= Inputs(0);

            REG_RF_Counter_OR_MaskedInputs <= Inputs and REG_RF_Counter_OR_Mask;

            TMP_OR_Counter_Input(0) <= REG_RF_Counter_OR_MaskedInputs(0);
            OR_counter_input : for i in 1 to (16 - 1) loop
                TMP_OR_Counter_Input(i) <= TMP_OR_Counter_Input(i - 1) or REG_RF_Counter_OR_MaskedInputs(i);
            end loop OR_counter_input;

            Counter_RF_Input <= TMP_OR_Counter_Input(16 - 1);

        end if;

    end process;





end rtl;