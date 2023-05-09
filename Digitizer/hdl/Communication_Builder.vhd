library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Communication_Builder is
    port
    (
        Clock : in std_logic;                                           --system clock
        Reset_N : in std_logic;                                         --system reset

        Event_RAM_R_Address : out std_logic_vector(9 downto 0);
        Event_RAM_R_Data_Start_ADDR : out std_logic_vector(19 downto 0);
        Event_RAM_R_Data_Number : out std_logic_vector(19 downto 0);
        Event_RAM_R_Data_Size : out std_logic_vector(19 downto 0);
        Event_RAM_R_Data_Status : out std_logic_vector(7 downto 0);
        Event_RAM_W_Enable_Status : out std_logic;
        Event_RAM_W_Data_Status : in std_logic_vector(7 downto 0);

        Sample_RAM_R_Address : out std_logic_vector(15 downto 0);
        Sample_RAM_R_Block_Address : out std_logic_vector(3 downto 0);
        Sample_RAM_R_Data : out std_logic_vector(63 downto 0);

        --communication interface
        Communication_Data_Frame : out std_logic_vector(31 downto 0);
        Communication_Data_Enable : out std_logic;
        Communication_Data_Full : in std_logic;
        Communication_Data_Req : out std_logic;

    );
end Communication_Builder;


architecture rtl of Communication_Builder is


    constant Event_Status_ID_Free           : std_logic_vector := X"00";
    constant Event_Status_ID_InWrite        : std_logic_vector := X"01";
    constant Event_Status_ID_WriteDone      : std_logic_vector := X"02";
    constant Event_Status_ID_InRead         : std_logic_vector := X"03";

------------------------------------------------------------------------------------------------------------
--Signals Declaration
------------------------------------------------------------------------------------------------------------ 
    type FSM_state is (IDLE, );
    signal state_reg, next_state : FSM_state;



begin

------------------------------------------------------------------------------------------------------------
--Signals Routing
------------------------------------------------------------------------------------------------------------   



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
    process(next_state, state_reg, )
    begin

        next_state <= state_reg;

        case state_reg is
        
            when IDLE =>

            
            when others =>
                null; 

        end case;
    end process;

    --output function
    process(state_reg)
    begin

        case state_reg is
        
            when IDLE =>

            when others =>

        end case;

    end process;


------------------------------------------------------------------------------------------------------------
--process 
------------------------------------------------------------------------------------------------------------
    process(Clock,Reset_N)

    begin

        if(Reset_N = '0') then

		elsif(Clock'event and Clock = '1') then


		end if;

    end process;

   




end rtl;