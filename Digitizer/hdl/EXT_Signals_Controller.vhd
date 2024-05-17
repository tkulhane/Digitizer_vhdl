library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity EXT_Signals_Controller is
    generic 
    (
        g_NumOfSelectedInputs   : natural := 16;
        g_NumOfSelectedOutputs  : natural := 10;
        g_SelectNumWidth   : natural := 8
    );
    port 
    (
        Clock : in std_logic;
        Reset_N : in std_logic;

        busy : out std_logic;
        enable_cmd : in std_logic;
        write_read : in std_logic;
        addr_frame : in std_logic_vector(7 downto 0);
        write_data_frame : in std_logic_vector(15 downto 0);
        read_data_frame : out std_logic_vector(15 downto 0);

        EXT_OutputEnable : out std_logic_vector(g_NumOfSelectedOutputs - 1 downto 0);
        EXT_SelectOutput : out std_logic_vector(g_SelectNumWidth * g_NumOfSelectedOutputs - 1 downto 0);
        EXT_SelectInput : out std_logic_vector(g_SelectNumWidth * g_NumOfSelectedInputs - 1 downto 0)


        

    );
end EXT_Signals_Controller;



architecture rtl of EXT_Signals_Controller is

------------------------------------------------------------------------------------------------------------
--constant
------------------------------------------------------------------------------------------------------------ 
    
    constant CMD_EXT_SIGNALS_ADDR_BASE_INPUTS_SEL           : natural := 10;
    constant CMD_EXT_SIGNALS_ADDR_BASE_OUTPUTS_SEL          : natural := 110;
    constant CMD_EXT_SIGNALS_ADDR_BASE_OUTPUTS_ENABLE       : std_logic_vector := x"6D";
    

 
 

------------------------------------------------------------------------------------------------------------
--Signals declaration
------------------------------------------------------------------------------------------------------------ 

    type FSM_state is (IDLE, WAIT_STATE_1, PREPARATION, READ_DATA, WRITE_DATA, WAIT_STATE_2);
    signal state_reg, next_state : FSM_state;

    signal write_signal : std_logic;
    signal read_signal : std_logic;
    signal address : std_logic_vector(7 downto 0);



    type type_EXT_SelectInput_vector_array is array(0 to (g_NumOfSelectedInputs - 1)) of std_logic_vector(g_SelectNumWidth - 1 downto 0);
    signal EXT_SelectInput_vector : type_EXT_SelectInput_vector_array;

    type type_EXT_SelectOutput_vector_array is array(0 to (g_NumOfSelectedOutputs - 1)) of std_logic_vector(g_SelectNumWidth - 1 downto 0);
    signal EXT_SelectOutput_vector : type_EXT_SelectOutput_vector_array;


    signal EXT_OutputEnable_REG : std_logic_vector(g_NumOfSelectedOutputs - 1 downto 0);



------------------------------------------------------------------------------------------------------------
--Components
------------------------------------------------------------------------------------------------------------ 




begin

------------------------------------------------------------------------------------------------------------
--Signals routing
------------------------------------------------------------------------------------------------------------  

    address <= addr_frame; 



    SelectedInputs_GEN : for i in 0 to (g_NumOfSelectedInputs - 1) generate
        EXT_SelectInput( ((i*g_SelectNumWidth) + (g_SelectNumWidth-1)) downto (i*8) ) <= EXT_SelectInput_vector(i);
    end generate SelectedInputs_GEN;

    SelectedOutputs_GEN : for i in 0 to (g_NumOfSelectedOutputs - 1) generate
        EXT_SelectOutput( ((i*g_SelectNumWidth) + (g_SelectNumWidth-1)) downto (i*8) ) <= EXT_SelectOutput_vector(i);
    end generate SelectedOutputs_GEN;


    EXT_OutputEnable <= EXT_OutputEnable_REG;


