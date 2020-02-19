library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;


entity word00 is
	port(
		clk0: inout std_logic;
		cdiv0: in std_logic_vector(4 downto 0);
		encr: in std_logic;
		outtransist0: out std_logic_vector(3 downto 0);
		outdisplay0: out std_logic_vector(6 downto 0)
	);
	
end word00;


architecture word0 of word00 is
begin
	--W00: osc00 port map();
	--W01: contring00 port map();
	--W02: coder00 port map();
end word0;