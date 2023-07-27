library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity SPI_interface is
    generic
    (
        addr_width : integer := 15;                                      --width of address
        data_width : integer := 8                                      --width of send/receive data
    );

    port
    (
        Clock : in std_logic;                                           --system clock
        Reset_N : in std_logic;                                         --system reset

        busy : out std_logic;                                           --transfer active
        enable_cmd : in std_logic;                                      --enable-start stransfer
        write_read : in std_logic;                                      --write/read bit and command
        addr_frame : in std_logic_vector(addr_width - 1 downto 0);        --send address
        tx_data_frame : in std_logic_vector(data_width - 1 downto 0);     --send data
        rx_data_frame : out std_logic_vector(data_width - 1 downto 0);    --receive data

        --spi perifery
        spi_enable  : out     STD_LOGIC;                                    --initiate communication
        spi_busy    : in    STD_LOGIC;                                      --master busy signal
        spi_tx		: out     STD_LOGIC_VECTOR(1 + addr_width + data_width - 1 DOWNTO 0);     --data to transmit
        spi_rx	    : in    STD_LOGIC_VECTOR(1 + addr_width + data_width - 1  DOWNTO 0)       --data received


    );
end SPI_interface;


architecture rtl of SPI_interface is

    


begin

    
------------------------------------------------------------------------------------------------------------
--register rides signals
------------------------------------------------------------------------------------------------------------
    process(Reset_N,Clock)
    begin

        if(Reset_N = '0') then
            spi_enable <= '0';
            busy <= '0';
        
        elsif(Clock'event and Clock = '1') then
            spi_enable <= enable_cmd;
            busy <= spi_busy;

        end if;
    end process;


------------------------------------------------------------------------------------------------------------
--register data vectors
------------------------------------------------------------------------------------------------------------
process(Reset_N,Clock)
begin

    if(Reset_N = '0') then
        spi_tx <= (others => '0');
        rx_data_frame <= (others => '0');
    
    elsif(Clock'event and Clock = '1') then
        
        if(enable_cmd = '1') then
            spi_tx <= write_read & addr_frame & tx_data_frame; 
            
        end if;

        rx_data_frame <= spi_rx(data_width - 1 downto 0);

    end if;
end process;

             






end rtl;