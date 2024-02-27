--
-- Synopsys
-- Vhdl wrapper for top level design, written on Tue Feb 27 12:48:36 2024
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity wrapper_for_work_alignmentlane_fifo_rtl_8_8_256_3_g_NumOfBYTESg_BYTE_WIDTHg_DEPTH is
   port (
      Clock : in std_logic;
      Reset_N : in std_logic;
      Count : out std_logic_vector(15 downto 0);
      Write_Enable : in std_logic;
      Full : out std_logic;
      Full_For_All : out std_logic;
      Write_Data : in std_logic_vector(63 downto 0);
      Write_Data_Enable : in std_logic_vector(7 downto 0);
      Read_Enable : in std_logic;
      Empty : out std_logic;
      Empty_For_NonAll : out std_logic;
      Read_Data : out std_logic_vector(63 downto 0);
      Read_Data_Enable : in std_logic_vector(7 downto 0);
      Read_Data_Empty : out std_logic_vector(7 downto 0)
   );
end wrapper_for_work_alignmentlane_fifo_rtl_8_8_256_3_g_NumOfBYTESg_BYTE_WIDTHg_DEPTH;

architecture rtl of wrapper_for_work_alignmentlane_fifo_rtl_8_8_256_3_g_NumOfBYTESg_BYTE_WIDTHg_DEPTH is

component work_alignmentlane_fifo_rtl_8_8_256_3_g_NumOfBYTESg_BYTE_WIDTHg_DEPTH
 port (
   Clock : in std_logic;
   Reset_N : in std_logic;
   Count : out std_logic_vector (15 downto 0);
   Write_Enable : in std_logic;
   Full : out std_logic;
   Full_For_All : out std_logic;
   Write_Data : in std_logic_vector (63 downto 0);
   Write_Data_Enable : in std_logic_vector (7 downto 0);
   Read_Enable : in std_logic;
   Empty : out std_logic;
   Empty_For_NonAll : out std_logic;
   Read_Data : out std_logic_vector (63 downto 0);
   Read_Data_Enable : in std_logic_vector (7 downto 0);
   Read_Data_Empty : out std_logic_vector (7 downto 0)
 );
end component;

signal tmp_Clock : std_logic;
signal tmp_Reset_N : std_logic;
signal tmp_Count : std_logic_vector (15 downto 0);
signal tmp_Write_Enable : std_logic;
signal tmp_Full : std_logic;
signal tmp_Full_For_All : std_logic;
signal tmp_Write_Data : std_logic_vector (63 downto 0);
signal tmp_Write_Data_Enable : std_logic_vector (7 downto 0);
signal tmp_Read_Enable : std_logic;
signal tmp_Empty : std_logic;
signal tmp_Empty_For_NonAll : std_logic;
signal tmp_Read_Data : std_logic_vector (63 downto 0);
signal tmp_Read_Data_Enable : std_logic_vector (7 downto 0);
signal tmp_Read_Data_Empty : std_logic_vector (7 downto 0);

begin

tmp_Clock <= Clock;

tmp_Reset_N <= Reset_N;

Count <= tmp_Count;

tmp_Write_Enable <= Write_Enable;

Full <= tmp_Full;

Full_For_All <= tmp_Full_For_All;

tmp_Write_Data <= Write_Data;

tmp_Write_Data_Enable <= Write_Data_Enable;

tmp_Read_Enable <= Read_Enable;

Empty <= tmp_Empty;

Empty_For_NonAll <= tmp_Empty_For_NonAll;

Read_Data <= tmp_Read_Data;

tmp_Read_Data_Enable <= Read_Data_Enable;

Read_Data_Empty <= tmp_Read_Data_Empty;



u1:   work_alignmentlane_fifo_rtl_8_8_256_3_g_NumOfBYTESg_BYTE_WIDTHg_DEPTH port map (
		Clock => tmp_Clock,
		Reset_N => tmp_Reset_N,
		Count => tmp_Count,
		Write_Enable => tmp_Write_Enable,
		Full => tmp_Full,
		Full_For_All => tmp_Full_For_All,
		Write_Data => tmp_Write_Data,
		Write_Data_Enable => tmp_Write_Data_Enable,
		Read_Enable => tmp_Read_Enable,
		Empty => tmp_Empty,
		Empty_For_NonAll => tmp_Empty_For_NonAll,
		Read_Data => tmp_Read_Data,
		Read_Data_Enable => tmp_Read_Data_Enable,
		Read_Data_Empty => tmp_Read_Data_Empty
       );
end rtl;
