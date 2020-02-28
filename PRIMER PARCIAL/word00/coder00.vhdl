library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity coder00 is
	port(
		incontcd: in std_logic_vector(3 downto 0);
		outcd: out std_logic_vector(6 downto 0));
end coder00;

architecture coder0 of coder00 is
begin

	with incontcd select
		outcd <= "1110111" when "0001",
				 "0001110" when "0010",
				 "1111110" when "0100",
				 "0110111" when "1000",
				 "0000000" when others;

end coder0;