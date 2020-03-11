library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packagekey00 is

	component topdiv00
		port(
			  cdiv0: in std_logic_vector(4 downto 0);
			  clk0: inout std_logic);
	end component;
	
	component contring00
		port(
			  clkr: in std_logic;
			  enr: in std_logic;
			  outr: out std_logic_vector(3 downto 0));
	end component;
	
	component coder00
		port(
			  clkc: in std_logic; -- puede que la quitemos al final
			  incontc: in std_logic_vector(3 downto 0);
			  inkeyc: in std_logic_vector(3 downto 0);
			  outcoder: out std_logic_vector(6 downto 0));
	end component;

end packagekey00;