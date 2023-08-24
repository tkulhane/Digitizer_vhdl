library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Reset_Controler is
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

        SYS_Main_Reset_N : out std_logic;

        EXT_ADC_Reset_N : out std_logic;
        EXT_HMC_Reset_N : out std_logic;
        EXT_LMX1_Reset_N : out std_logic;
        EXT_LMX2_Reset_N : out std_logic;

        INT_DataFifo_Reset_N : out std_logic;
        INT_FtdiReset_N : out std_logic;

        
        Diag_Valid : out std_logic
    
    );
end Reset_Controler;


architecture rtl of Reset_Controler is

    constant WORDDATA_Main_Reset        : std_logic_vector(15 downto 0) := x"ABCD";

    constant CMD_RST_Main_Reset         : std_logic_vector(7 downto 0) := x"55";
    constant CMD_RST_Clear_ALL          : std_logic_vector(7 downto 0) := x"01";
    
    constant CMD_RST_EXT_State          : std_logic_vector(7 downto 0) := x"11";
    constant CMD_RST_EXT_SET            : std_logic_vector(7 downto 0) := x"12";
    constant CMD_RST_EXT_CLR            : std_logic_vector(7 downto 0) := x"13";
    constant CMD_RST_EXT_PULSE          : std_logic_vector(7 downto 0) := x"14";

    constant CMD_RST_INT_State          : std_logic_vector(7 downto 0) := x"21";
    constant CMD_RST_INT_SET            : std_logic_vector(7 downto 0) := x"22";
    constant CMD_RST_INT_CLR            : std_logic_vector(7 downto 0) := x"23";
    constant CMD_RST_INT_PULSE          : std_logic_vector(7 downto 0) := x"24";

    constant CMD_RST_PULSE_LENGTH       : std_logic_vector(7 downto 0) := x"05";


    constant NUM_RST_EXT_ADC            : Natural := 0;
    constant NUM_RST_EXT_HMC            : Natural := 1;
    constant NUM_RST_EXT_LMX1           : Natural := 2;
    constant NUM_RST_EXT_LMX2           : Natural := 3;

    constant NUM_RST_INT_DataFifo       : Natural := 0;
    constant NUM_RST_INT_Ftdi           : Natural := 1;

    

------------------------------------------------------------------------------------------------------------
--Signals Declaration
------------------------------------------------------------------------------------------------------------ 
    type FSM_state is (IDLE, WAIT_STATE_1, PREPARATION, READ_DATA, WRITE_DATA, WAIT_STATE_2);
    signal state_reg, next_state : FSM_state;

    signal write_signal : std_logic;
    signal read_signal : std_logic;

    signal internal_write_signal : std_logic;
    
    --signal address : integer;
    signal address : std_logic_vector(7 downto 0);

    signal REG_EXT_Resets : std_logic_vector(15 downto 0);
    signal REG_INT_Resets : std_logic_vector(15 downto 0);

    signal CLEAR_PULSE_EXT : std_logic;
    signal CLEAR_PULSE_INT : std_logic;

    signal SET_PULSE_EXT : std_logic;
    signal SET_PULSE_INT : std_logic;
    signal PULSE_EXT_Mask : std_logic_vector(15 downto 0);
    signal PULSE_INT_Mask : std_logic_vector(15 downto 0);
    signal PULSE_LENGTH : unsigned (15 downto 0);

    signal Counter_EXT_PULSE : unsigned (15 downto 0);
    signal Counter_INT_PULSE : unsigned (15 downto 0);

begin

