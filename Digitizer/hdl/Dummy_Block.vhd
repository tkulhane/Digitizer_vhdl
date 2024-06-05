--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: Dummy_Block.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::PolarFire> <Die::MPF300TS_ES> <Package::FCG1152>
-- Author: <Name>
--
--------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;

entity Dummy_Block is
    generic
    (
        g_Num : natural := 384
    );
port (

	Data_In : IN  std_logic_vector(g_Num-1 downto 0);
    Data_Out : OUT std_logic_vector(g_Num-1 downto 0)

);
end Dummy_Block;
architecture architecture_Dummy_Block of Dummy_Block is


begin

    Data_Out <= Data_In;

end architecture_Dummy_Block;
