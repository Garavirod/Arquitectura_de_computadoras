library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity xnoradd is
	port
	(
		Axn: in std_logic;
		Bxn: in std_logic;
		Yxn: out std_logic
	);
end xnoradd;

architecture xnorad of xnoradd is
begin
	Yxn <= Axn xnor Bxn;
end xnorad;