------------------------------------------------------------------------------------------------------------
--FSM CMD ride
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

            SelectedInputsResetFor : for i in 0 to (g_NumOfSelectedInputs - 1) loop
                EXT_SelectInput_vector(i) <= (others => '0');
            end loop SelectedInputsResetFor;

            SelectedOutputsResetFor : for i in 0 to (g_NumOfSelectedOutputs - 1) loop
                EXT_SelectOutput_vector(i) <= (others => '0');
            end loop SelectedOutputsResetFor;
            


        elsif(Clock'event and Clock = '1') then    
            
            --write from CMD
            if(write_signal = '1') then

                if( (address >=  std_logic_vector(to_unsigned( CMD_EXT_SIGNALS_ADDR_BASE_INPUTS_SEL, 8)))  and (address <= std_logic_vector(to_unsigned((CMD_EXT_SIGNALS_ADDR_BASE_INPUTS_SEL + g_NumOfSelectedInputs  ), 8))) ) then

                    SelectedInputsWriteFor : for i in 0 to (g_NumOfSelectedInputs - 1) loop

                        if(address = std_logic_vector(to_unsigned((CMD_EXT_SIGNALS_ADDR_BASE_INPUTS_SEL + i), 8 ))) then
                            EXT_SelectInput_vector(i) <= write_data_frame(7 downto 0);

                        else
                            null;

                        end if;

                    end loop SelectedInputsWriteFor;

                elsif( (address >=  std_logic_vector(to_unsigned( CMD_EXT_SIGNALS_ADDR_BASE_OUTPUTS_SEL, 8)))  and (address <= std_logic_vector(to_unsigned((CMD_EXT_SIGNALS_ADDR_BASE_OUTPUTS_SEL + g_NumOfSelectedOutputs  ), 8))) ) then

                    SelectedOutputsWriteFor : for i in 0 to (g_NumOfSelectedOutputs - 1) loop

                        if(address = std_logic_vector(to_unsigned((CMD_EXT_SIGNALS_ADDR_BASE_OUTPUTS_SEL + i), 8 ))) then
                            EXT_SelectOutput_vector(i) <= write_data_frame(7 downto 0);

                        else
                            null;

                        end if;

                    end loop SelectedOutputsWriteFor;

                else
                    case(address) is

                        when CMD_EXT_SIGNALS_ADDR_BASE_OUTPUTS_ENABLE =>
                            EXT_OutputEnable_REG <= write_data_frame(g_NumOfSelectedOutputs - 1 downto 0);

                        when others =>
                            null;

                    end case;

                end if;


            --read from CMD
            elsif(read_signal = '1') then
                
                read_data_frame <= (others => '0');

                if( (address >=  std_logic_vector(to_unsigned( CMD_EXT_SIGNALS_ADDR_BASE_INPUTS_SEL, 8)))  and (address <= std_logic_vector(to_unsigned((CMD_EXT_SIGNALS_ADDR_BASE_INPUTS_SEL + g_NumOfSelectedInputs  ), 8))) ) then

                    SelectedInputsReadFor : for i in 0 to (g_NumOfSelectedInputs - 1) loop

                        if(address = std_logic_vector(to_unsigned((CMD_EXT_SIGNALS_ADDR_BASE_INPUTS_SEL + i), 8 ))) then
                            read_data_frame(7 downto 0) <= EXT_SelectInput_vector(i);

                        else
                            null;

                        end if;

                    end loop SelectedInputsReadFor;

                elsif( (address >=  std_logic_vector(to_unsigned( CMD_EXT_SIGNALS_ADDR_BASE_OUTPUTS_SEL, 8)))  and (address <= std_logic_vector(to_unsigned((CMD_EXT_SIGNALS_ADDR_BASE_OUTPUTS_SEL + g_NumOfSelectedOutputs  ), 8))) ) then

                    SelectedOutputsReadFor : for i in 0 to (g_NumOfSelectedOutputs - 1) loop

                        if(address = std_logic_vector(to_unsigned((CMD_EXT_SIGNALS_ADDR_BASE_OUTPUTS_SEL + i), 8 ))) then
                            read_data_frame(7 downto 0) <= EXT_SelectOutput_vector(i);

                        else
                            null;

                        end if;

                    end loop SelectedOutputsReadFor;

                else
                    
                    case(address) is

                        when CMD_EXT_SIGNALS_ADDR_BASE_OUTPUTS_ENABLE =>
                            read_data_frame(g_NumOfSelectedOutputs - 1 downto 0) <= EXT_OutputEnable_REG;

                        when others =>
                            null;

                    end case;

                --case(address) is

                --    when CMD_EXT_SIGNALS_SEL_CH0 => 
                --        read_data_frame(7 downto 0) <= REG_EXT_SelectSwitch_ch0;
                
                --    when others =>
                --        null;

                --end case;

                end if;



            end if;

        end if;

    end process;









end rtl;