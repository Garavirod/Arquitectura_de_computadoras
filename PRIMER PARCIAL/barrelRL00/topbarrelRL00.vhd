library ieee;
use ieee.std_logic_1164.all;

library lattice;
use lattice.all;

use packagebarrelRL00.all;

entity topbarrelRL00 is 
	port
	(
		clk0: inout std_logic;
		cdiv0: in std_logic_vector(4 downto 0);
		ens0: in std_logic;
		ins0: in std_logic_vector(7 downto 0);
		notimes0: in std_logic_vector(3 downto 0);
		outs0: out std_logic_vector(7 downto 0)
	);
end topbarrelRL00;

architecture topbarrelRL0 of topbarrelRL00 is
begin
	SRL00: topdiv00 port map
	(
		indiv0 => cdiv0,
		oscout0 => clk0
	);
	
	SRL01: barrelRL00 port map
	(
		clksRL => clk0,
		ens => ens0,
		ins => ins0,
		notimes => notimes0,
		outs => outs0
	);
end topbarrelRL0; 