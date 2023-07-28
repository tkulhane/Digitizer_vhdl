--
-- Synopsys
-- Vhdl wrapper for top level design, written on Fri Jul 28 18:33:41 2023
--
library ieee;
use ieee.std_logic_1164.all;

entity wrapper_for_Synchronizer is
   port (
      nRST : in std_logic;
      CLK : in std_logic;
      Data_In : in std_logic;
      Data_Out : out std_logic
   );
end wrapper_for_Synchronizer;

architecture arch of wrapper_for_Synchronizer is

component Synchronizer
 port (
   nRST : in std_logic;
   CLK : in std_logic;
   Data_In : in std_logic;
   Data_Out : out std_logic
 );
end component;

signal tmp_nRST : std_logic;
signal tmp_CLK : std_logic;
signal tmp_Data_In : std_logic;
signal tmp_Data_Out : std_logic;

begin

tmp_nRST <= nRST;

tmp_CLK <= CLK;

tmp_Data_In <= Data_In;

Data_Out <= tmp_Data_Out;



u1:   Synchronizer port map (
		nRST => tmp_nRST,
		CLK => tmp_CLK,
		Data_In => tmp_Data_In,
		Data_Out => tmp_Data_Out
       );
end arch;
