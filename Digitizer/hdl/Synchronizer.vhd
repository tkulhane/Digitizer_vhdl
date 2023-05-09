library ieee;
use ieee.std_logic_1164.all;

entity Synchronizer is
    generic
    (
        Num_FlipFlop : natural := 2
    );
    port
    (
        nRST : in std_logic; --asynchronous reset - low active
        CLK : in std_logic;
        Data_In : in std_logic;
        Data_Out : out std_logic
    );
end Synchronizer;   


    architecture arch of Synchronizer is
    
        signal Chain : std_logic_vector(Num_FlipFlop - 1 downto 0);
    
    begin

        process(nRST,CLK)
        begin
            
            if(nRST = '0') then
                Chain <= (others => '0');

            elsif(CLK'event and CLK = '1') then
                Chain <= Chain(Num_FlipFlop - 2 downto 0) & data_in;

            end if;
        end process;

    Data_Out <= Chain(Num_FlipFlop - 1);
    
    end arch ; -- arch
