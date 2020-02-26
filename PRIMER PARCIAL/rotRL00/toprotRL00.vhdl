library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagerotRL00.all;

entity toprotRL00 is
	port(
		  clk00: inout std_logic;
		  cdiv00: in std_logic_vector(4 downto 0);
		  ens0: in std_logic;
		  ins0: in std_logic_vector(7 downto 0);
		  outs0: out std_logic_vector(7 downto 0));
end toprotRL00;

architecture toprotRL0 of toprotRL00 is
begin
	SRL00: topdiv00 port map( oscout0 => clk00,
		indiv0 => cdiv00);
	
	SRL01: rotRL00 port map( clks => clk00,
							   ens => ens0,
							   ins => ins0,
							   outs => outs0);
end toprotRL0;