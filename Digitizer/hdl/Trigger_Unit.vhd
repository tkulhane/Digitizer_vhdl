library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Trigger_Unit is
    generic
    (
        g_Num_Of_TRG_Units : natural := 8;
        g_Order_Vector_Length : natural := 3; -- 2^g_Order_Vector_Length >= g_Num_Of_TRG_Units 
        g_Data_Length : Natural := 12
    );
    port
    (
        Clock : in std_logic;
        Reset_N : in std_logic;

        Order_Of_TRG_Unit : in std_logic_vector(g_Order_Vector_Length - 1 downto 0);

        Input_Data : in std_logic_vector(g_Data_Length - 1 downto 0);           --Input sample data from Front-End
        Output_Data : out std_logic_vector(4 + g_Data_Length - 1 downto 0);     --Output data to FIFO (sID + Sample)

        --conncetion with main unit
        TRG_Threshold : in std_logic_vector(g_Data_Length - 1 downto 0);
        TRG_Detect_Vector : inout std_logic_vector(g_Num_Of_TRG_Units - 1 downto 0)

    );
end Trigger_Unit;


architecture rtl of Trigger_Unit is

    --samples ID constant
    constant sID_NON_STAMP          : std_logic_vector(2 downto 0) := "000";
    constant sID_FIRST_SAMPLE       : std_logic_vector(2 downto 0) := "001";
    constant sID_LAST_SAMPLE        : std_logic_vector(2 downto 0) := "010";
    constant sID_MIDS_SAMPLE        : std_logic_vector(2 downto 0) := "011";
    constant sID_RESERVE_1          : std_logic_vector(2 downto 0) := "100";
    constant sID_RESERVE_2          : std_logic_vector(2 downto 0) := "101";
    constant sID_RESERVE_3          : std_logic_vector(2 downto 0) := "110";
    constant sID_FAULT_SAMPLE       : std_logic_vector(2 downto 0) := "111";

------------------------------------------------------------------------------------------------------------
--Signals Declaration
------------------------------------------------------------------------------------------------------------   
    signal Output_sID_Part : std_logic_vector(2 downto 0);
    signal Output_Sample_Part : std_logic_vector(g_Data_Length - 1 downto 0);

    signal TRG_Unit_Detect : std_logic;

    signal Input_Data_1 : std_logic_vector(g_Data_Length - 1 downto 0);
    signal Input_Data_2 : std_logic_vector(g_Data_Length - 1 downto 0);

    signal Order_Of_TRG_Unit_NUM : natural;
    
begin

------------------------------------------------------------------------------------------------------------
--Signals Routing
------------------------------------------------------------------------------------------------------------   
    Output_Data <= '0' & "000" & Output_Sample_Part;

    Order_Of_TRG_Unit_NUM <= to_integer( unsigned(Order_Of_TRG_Unit) );

    TRG_Valid_Vector_Assing : for i in 0 to (g_Num_Of_TRG_Units - 1) generate  
        TRG_Detect_Vector(i) <= TRG_Unit_Detect when (i = Order_Of_TRG_Unit_NUM) else 'Z';
    end generate TRG_Valid_Vector_Assing;

------------------------------------------------------------------------------------------------------------
--Process: Shift Data for Delayed
------------------------------------------------------------------------------------------------------------
    Delayed_Data: process(Clock,Reset_N)
    begin

        if(Reset_N = '0') then
            Input_Data_1 <= (others => '0');
            Input_Data_2 <= (others => '0');
            Output_Sample_Part <= (others => '0');

        elsif(Clock'event and Clock = '1') then
            Input_Data_1 <= Input_Data;
            Input_Data_2 <= Input_Data_1;
            Output_Sample_Part <= Input_Data_2;

        end if;  

    end process;   

------------------------------------------------------------------------------------------------------------
--Process: Threshold_Comparator
------------------------------------------------------------------------------------------------------------
    Threshold_Comparator: process(Clock,Reset_N)
    begin

        if(Reset_N = '0') then
            TRG_Unit_Detect <= '0';

        elsif(Clock'event and Clock = '1') then
    
        
            if(Input_Data >= TRG_Threshold) then
                TRG_Unit_Detect <= '1';

            else
                TRG_Unit_Detect <= '0';

            end if;
        end if;  

    end process;   
    

end rtl;