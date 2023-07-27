library IEEE;
use IEEE.std_logic_1164.all;

package cmd_table_trigger is

    constant CMD_TRG_ENABLE                         : std_logic_vector(7 downto 0) := x"00";
    constant CMD_TRG_THRESHOLD                      : std_logic_vector(7 downto 0) := x"01";
    
    constant CMD_TRG_SAMPLE_PER_EVENT_L             : std_logic_vector(7 downto 0) := x"02";
    constant CMD_TRG_SAMPLE_PER_EVENT_M             : std_logic_vector(7 downto 0) := x"03";

    constant CMD_TRG_SET_NUMBERS_OF_EVENTS_L        : std_logic_vector(7 downto 0) := x"04";
    constant CMD_TRG_SET_NUMBERS_OF_EVENTS_M        : std_logic_vector(7 downto 0) := x"05";
    constant CMD_TRG_SET_TIME_FOR_RUN_L             : std_logic_vector(7 downto 0) := x"06";
    constant CMD_TRG_SET_TIME_FOR_RUN_M             : std_logic_vector(7 downto 0) := x"07";

    constant CMD_TRG_COUNTER_EVENT_INCOMING_L       : std_logic_vector(7 downto 0) := x"10";
    constant CMD_TRG_COUNTER_EVENT_INCOMING_M       : std_logic_vector(7 downto 0) := x"11";
    constant CMD_TRG_COUNTER_EVENT_PROCESSED_L      : std_logic_vector(7 downto 0) := x"12";
    constant CMD_TRG_COUNTER_EVENT_PROCESSED_M      : std_logic_vector(7 downto 0) := x"13";
    constant CMD_TRG_COUNTER_EVENT_INRUN_L          : std_logic_vector(7 downto 0) := x"14";
    constant CMD_TRG_COUNTER_EVENT_INRUN_M          : std_logic_vector(7 downto 0) := x"15";

    constant CMD_TRG_TEST_GENERATOR_ENABLE          : std_logic_vector(7 downto 0) := x"30";
    
    constant CMD_TRG_COUNTERS_RESET                 : std_logic_vector(7 downto 0) := x"40";
    
    

end package;