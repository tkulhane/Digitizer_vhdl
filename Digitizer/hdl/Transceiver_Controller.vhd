library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Transceiver_Controller is
    generic
    (
        g_NumberOfLanes : natural := 16
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

        Lanes_Restart : out std_logic;

        StatusLanes_Vector : in std_logic_vector((g_NumberOfLanes * 32) - 1 downto 0)


    );
end Transceiver_Controller;



architecture rtl of Transceiver_Controller is

------------------------------------------------------------------------------------------------------------
--constant
------------------------------------------------------------------------------------------------------------ 
    
    
    -- Base adress 50 (0x32)
    --ADDR OFFSET: 0 (0x00) - reserved 0
    --ADDR OFFSET: 1 (0x01) - Alligment Fifo Count
    --ADDR OFFSET: 2 (0x02) - XCVR states
    --ADDR OFFSET: 3 (0x03) - Fifos states
    --ADDR OFFSET: 4 (0x04) - XCVR states - Rising Edge detect
    --ADDR OFFSET: 5 (0x05) - Fifos states - Rising Edge detect
    --ADDR OFFSET: 6 (0x06) - XCVR states - Falling Edge detect
    --ADDR OFFSET: 7 (0x07) - Fifos states - Falling Edge detect
    --ADDR OFFSET: 8 (0x08) - reserved 8
    --ADDR OFFSET: 9 (0x09) - reserved 9
    
    constant ADDR_BASE_LanesStatus      : natural := 10;
    constant ADDR_Reserved_0            : natural := 0;
    constant ADDR_AlligmentFifoCount    : natural := 1;
    constant ADDR_XCVR                  : natural := 2;
    constant ADDR_FIFO                  : natural := 3;
    constant ADDR_XCVR_RisingE          : natural := 4;
    constant ADDR_FIFO_RisingE          : natural := 5;
    constant ADDR_XCVR_Falling          : natural := 6;
    constant ADDR_FIFO_FallingE         : natural := 7;
    constant ADDR_Reserved_8            : natural := 8;
    constant ADDR_Reserved_9            : natural := 9;


    constant CMD_TRNV_GENERAL_STATUS    : std_logic_vector(7 downto 0) := x"00";
    constant CMD_TRNV_LANES_RESTART     : std_logic_vector(7 downto 0) := x"01";
 
 

------------------------------------------------------------------------------------------------------------
--Signals declaration
------------------------------------------------------------------------------------------------------------ 

    type FSM_state is (IDLE, WAIT_STATE_1, PREPARATION, READ_DATA, WRITE_DATA, WAIT_STATE_2);
    signal state_reg, next_state : FSM_state;

    signal write_signal : std_logic;
    signal read_signal : std_logic;

    signal integer_write_data : integer;
    signal address : std_logic_vector(7 downto 0);

    --Lane Status Arrays

    type type_CompleteLaneStatus_vector_array is array(0 to (g_NumberOfLanes - 1)) of std_logic_vector(31 downto 0);
    signal StatusArray_Complete : type_CompleteLaneStatus_vector_array;

    type type_LaneStatus_vector_array is array(0 to (g_NumberOfLanes - 1)) of std_logic_vector(15 downto 0);
    signal StatusArray_AlligmentFifoCount : type_LaneStatus_vector_array;
    signal StatusArray_XCVR : type_LaneStatus_vector_array;
    signal StatusArray_FIFO : type_LaneStatus_vector_array;
    signal StatusArray_XCVR_RisingE : type_LaneStatus_vector_array;
    signal StatusArray_FIFO_RisingE : type_LaneStatus_vector_array;
    signal StatusArray_XCVR_FallingE : type_LaneStatus_vector_array;
    signal StatusArray_FIFO_FallingE : type_LaneStatus_vector_array;

    signal StatusArray_XCVR_Last : type_LaneStatus_vector_array;
    signal StatusArray_FIFO_Last : type_LaneStatus_vector_array;

    signal Lanes_Restart_signal : std_logic;


