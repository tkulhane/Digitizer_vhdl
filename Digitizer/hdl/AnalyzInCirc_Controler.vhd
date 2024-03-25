library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity AnalyzInCirc_Controler is
    generic
    (
        g_NumFifoDataIn : natural := 2
    );
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

        Start_Triggers : in std_logic_vector(7 downto 0);
        
        Fifo_Data : in std_logic_vector((g_NumFifoDataIn * 12) - 1 downto 0);
        
        Fifo_Write_Enable : out std_logic;
        Fifo_Read_Enable : out std_logic_vector(g_NumFifoDataIn - 1 downto 0);

        Fifo_Empty : in std_logic_vector(g_NumFifoDataIn - 1 downto 0);
        Fifo_Full : in std_logic_vector(g_NumFifoDataIn - 1 downto 0);
        Fifo_Clear : out std_logic

    
    );
end AnalyzInCirc_Controler;


architecture rtl of AnalyzInCirc_Controler is

    
    constant CMD_ANALYZINCIRC_ENABLE                : std_logic_vector(7 downto 0) := x"01";
    constant CMD_ANALYZINCIRC_CLEAR                 : std_logic_vector(7 downto 0) := x"02";
    constant CMD_ANALYZINCIRC_NUMBER_OF_SAMPLES     : std_logic_vector(7 downto 0) := x"03";
    constant CMD_ANALYZINCIRC_TRIGGERS_MASK_RISING  : std_logic_vector(7 downto 0) := x"04";
    constant CMD_ANALYZINCIRC_TRIGGERS_MASK_FALLING : std_logic_vector(7 downto 0) := x"05";
    constant CMD_ANALYZINCIRC_TRG_START             : std_logic_vector(7 downto 0) := x"06";
    
    constant CMD_ANALYZINCIRC_STATE                 : std_logic_vector(7 downto 0) := x"11";
    constant CMD_ANALYZINCIRC_EMPTY                 : std_logic_vector(7 downto 0) := x"12";
    


    constant CMD_ANALYZINCIRC_FIFO_DATA_BASE      : natural :=  100;
    --constant CMD_ANALYZINCIRC_FIFO_DATA_BASE        : std_logic_vector(7 downto 0) := x"A0";




    type mem is array (0 to 255) of std_logic_vector(7 downto 0);
    signal memory : mem := (others => (others => '0'));

    type FSM_state is (IDLE, WAIT_STATE_1, PREPARATION, READ_DATA, WRITE_DATA, WAIT_STATE_2);
    signal state_reg, next_state : FSM_state;

    signal write_signal : std_logic;
    signal read_signal : std_logic;
    
    signal integer_write_data : integer;
    signal address : std_logic_vector(7 downto 0);



    type type_FifoData_vector_array is array(0 to (g_NumFifoDataIn - 1)) of std_logic_vector(11 downto 0);
    signal FifoData_Array : type_FifoData_vector_array;

    signal REG_TRG_Start : std_logic;
    signal REG_Enable : std_logic;
    signal REG_NumOfSamples : std_logic_vector(15 downto 0);
    signal REG_Clear : std_logic;

    signal REG_TriggerMask_Rising : std_logic_vector(15 downto 0);
    signal REG_TriggerMask_Falling : std_logic_vector(15 downto 0);

    signal Run : std_logic;
    signal Internal_Enable_Reset : std_logic;

    signal REG_State : std_logic_vector(15 downto 0);

    signal OR_Fifo_Empty : std_logic;
    signal OR_Fifo_Full : std_logic;


    signal Trg : std_logic;

    signal Triggers_Vector_Rising :  std_logic_vector(7 downto 0);
    signal Triggers_Vector_Falling :  std_logic_vector(7 downto 0);
    signal Start_Triggers_Last :  std_logic_vector(7 downto 0);





