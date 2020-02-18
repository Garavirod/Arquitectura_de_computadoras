library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packageshiftRL00.all;

entity topshiftRL00 is
	port(
		clk0: inout std_logic;
		cdiv0: in std_logic_vector (4 downto 0);
		ens0: in std_logic;
		ins0: in std_logic_vector( 7 downto 0);
		outs0: out std_logic_vector (7 downto 0)
	);
end topshiftRL00;


architecture topshiftRL0 of topshiftRL00 is
begin
	SRL00: osc00 port map(
		oscout0 => clk0,
		indiv0 => cdiv0
	);
	
	SRL01: shiftLR00 port map(
		clks => clk0,
		ens => ens0,
		ins => ins0,
		outs => outs0
	);
end topshiftRL0;