------------------------------------------------------------------------------------------------------------
--Components
------------------------------------------------------------------------------------------------------------ 




begin

------------------------------------------------------------------------------------------------------------
--Signals routing
------------------------------------------------------------------------------------------------------------  

    address <= addr_frame; 


    StatusArrayComplete_GEN : for i in 0 to (g_NumberOfLanes - 1) generate
        StatusArray_Complete(i)     <= StatusLanes_Vector( ((i*32) + 31) downto (i*32) ); -- 31 downto 0; 63 downto 32
    
    end generate StatusArrayComplete_GEN;
  

    StatusArray_GEN : for i in 0 to (g_NumberOfLanes - 1) generate
        
        StatusArray_AlligmentFifoCount(i)   <= StatusArray_Complete(i)(15 downto 0);

        StatusArray_XCVR(i)(0)              <= StatusArray_Complete(i)(16);
        StatusArray_XCVR(i)(1)              <= StatusArray_Complete(i)(17);
        StatusArray_XCVR(i)(2)              <= StatusArray_Complete(i)(18);
        StatusArray_XCVR(i)(3)              <= StatusArray_Complete(i)(19);
        StatusArray_XCVR(i)(15 downto 4)    <= (others => '0'); 
        
        StatusArray_FIFO(i)(0)              <= StatusArray_Complete(i)(20);
        StatusArray_FIFO(i)(1)              <= StatusArray_Complete(i)(21);
        StatusArray_FIFO(i)(2)              <= StatusArray_Complete(i)(22);
        StatusArray_FIFO(i)(3)              <= StatusArray_Complete(i)(23);
        StatusArray_FIFO(i)(15 downto 4)    <= (others => '0'); 

    end generate StatusArray_GEN;


    Lanes_Restart <= Lanes_Restart_signal;

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
            Lanes_Restart_signal <= '0';


        elsif(Clock'event and Clock = '1') then    
            
            --backwrite signals
            --if(backwrite = '1') then

            --end if;


            --write from CMD
            if(write_signal = '1') then
                
                case(address) is


                    when CMD_TRNV_GENERAL_STATUS =>
                        --REG_EXT_Resets <= write_data_frame;
                        null;

                    when CMD_TRNV_LANES_RESTART =>
                        Lanes_Restart_signal <= write_data_frame(0);                             
                    
                    when others =>
                        null;

                end case;


            --read from CMD
            elsif(read_signal = '1') then
                
                read_data_frame <= (others => '0');

                if( (address >=  std_logic_vector(to_unsigned( ADDR_BASE_LanesStatus, 8)))  and (address <= std_logic_vector(to_unsigned((ADDR_BASE_LanesStatus + (10 * g_NumberOfLanes) + 10 ), 8))) ) then

                    LaneStatusArrayFor : for i in 0 to (g_NumberOfLanes - 1) loop

                        if(address = std_logic_vector(to_unsigned(((ADDR_BASE_LanesStatus + i*10) + ADDR_Reserved_0), 8 ))) then
                            read_data_frame <= X"AB" & std_logic_vector(to_unsigned(i,8));

                        elsif(address = std_logic_vector(to_unsigned(((ADDR_BASE_LanesStatus + i*10) + ADDR_AlligmentFifoCount) , 8))) then
                            read_data_frame <= StatusArray_AlligmentFifoCount(i);

                        elsif(address = std_logic_vector(to_unsigned(((ADDR_BASE_LanesStatus + i*10) + ADDR_XCVR), 8))) then
                            read_data_frame <= StatusArray_XCVR(i);

                        elsif(address = std_logic_vector(to_unsigned(((ADDR_BASE_LanesStatus + i*10) + ADDR_FIFO), 8))) then
                            read_data_frame <= StatusArray_FIFO(i);

                        elsif(address = std_logic_vector(to_unsigned(((ADDR_BASE_LanesStatus + i*10) + ADDR_XCVR_RisingE), 8))) then
                            read_data_frame <= StatusArray_XCVR_RisingE(i);

                        elsif(address = std_logic_vector(to_unsigned(((ADDR_BASE_LanesStatus + i*10) + ADDR_FIFO_RisingE), 8))) then
                            read_data_frame <= StatusArray_FIFO_RisingE(i);

                        elsif(address = std_logic_vector(to_unsigned(((ADDR_BASE_LanesStatus + i*10) + ADDR_XCVR_Falling), 8))) then
                          read_data_frame <= StatusArray_XCVR_FallingE(i);

                        elsif(address = std_logic_vector(to_unsigned(((ADDR_BASE_LanesStatus + i*10) + ADDR_FIFO_FallingE), 8))) then
                            read_data_frame <= StatusArray_FIFO_FallingE(i);

                        elsif(address = std_logic_vector(to_unsigned(((ADDR_BASE_LanesStatus + i*10) + ADDR_Reserved_8), 8))) then
                            read_data_frame <= (others => '0');

                        elsif(address = std_logic_vector(to_unsigned(((ADDR_BASE_LanesStatus + i*10) + ADDR_Reserved_9), 8))) then
                            read_data_frame <= (others => '0');

                        else
                            --read_data_frame <= (others => '0');
                            null;

                        end if;

                    end loop LaneStatusArrayFor;

                else



                    case(address) is

                        when CMD_TRNV_GENERAL_STATUS => 
                            read_data_frame <= X"5555";
                        
                        when CMD_TRNV_LANES_RESTART =>
                            read_data_frame(0) <= Lanes_Restart_signal;  
                    
                        when others =>
                            --read_data_frame <= (others => '0');

                    end case;

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

            StatusArray_XCVR_Last <= (others => (others => '0'));
            StatusArray_FIFO_Last <= (others => (others => '0'));

            StatusArray_XCVR_RisingE <= (others => (others => '0'));
            StatusArray_FIFO_RisingE <= (others => (others => '0'));
            StatusArray_XCVR_FallingE <= (others => (others => '0'));
            StatusArray_FIFO_FallingE <= (others => (others => '0'));


        elsif(Clock'event and Clock = '1') then

            --edge detectors for (go in lanes)
            Edge_Detector_LanesFor : for lane in 0 to (g_NumberOfLanes - 1) loop

                --edge detectors for (go in bits)
                Edge_Detector_BitFor : for bit in 0 to (g_NumberOfLanes - 1) loop

                    --XCVR status rising edge detector
                    if(StatusArray_XCVR_Last(lane)(bit) = '0' and StatusArray_XCVR(lane)(bit) = '1') then
                        StatusArray_XCVR_RisingE(lane)(bit) <= '1';
                    end if;

                    --XCVR status falling edge detector
                    if(StatusArray_XCVR_Last(lane)(bit) = '1' and StatusArray_XCVR(lane)(bit) = '0') then
                        StatusArray_XCVR_FallingE(lane)(bit) <= '1';
                    end if;

                    --fifo status rising edge detector
                    if(StatusArray_FIFO_Last(lane)(bit) = '0' and StatusArray_FIFO(lane)(bit) = '1') then
                        StatusArray_FIFO_RisingE(lane)(bit) <= '1';
                    end if;

                    --fifo status falling edge detector
                    if(StatusArray_FIFO_Last(lane)(bit) = '1' and StatusArray_FIFO(lane)(bit) = '0') then
                        StatusArray_FIFO_FallingE(lane)(bit) <= '1';
                    end if;

                end loop Edge_Detector_BitFor;  

            end loop Edge_Detector_LanesFor;  


        StatusArray_XCVR_Last <= StatusArray_XCVR;
        StatusArray_FIFO_Last <= StatusArray_FIFO;

        end if;

    end process;





end rtl;