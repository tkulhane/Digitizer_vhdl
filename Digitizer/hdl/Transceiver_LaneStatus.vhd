library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Transceiver_LaneStatus is
  port 
  (
    Clock : in std_logic;
    Reset_N : in std_logic;

    StatusVector : out std_logic_vector(31 downto 0);

    AlligmentFifo_Count : in std_logic_vector(15 downto 0);
    TxClk_Stable : in std_logic;
    Rx_Ready : in std_logic;
    Rx_Val : in std_logic;
    Rx_SyncFault : in std_logic;
    RxFifo_Full : in std_logic;
    RxFifo_Empty : in std_logic;
    TxFifo_Full : in std_logic;
    TxFifo_Empty : in std_logic

  );
end Transceiver_LaneStatus;



architecture rtl of Transceiver_LaneStatus is

------------------------------------------------------------------------------------------------------------
--constant
------------------------------------------------------------------------------------------------------------ 

------------------------------------------------------------------------------------------------------------
--Signals declaration
------------------------------------------------------------------------------------------------------------ 

------------------------------------------------------------------------------------------------------------
--Components
------------------------------------------------------------------------------------------------------------ 

begin

------------------------------------------------------------------------------------------------------------
--Signals routing
------------------------------------------------------------------------------------------------------------  


------------------------------------------------------------------------------------------------------------
--
------------------------------------------------------------------------------------------------------------
    process(Reset_N, Clock)

    begin
    
        if(Reset_N = '0') then 
           StatusVector <= (others => '0');


        elsif(Clock'event and Clock = '1') then    
            
            StatusVector(15 downto 0) <= AlligmentFifo_Count;

            StatusVector(16) <= TxClk_Stable;
            StatusVector(17) <= Rx_Ready;
            StatusVector(18) <= Rx_Val;
            StatusVector(19) <= Rx_SyncFault;

            StatusVector(20) <= RxFifo_Full;
            StatusVector(21) <= RxFifo_Empty;
            StatusVector(22) <= TxFifo_Full;
            StatusVector(23) <= TxFifo_Empty;
            
        end if;

    end process;





end rtl;