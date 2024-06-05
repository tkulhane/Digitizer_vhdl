library IEEE;
use IEEE.std_logic_1164.all;

package cmd_table_trigger is

    constant CMD_TRG_ENABLE                         : std_logic_vector(7 downto 0) := x"01";
    constant CMD_TRG_MODE                           : std_logic_vector(7 downto 0) := x"02";
    constant CMD_TRG_ABORT_MODE                     : std_logic_vector(7 downto 0) := x"03";
    constant CMD_TRG_TRIGGER_SELECT                 : std_logic_vector(7 downto 0) := x"04";

    constant CMD_TRG_THRESHOLD                      : std_logic_vector(7 downto 0) := x"11";
    
    constant CMD_TRG_SAMPLE_PER_EVENT_L             : std_logic_vector(7 downto 0) := x"12";
    constant CMD_TRG_SAMPLE_PER_EVENT_M             : std_logic_vector(7 downto 0) := x"13";

    constant CMD_TRG_SET_NUMBERS_OF_EVENTS_L        : std_logic_vector(7 downto 0) := x"14";
    constant CMD_TRG_SET_NUMBERS_OF_EVENTS_M        : std_logic_vector(7 downto 0) := x"15";
    constant CMD_TRG_SET_TIME_FOR_RUN_L             : std_logic_vector(7 downto 0) := x"16";
    constant CMD_TRG_SET_TIME_FOR_RUN_M             : std_logic_vector(7 downto 0) := x"17";

    constant CMD_TRG_COUNTERS_RESET                 : std_logic_vector(7 downto 0) := x"20";

    constant CMD_TRG_COUNTER_EVENT_INCOMING_L       : std_logic_vector(7 downto 0) := x"21";
    constant CMD_TRG_COUNTER_EVENT_INCOMING_M       : std_logic_vector(7 downto 0) := x"22";
    constant CMD_TRG_COUNTER_EVENT_PROCESSED_L      : std_logic_vector(7 downto 0) := x"23";
    constant CMD_TRG_COUNTER_EVENT_PROCESSED_M      : std_logic_vector(7 downto 0) := x"24";
    constant CMD_TRG_COUNTER_EVENT_INRUN_L          : std_logic_vector(7 downto 0) := x"25";
    constant CMD_TRG_COUNTER_EVENT_INRUN_M          : std_logic_vector(7 downto 0) := x"26";

    constant CMD_TRG_TEST_GENERATOR_ENABLE          : std_logic_vector(7 downto 0) := x"41";
    constant CMD_TRG_DATA_TEST_MUX                  : std_logic_vector(7 downto 0) := x"42";

end package;