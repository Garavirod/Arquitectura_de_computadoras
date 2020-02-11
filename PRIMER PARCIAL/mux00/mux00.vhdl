library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity mux00 is
	port(
		Ax: in std_logic_vector (7 downto 0);
		Bx: in std_logic_vector (7 downto 0);
		Sx : in std_logic_vector (2 downto 0); --SELECTOR
		Yx : out std_logic_vector (7 downto 0) --SALIDA MULTIPLEXOR
	);
end mux00;


architecture mux0 of mux00 is begin
	with Sx select 
		Yx <= Ax and Bx when "001", --AB
			 Ax or Bx when "011",   --A+B
			 Ax xor Bx when "010",  --Diferentes 1
			 Ax nand Bx when "110", --!(AB)
			 Ax nor Bx when "100",  -- !(A+B)
			 Ax xnor Bx when "101", -- Diferentes 0
			 not (Bx) when "111", 
			"00000000" when others;
end mux0;