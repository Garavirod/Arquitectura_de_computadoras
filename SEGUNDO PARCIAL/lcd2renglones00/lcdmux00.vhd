library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity lcdmux00 is
  port(
       enablem: in std_logic;
	   inFlagm: in std_logic;
	   inWordConfigm: in std_logic_vector(7 downto 0);
	   inWordDatam: in std_logic_vector(7 downto 0);
	   RWcfm, RScfm, ENcfm: in std_logic;
	   RWcdm, RScdm, ENcdm: in std_logic;
	   outWordm: out std_logic_vector(7 downto 0);
	   RWm, RSm, ENm: out std_logic);
end lcdmux00;

architecture lcdmux0 of lcdmux00 is
signal control: std_logic_vector(1 downto 0);
begin
control <= (enablem)&(inFlagm);
  with control select
    outWordm <= "10101010" when "00",
	             inWordConfigm when "10",
				 inWordDatam when "11",
				 "10101010" when others;
  with control select
      RWm <= '0' when "00",  
	         RWcfm when "10",
			 RWcdm when "11",
			 '0' when others;
  with control select
      RSm <= '0' when "00",
	         RScfm when "10",
			 RScdm when "11",
			 '0' when others;
  with control select
     ENm <= '0' when "00",
	        ENcfm when "10",
			ENcdm when "11",
			'0' when others;
end lcdmux0;