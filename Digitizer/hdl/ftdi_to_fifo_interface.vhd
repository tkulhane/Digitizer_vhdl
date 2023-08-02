library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity ftdi_to_fifo_interface is
    port
    (
        FTDI_FA : in std_logic_vector(31 downto 0);
        FIFO_FA : out std_logic_vector(39 downto 0);

        FTDI_AF : out std_logic_vector(31 downto 0);
        FIFO_AF : in std_logic_vector(39 downto 0);

        Communication_Number : in std_logic_vector(3 downto 0)


    );

end ftdi_to_fifo_interface;

architecture rtl of ftdi_to_fifo_interface is

begin

    FIFO_FA <= "0000" & Communication_Number & FTDI_FA;

    FTDI_AF <= FIFO_AF(31 downto 0);


end rtl;