------------------------------------------------------------------------------------------------------------
--resets output assing
------------------------------------------------------------------------------------------------------------

    EXT_ADC_Reset_N         <= Reset_N and (not REG_EXT_Resets(NUM_RST_EXT_ADC));
    EXT_HMC_Reset_N         <= Reset_N and (not REG_EXT_Resets(NUM_RST_EXT_HMC));
    EXT_LMX1_Reset_N        <= Reset_N and (not REG_EXT_Resets(NUM_RST_EXT_LMX1));
    EXT_LMX2_Reset_N        <= Reset_N and (not REG_EXT_Resets(NUM_RST_EXT_LMX2));

    INT_DataFifo_Reset_N    <= Reset_N and (not REG_INT_Resets(NUM_RST_INT_DataFifo));
    INT_FtdiReset_N         <= not REG_INT_Resets(NUM_RST_INT_Ftdi);





    --address <= to_integer(unsigned(addr_frame(7 downto 0)));
    address <= addr_frame;

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

            SYS_Main_Reset_N <= '1';
            REG_EXT_Resets <= (others => '0');
            REG_INT_Resets <= (others => '0');

            SET_PULSE_EXT <= '0';
            SET_PULSE_INT <= '0';
            PULSE_EXT_Mask <= (others => '0');
            PULSE_INT_Mask <= (others => '0');
            PULSE_LENGTH <= x"0064";


        elsif(Clock'event and Clock = '1') then    
            
            if(CLEAR_PULSE_EXT = '1') then
                REG_EXT_Resets <= REG_EXT_Resets AND  (not PULSE_EXT_Mask);
                SET_PULSE_EXT <= '0';
            end if;

            if(CLEAR_PULSE_INT = '1') then 
                REG_INT_Resets <= REG_INT_Resets AND  (not PULSE_INT_Mask);
                SET_PULSE_INT <= '0';
            end if;


            if(write_signal = '1') then
                
                case(address) is

                    when CMD_RST_Main_Reset => 
                        if(write_data_frame = WORDDATA_Main_Reset) then
                            SYS_Main_Reset_N <= '0';
                        end if;

                    when CMD_RST_Clear_ALL => 
                        REG_EXT_Resets <= (others => '0');
                        REG_INT_Resets <= (others => '0');
                        

                    when CMD_RST_EXT_State =>
                        REG_EXT_Resets <= write_data_frame;

                    when CMD_RST_EXT_SET =>
                        REG_EXT_Resets <= REG_EXT_Resets OR write_data_frame;

                    when CMD_RST_EXT_CLR =>
                        REG_EXT_Resets <= REG_EXT_Resets AND  (not write_data_frame);

                    when CMD_RST_EXT_PULSE =>
                        if(SET_PULSE_EXT = '0') then 
                            REG_EXT_Resets <= REG_EXT_Resets OR write_data_frame;
                            PULSE_EXT_Mask <= write_data_frame;
                            SET_PULSE_EXT <= '1';
                        end if;


                    when CMD_RST_INT_State =>
                        REG_INT_Resets <= write_data_frame;

                    when CMD_RST_INT_SET =>
                        REG_INT_Resets <= REG_INT_Resets  OR write_data_frame;

                    when CMD_RST_INT_CLR =>
                        REG_INT_Resets <= REG_INT_Resets AND  (not write_data_frame);

                    when CMD_RST_INT_PULSE =>
                        if(SET_PULSE_INT = '0') then 
                            REG_INT_Resets <= REG_INT_Resets  OR write_data_frame;
                            PULSE_INT_Mask <= write_data_frame;
                            SET_PULSE_INT <= '1';
                        end if;


                    when CMD_RST_PULSE_LENGTH =>
                        PULSE_LENGTH <= unsigned(write_data_frame); 
                        
                    
                    when others =>
                        null;

                end case;



            elsif(read_signal = '1') then
                

                case(address) is

                    when CMD_RST_Main_Reset => 
                        read_data_frame <= WORDDATA_Main_Reset;
                        
                    when CMD_RST_EXT_State =>
                        read_data_frame <= REG_EXT_Resets;

                    when CMD_RST_INT_State =>
                        read_data_frame <= REG_INT_Resets;

                    when CMD_RST_PULSE_LENGTH =>
                        read_data_frame <= std_logic_vector(PULSE_LENGTH);
                    
                    when others =>
                        read_data_frame <= (others => '0');

                end case;


                
                
            end if;


        end if;

    end process;



------------------------------------------------------------------------------------------------------------
--counter ext pulse
------------------------------------------------------------------------------------------------------------
    process(Reset_N, Clock)

    begin
    
        if(Reset_N = '0') then 
            Counter_EXT_PULSE <= (others => '0');
            CLEAR_PULSE_EXT <= '0';

        elsif(Clock'event and Clock = '1') then    
            
            if(SET_PULSE_EXT = '1') then --zapnuti citace generovani pulsu

                if(Counter_EXT_PULSE >= PULSE_LENGTH) then --puls dosahl pozadovane delky
                    CLEAR_PULSE_EXT <= '1';                 --nastave clear resetu

                else
                    Counter_EXT_PULSE <= Counter_EXT_PULSE + 1;

                end if;                       

            else
                CLEAR_PULSE_EXT <= '0';
                Counter_EXT_PULSE <= (others => '0');

            end if;




        end if;

    end process;

------------------------------------------------------------------------------------------------------------
--counter int pulse
------------------------------------------------------------------------------------------------------------
    process(Reset_N, Clock)

    begin
    
        if(Reset_N = '0') then 
            Counter_INT_PULSE <= (others => '0');
            CLEAR_PULSE_INT <= '0';

        elsif(Clock'event and Clock = '1') then    
            
            if(SET_PULSE_INT = '1') then --zapnuti citace generovani pulsu

                if(Counter_INT_PULSE >= PULSE_LENGTH) then --puls dosahl pozadovane delky
                    CLEAR_PULSE_INT <= '1';                 --nastave clear resetu

                else
                    Counter_INT_PULSE <= Counter_INT_PULSE + 1;

                end if;                       

            else
                CLEAR_PULSE_INT <= '0';
                Counter_INT_PULSE <= (others => '0');

            end if;




        end if;

    end process;







end rtl;