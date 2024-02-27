library IEEE;
use IEEE.std_logic_1164.all;

package cmd_table is

    constant CMD_CONST_CDb_Command              : std_logic := '1';
    constant CMD_CONST_CDb_Data                 : std_logic := '0';


    constant CMD_CONST_Loopback                 : std_logic_vector(7 downto 0) := x"01";
    constant CMD_CONST_FAULT                    : std_logic_vector(7 downto 0) := x"02";

    constant CMD_CONST_SET_Reset_Controler     : std_logic_vector(7 downto 0) := x"03";
    constant CMD_CONST_GET_Reset_Controler     : std_logic_vector(7 downto 0) := x"04";
    
    constant CMD_CONST_SET_TestRegisters        : std_logic_vector(7 downto 0) := x"11";
    constant CMD_CONST_GET_TestRegisters        : std_logic_vector(7 downto 0) := x"12";

    --constant CMD_CONST_SET_InfoRegisters        : std_logic_vector(7 downto 0) := x"23";
    --constant CMD_CONST_GET_InfoRegisters        : std_logic_vector(7 downto 0) := x"24";
    constant CMD_CONST_SET_AdcRegisters         : std_logic_vector(7 downto 0) := x"21";
    constant CMD_CONST_GET_AdcRegisters         : std_logic_vector(7 downto 0) := x"22";
    constant CMD_CONST_SET_HmcRegisters         : std_logic_vector(7 downto 0) := x"23";
    constant CMD_CONST_GET_HmcRegisters         : std_logic_vector(7 downto 0) := x"24";
    constant CMD_CONST_SET_Lmx1Registers        : std_logic_vector(7 downto 0) := x"25";
    constant CMD_CONST_GET_Lmx1Registers        : std_logic_vector(7 downto 0) := x"26";
    constant CMD_CONST_SET_Lmx2Registers        : std_logic_vector(7 downto 0) := x"27";
    constant CMD_CONST_GET_Lmx2Registers        : std_logic_vector(7 downto 0) := x"28";
    
    constant CMD_CONST_SET_TriggerRegisters     : std_logic_vector(7 downto 0) := x"31";
    constant CMD_CONST_GET_TriggerRegisters     : std_logic_vector(7 downto 0) := x"32";
    constant CMD_CONST_SET_GPIO                 : std_logic_vector(7 downto 0) := x"33";
    constant CMD_CONST_GET_GPIO                 : std_logic_vector(7 downto 0) := x"34";
    constant CMD_CONST_SET_CommunicationSwitch  : std_logic_vector(7 downto 0) := x"35";
    constant CMD_CONST_GET_CommunicationSwitch  : std_logic_vector(7 downto 0) := x"36";
    constant CMD_CONST_SET_TransceiversControl  : std_logic_vector(7 downto 0) := x"37";
    constant CMD_CONST_GET_TransceiversControl  : std_logic_vector(7 downto 0) := x"38";



    constant CMD_CONST_EVENT_HEAD               : std_logic_vector(7 downto 0) := x"7A";
    constant CMD_CONST_EVENT_TAIL               : std_logic_vector(7 downto 0) := x"7B";
    constant CMD_CONST_PACKET_HEAD              : std_logic_vector(7 downto 0) := x"7C";
    constant CMD_CONST_PACKET_TAIL              : std_logic_vector(7 downto 0) := x"7D";
    

------------------------------------------------------------------------------------------------------------
--perif numbers constant
------------------------------------------------------------------------------------------------------------
    constant PER_NUM_WidthOfPeriferiesVector        : Natural := 10;

    constant PER_NUM_CONST_Reset_Controler          : Natural := 0;
    constant PER_NUM_CONST_TestRegisters            : Natural := 1;
    constant PER_NUM_CONST_ADC                      : Natural := 2;
    constant PER_NUM_CONST_HMC                      : Natural := 3;
    constant PER_NUM_CONST_LMX1                     : Natural := 4;
    constant PER_NUM_CONST_LMX2                     : Natural := 5;
    constant PER_NUM_CONST_Trigger                  : Natural := 6;
    constant PER_NUM_CONST_GPIO                     : Natural := 7;
    constant PER_NUM_CONST_COMSW                    : Natural := 8;
    constant PER_NUM_CONST_TRNV                     : Natural := 9;
    

end package;