library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
 
entity adder8bitarith00 is
	port (
		Au : in  std_logic_vector(7 downto 0);
		Bu : in  std_logic_vector(7 downto 0);
		Sel : in  std_logic;
		Yu : out  std_logic_vector(7 downto 0)
	);
end adder8bitarith00;
 
architecture adder8bitarith0 of adder8bitarith00 is
 
begin
 
	Yu <= ( Au - Bu ) when Sel = '1' else ( Au + Bu );
 
end adder8bitarith0;