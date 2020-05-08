library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity lcdContData00 is
  port(
       clkcd: in std_logic;
	   resetcd: in std_logic;
	   inFlagcd: in std_logic;
	   RWcd: out std_logic;
	   RScd: out std_logic;
	   ENcd: out std_logic;
	   outcontcd: inout std_logic_vector(4 downto 0));
end lcdContData00;

architecture lcdContData0 of lcdContData00 is
begin
  pcontcd: process(clkcd)
  variable aux: bit:='0';
  begin
    if (clkcd'event and clkcd = '1') then
	  case resetcd is
	    when '0' =>
		  outcontcd <= (others => '0');
		when '1' =>
		  case inFlagcd is
		    when '0' =>
			  outcontcd <= (others => '0'); 
			when '1' =>
			  if ((outcontcd < "01110")and(aux = '0')) then
			     aux:='1';
				 outcontcd <= outcontcd + '1';
				 RWcd <= '0';
				 RScd <= '1';
				 ENcd <= '1';
			  elsif ((outcontcd < "01110")and(aux = '1')) then
				 aux:='0';
				 outcontcd <= outcontcd;
				 RWcd <= '0';
				 RScd <= '1';
				 ENcd <= '0';				 
			  end if;
			when others => null;
		  end case;
		when others => null;
	  end case;
	end if;
  end process pcontcd;
end lcdContData0;