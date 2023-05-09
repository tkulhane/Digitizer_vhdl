library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity ADI_SPI is
    generic
    (
        addr_width : integer := 15;                                      --width of address
        data_width : integer := 8;                                      --width of send/receive data
        clk_divider : integer := 10                                      --clock divider
    );

    port
    (
        Clock : in std_logic;                                           --system clock
        Reset_N : in std_logic;                                         --system reset

        busy : out std_logic;                                           --transfer active
        enable_cmd : in std_logic;                                      --enable-start stransfer
        write_read : in std_logic;                                      --write/read bit and command
        addr_frame : in std_logic_vector(addr_width-1 downto 0);        --send address
        tx_data_frame : in std_logic_vector(data_width-1 downto 0);     --send data
        rx_data_frame : out std_logic_vector(data_width-1 downto 0);    --receive data

        sclk : buffer std_logic;                                        --spi clk (clock)
        ss_n : buffer std_logic;                                        --spi ss  (slave select)
        sdio : inout std_logic                                          --spi sdio (input output 3 state) 

    );
end ADI_SPI;


architecture rtl of ADI_SPI is

    type FSM_state is (IDLE,SEND_ADDR, SEND_DATA, RECV_DATA, BUSY_CLEAR);
    signal state_reg : FSM_state;

    signal divider_enable : std_logic;
    signal addr_counter : integer;
    signal data_counter : integer;
    signal assert_data : std_logic;

    signal wr_addr_buffer : std_logic_vector(addr_width downto 0);
    signal tx_data_buffer : std_logic_vector(data_width-1 downto 0);
    signal rx_data_buffer : std_logic_vector(data_width-1 downto 0);
    signal write_read_buffer : std_logic;

begin

------------------------------------------------------------------------------------------------------------
--Main SPI process
------------------------------------------------------------------------------------------------------------ 
    process(Reset_N,Clock)

    begin


        if(Reset_N = '0') then                      --reset spi

            state_reg <= IDLE;
        
            busy <= '0';
            sclk <= '0';
            ss_n <= '1';
            sdio <= 'Z';

            addr_counter <= 0;
            data_counter <= 0;
            assert_data <= '0';
            rx_data_buffer <= (others => '0');
        
        
        elsif(Clock'event and Clock = '1') then     --rising clock 

            case state_reg is                       --state register case

                when IDLE =>                        --IDLE State
                
                    busy <= '0';
                    sclk <= '0';
                    ss_n <= '1';
                    sdio <= 'Z';
                    assert_data <= '0';

                    rx_data_frame <= rx_data_buffer;

                    if(enable_cmd = '1') THEN       --enable SPI transfer
                        --store to buffers
                        wr_addr_buffer <= write_read & addr_frame;
                        tx_data_buffer <= tx_data_frame;
                        write_read_buffer <= write_read;

                        busy <= '1';
                        state_reg <= SEND_ADDR;     --send address frame     

                    else
                        state_reg <= IDLE;          --stay in IDLE

                    end if;


                when SEND_ADDR =>                   --state SEND_ADDR
                    
                    busy <= '1';
                    
                    if(divider_enable = '1') then   --signal from freq devider

                        assert_data <= not assert_data;

                        if(ss_n = '0') then
                            sclk <= not sclk;       --SPI sclk generate
                        end if;

                        if(assert_data = '1') then  
                            ss_n <= '0';
                            sdio <= wr_addr_buffer(addr_width);     --address and write/read bufer to sdio
                            wr_addr_buffer <= wr_addr_buffer(addr_width - 1 downto 0) & '0';    --address and write/read bufer shift
                        end if;


                        if(addr_counter >= addr_width*2 and assert_data = '1') then         --end address transmit
                            addr_counter <= 0;
                            
                            --if(wr_addr_buffer(addr_width) = '1') then
                            if(write_read_buffer = '1') then                --switch berfore receive or send data  
                                state_reg <= RECV_DATA;                     --receive data
                            else
                                state_reg <= SEND_DATA;                     --send data
                            end if;

                        else
                            addr_counter <= addr_counter + 1;
                            state_reg <= SEND_ADDR;                         --stay in SEND_ADDR

                        end if;

                    else
                        state_reg <= SEND_ADDR;                             --stay in SEND_ADDR

                    end if;


                 when SEND_DATA =>                  --state SEND_DATA

                    busy <= '1';
                    
                    if(divider_enable = '1') then   --signal from freq devider

                        assert_data <= not assert_data;

                        if(ss_n = '0') then
                            sclk <= not sclk;       --SPI sclk generate
                        end if;

                        if(assert_data = '1') then
                            ss_n <= '0';
                            sdio <= tx_data_buffer(data_width - 1);     --data bufer to sdio
                            tx_data_buffer <= tx_data_buffer(data_width - 2 downto 0) & '0';    --data bufer shift
                        end if;


                        if(data_counter >= data_width*2 and assert_data = '1') then     --end data transmit
                            data_counter <= 0;
                            state_reg <= BUSY_CLEAR;              --go to IDLE

                        else
                            data_counter <= data_counter + 1;
                            state_reg <= SEND_DATA;                 --stay in SEND_DATA

                        end if;

                    else
                        state_reg <= SEND_DATA;                     --stay in SEND_DATA

                    end if;



                when RECV_DATA =>                  --state SEND_DATA   

                    busy <= '1';
                    
                    if(divider_enable = '1') then   --signal from freq devider

                        assert_data <= not assert_data;

                        if(ss_n = '0') then
                            sclk <= not sclk;       --SPI sclk generate
                        end if;

                        if(assert_data = '0') then
                            --sdio <= 'Z';
                            ss_n <= '0';
                            rx_data_buffer <= rx_data_buffer(data_width - 2 downto 0) & sdio;     --shift sdio to data buffer
                            
                        end if;
                        
                        if(assert_data = '1') then
                            sdio <= 'Z';
                        end if;

                        if(data_counter >= data_width*2 and assert_data = '1') then     --end data receive
                            data_counter <= 0;
                            state_reg <= BUSY_CLEAR;          --go to IDLE

                        else
                            data_counter <= data_counter + 1;
                            state_reg <= RECV_DATA;                 --stay in RECV_DATA

                        end if;

                    else
                        state_reg <= RECV_DATA;                     --stay in RECV_DATA

                    end if;

                when BUSY_CLEAR =>
                    state_reg <= IDLE;

                    busy <= '0';       



                when others =>
                    null;


            end case;

        end if;

    end process;


------------------------------------------------------------------------------------------------------------
--freq divider process
------------------------------------------------------------------------------------------------------------ 
    process(Reset_N,Clock)

        variable Counter : unsigned (8 downto 0) := (others => '0');

    begin

        if(Reset_N = '0') then
			Counter := (others => '0');
			divider_enable <= '0';
		
		elsif(Clock'event and Clock = '1') then

			if(counter = clk_divider) then
				divider_enable <= '1';
                Counter := (others => '0');

            else 
                divider_enable <= '0';
                Counter := Counter + 1;

			end if;

		end if;		

    end process;

end rtl;