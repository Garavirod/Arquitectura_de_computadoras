library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity lcdConfig00 is
  port(
       clkcf: in std_logic;
	   enablecf: in std_logic;
	   inFlagcf: in std_logic;
	   incontcf: in std_logic_vector(4 downto 0);
	   commandcf: out std_logic_vector(7 downto 0);
	   outFlagcf: out std_logic;
	   RWcf: out std_logic;
	   RScf: out std_logic;
	   ENcf: out std_logic);
end lcdConfig00;

architecture lcdConfig0 of lcdConfig00 is
begin
  pconfig: process(clkcf)
  begin
    if (clkcf'event and clkcf = '1') then
	  case enablecf is
	    when '0' =>
		  commandcf <= "00000000";
		  outFlagcf <= '0';
		  RWcf <= '0';
		  RScf <= '0';
		  ENcf <= '0';
		when '1' =>
          if (inFlagcf = '1') then
			  case incontcf is
			    when "00000" =>
				  commandcf <= "00000001";--CLEAR SCREEN
				  outFlagcf <= '0';
				  RWcf <= '0';
				  RScf <= '0';
				  ENcf <= '1';
				when "00001" =>
				  commandcf <= "00000001";--CLEAR SCREEN
				  outFlagcf <= '0';
				  RWcf <= '0';
				  RScf <= '0';
				  ENcf <= '0';
			    when "00010" =>
				  commandcf <= "00000011";--CURSOR RETURN
				  outFlagcf <= '0';
				  RWcf <= '0';
				  RScf <= '0';
				  ENcf <= '1';
				when "00011" =>
				  commandcf <= "00000011";-- CURSOR RETURN
				  outFlagcf <= '0';
				  RWcf <= '0';
				  RScf <= '0';
				  ENcf <= '0';
			    when "00100" =>
				  commandcf <= "00000110";--INPUT SET
				  outFlagcf <= '0';
				  RWcf <= '0';
				  RScf <= '0';
				  ENcf <= '1';
				when "00101" =>
				  commandcf <= "00000110";--INPUT SET
				  outFlagcf <= '0';
				  RWcf <= '0';
				  RScf <= '0';
				  ENcf <= '0';
			    when "00110" =>
				  commandcf <= "00001111";--DISPLAY SWITCH
				  outFlagcf <= '0';
				  RWcf <= '0';
				  RScf <= '0';
				  ENcf <= '1';
				when "00111" =>
				  commandcf <= "00001111";--DISPLAY SWITCH
				  outFlagcf <= '0';
				  RWcf <= '0';
				  RScf <= '0';
				  ENcf <= '0';
			    when "01000" =>
				  commandcf <= "00011100";--SHIFT
				  outFlagcf <= '0';
				  RWcf <= '0';
				  RScf <= '0';
				  ENcf <= '1';
				when "01001" =>
				  commandcf <= "00011100";--SHIFT
				  outFlagcf <= '0';
				  RWcf <= '0';
				  RScf <= '0';
				  ENcf <= '0';
			    when "01010" =>
				  commandcf <= "00111100";--FUNCTION SET
				  outFlagcf <= '0';
				  RWcf <= '0';
				  RScf <= '0';
				  ENcf <= '1';
				when "01011" =>
				  commandcf <= "00111100";--FUNCTION SET
				  outFlagcf <= '0';
				  RWcf <= '0';
				  RScf <= '0';
				  ENcf <= '0';
			    when "01100" =>
				  commandcf <= "10000000";--DDRAM AD SET
				  outFlagcf <= '0';
				  RWcf <= '0';
				  RScf <= '0';
				  ENcf <= '1';
				when "01101" =>
				  commandcf <= "10000000";--DDRAM AD SET
				  outFlagcf <= '1';
				  RWcf <= '0';
				  RScf <= '0';
				  ENcf <= '0';
				when others => null;
			  end case; 
		  end if;
		when others => null;
	  end case;
	end if;
  end process;
end lcdConfig0;