begin



    address <= addr_frame; 
    integer_write_data <= to_integer(unsigned(write_data_frame(15 downto 0)));



    StatusArrayComplete_GEN : for i in 0 to (g_NumFifoDataIn - 1) generate
        FifoData_Array(i)     <= Fifo_Data( ((i*12) + 11) downto (i*12) ); -- 31 downto 0; 63 downto 32
    
    end generate StatusArrayComplete_GEN;

    Fifo_Write_Enable <= Run; 

    OR_Fifo_Empty <= OR Fifo_Empty;
    OR_Fifo_Full <= OR Fifo_Full;

    Fifo_Clear <= REG_Clear;




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
--write registers
------------------------------------------------------------------------------------------------------------

    process(Reset_N, Clock)

    begin
    
        if(Reset_N = '0') then 

            REG_Enable <= '0';
            REG_NumOfSamples <= (others => '0');
            REG_TriggerMask_Rising <= (others => '0');
            REG_TriggerMask_Falling <= (others => '0');
            REG_Clear <= '0';


        elsif(Clock'event and Clock = '1') then    
            
            REG_Clear <= '0';
            REG_TRG_Start <= '0';

            if(Internal_Enable_Reset = '1') then
                REG_Enable <= '0';
            end if;

            if(write_signal = '1') then
                
                if(address = CMD_ANALYZINCIRC_ENABLE) then
                    REG_Enable <= write_data_frame(0);

                elsif(address = CMD_ANALYZINCIRC_CLEAR) then
                    REG_Enable <= '0';
                    REG_Clear <= '1';
 
                elsif(address = CMD_ANALYZINCIRC_NUMBER_OF_SAMPLES) then
                    REG_NumOfSamples <= write_data_frame;
                    
                elsif(address = CMD_ANALYZINCIRC_TRIGGERS_MASK_RISING) then
                    REG_TriggerMask_Rising <= write_data_frame;

                elsif(address = CMD_ANALYZINCIRC_TRIGGERS_MASK_FALLING) then
                    REG_TriggerMask_Falling <= write_data_frame;

                elsif(address = CMD_ANALYZINCIRC_TRG_START) then
                    REG_TRG_Start <= write_data_frame(0);

               
                end if;


            end if;


        end if;

    end process;




------------------------------------------------------------------------------------------------------------
--read registers
------------------------------------------------------------------------------------------------------------

    process(Reset_N, Clock)

    begin
    
        if(Reset_N = '0') then 
            read_data_frame <= (others => '0');
            Fifo_Read_Enable <= (others => '0');


        elsif(Clock'event and Clock = '1') then 

            Fifo_Read_Enable <= (others => '0');

            if(read_signal = '1') then

                read_data_frame <= (others => '0');   

                
                if(address = CMD_ANALYZINCIRC_ENABLE) then
                    read_data_frame <= "000000000000000" & REG_Enable;

                elsif(address = CMD_ANALYZINCIRC_NUMBER_OF_SAMPLES) then
                    read_data_frame <= REG_NumOfSamples; 
                    
                elsif(address = CMD_ANALYZINCIRC_TRIGGERS_MASK_RISING) then
                    read_data_frame <= REG_TriggerMask_Rising;

                elsif(address = CMD_ANALYZINCIRC_TRIGGERS_MASK_FALLING) then
                    read_data_frame <= REG_TriggerMask_Falling;

                elsif(address = CMD_ANALYZINCIRC_STATE) then
                    read_data_frame <= REG_State;

                elsif(address = CMD_ANALYZINCIRC_EMPTY) then
                    read_data_frame <= "000000000000000" & OR_Fifo_Empty;



                elsif( (address >=  std_logic_vector(to_unsigned( CMD_ANALYZINCIRC_FIFO_DATA_BASE, 8)))  and (address <= std_logic_vector(to_unsigned((CMD_ANALYZINCIRC_FIFO_DATA_BASE + (1 * g_NumFifoDataIn) ), 8))) ) then

                    LaneStatusArrayFor : for i in 0 to (g_NumFifoDataIn - 1) loop

                        if( address = std_logic_vector(to_unsigned( CMD_ANALYZINCIRC_FIFO_DATA_BASE + i, 8)) ) then
                            
                            if(Fifo_Empty(i) = '0') then
                                read_data_frame(15 downto 12) <= "0100";
                                read_data_frame(11 downto 0) <= FifoData_Array(i);
                                Fifo_Read_Enable(i) <= '1';

                            else
                                read_data_frame(15 downto 12) <= "1000";
                                read_data_frame(11 downto 0) <= (others => '0');

                            end if;
                            
                        end if;

                    end loop LaneStatusArrayFor;

                else
                    read_data_frame <= (others => '0');

                end if;
                
                
            end if;


        end if;

    end process;



------------------------------------------------------------------------------------------------------------
--enable control
------------------------------------------------------------------------------------------------------------
    --state memory and reset
    process(Reset_N,Clock)

        variable Sample_Counter : unsigned(15 downto 0) := (others => '0');

    begin

        if(Reset_N = '0') then

            Sample_Counter := (others => '0');
            Run <= '0';
            Internal_Enable_Reset <= '0';
            
        
        elsif(Clock'event and Clock = '1') then
            
            if(Run = '1') then

                Sample_Counter := Sample_Counter + 1;


                --stop request
                if(Sample_Counter >= unsigned(REG_NumOfSamples)) then
                    Run <= '0';
                    Internal_Enable_Reset <= '1';

                elsif(OR_Fifo_Full = '1') then
                    Run <= '0';
                    Internal_Enable_Reset <= '1';

                end if;

            else

                --trigger signal
                if(Trg = '1' and REG_Enable = '1' and Internal_Enable_Reset = '0') then
                    Sample_Counter := (others => '0');
                    Run <= '1';
                end if;

                Internal_Enable_Reset <= '0';

            end if;

        end if;
    end process;


------------------------------------------------------------------------------------------------------------
--trigger edges detection
------------------------------------------------------------------------------------------------------------
    process(Reset_N,Clock)
    begin

        if(Reset_N = '0') then
            Triggers_Vector_Rising <= (others => '0');
            Triggers_Vector_Falling <= (others => '0');

        elsif(Clock'event and Clock = '1') then
            
            Rising_Edge_Detector : for i in 0 to (8 - 1) loop
                if( Start_Triggers(i) = '1' and Start_Triggers_Last(i) = '0' ) then
                    Triggers_Vector_Rising(i) <= '1';
                else
                    Triggers_Vector_Rising(i) <= '0';
                end if;
            end loop Rising_Edge_Detector;


            Falling_Edge_Detector : for i in 0 to (8 - 1) loop
                if( Start_Triggers(i) = '0' and Start_Triggers_Last(i) = '1' ) then
                    Triggers_Vector_Falling(i) <= '1';
                else
                    Triggers_Vector_Falling(i) <= '0';
                end if;
            end loop Falling_Edge_Detector;



            Start_Triggers_Last <= Start_Triggers;

        end if;

    end process;

------------------------------------------------------------------------------------------------------------
--trigger signal or
------------------------------------------------------------------------------------------------------------
    Trg <=  (or (Triggers_Vector_Rising and REG_TriggerMask_Rising(7 downto 0)))  or
            (or (Triggers_Vector_Falling and REG_TriggerMask_Falling(7 downto 0))) or
            REG_TRG_Start;



end rtl;