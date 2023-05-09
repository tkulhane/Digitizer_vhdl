library IEEE;
use IEEE.std_logic_1164.all;

package cmd_table is

    constant CMD_CONST_Loopback                 : std_logic_vector(7 downto 0) := x"01";
    constant CMD_CONST_FAULT                    : std_logic_vector(7 downto 0) := x"02";

    constant CMD_CONST_SET_System_Controler     : std_logic_vector(7 downto 0) := x"03";
    constant CMD_CONST_GET_System_Controler     : std_logic_vector(7 downto 0) := x"04";
    
    constant CMD_CONST_SET_MainRegisters        : std_logic_vector(7 downto 0) := x"11";
    constant CMD_CONST_GET_MainRegisters        : std_logic_vector(7 downto 0) := x"12";

    constant CMD_CONST_SET_InfoRegisters        : std_logic_vector(7 downto 0) := x"23";
    constant CMD_CONST_GET_InfoRegisters        : std_logic_vector(7 downto 0) := x"24";
    constant CMD_CONST_SET_AdcRegisters         : std_logic_vector(7 downto 0) := x"25";
    constant CMD_CONST_GET_AdcRegisters         : std_logic_vector(7 downto 0) := x"26";
    
    constant CMD_CONST_SET_TriggerRegisters     : std_logic_vector(7 downto 0) := x"31";
    constant CMD_CONST_GET_TriggerRegisters     : std_logic_vector(7 downto 0) := x"32";


end package;