library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packageword00.all;

entity word00 is
	port(
		clk0: inout std_logic;
		cdiv0: in std_logic_vector(4 downto 0);
		en0: in std_logic;
		outtransist0: inout std_logic_vector(3 downto 0);
		outdisplay0: out std_logic_vector(6 downto 0));
end word00;

architecture word0 of word00 is
begin
	W00: osc00 port map(oscout0 => clk0,
						 indiv0 => cdiv0);
	
	w01: contring00 port map(clkcr => clk0,
							  encr => en0,
							  outcr => outtransist0);
	
	W02: coder00 port map(incontcd => outtransist0,
						   outcd => outdisplay0);
end word0;