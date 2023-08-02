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

    type mem is array (0 to 255) of std_logic_vector(7 downto 0);
    signal memory : mem := (others => (others => '0'));

    type FSM_state is (IDLE, WAIT_STATE_1, PREPARATION, READ_DATA, WRITE_DATA, WAIT_STATE_2);
    signal state_reg, next_state : FSM_state;

    signal write_signal : std_logic;
    signal read_signal : std_logic;
    
    signal integer_write_data : integer;
    signal address : std_logic_vector(7 downto 0);

begin

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
--inputs/outputs
------------------------------------------------------------------------------------------------------------

    process(Reset_N, Clock)

    begin
    
        if(Reset_N = '0') then 
            read_data_frame <= (others => '0');
            Outputs <= (others => '0');

        elsif(Clock'event and Clock = '1') then    
            
            if(write_signal = '1') then
                
                if(address = x"11") then
                    Outputs <= write_data_frame;

                elsif(address = x"12") then  --toogle
                    Outputs <= Outputs xor write_data_frame;

                elsif(address = x"13") then   --set
                    Outputs <= Outputs OR write_data_frame;

                elsif(address = x"14") then   --reset
                    Outputs <= Outputs AND  (not write_data_frame);
                
                end if;


            elsif(read_signal = '1') then
                
                if(address = x"11") then
                    read_data_frame <= Outputs;

                elsif(address = x"21") then
                    read_data_frame <= Inputs;
                       
                else
                    read_data_frame <= (others => '0');

                end if;
                
                

                
            end if;

        end if;

    end process;


end rtl;