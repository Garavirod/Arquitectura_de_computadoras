library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity contrim00 is
    port(
        clkcr: in std_logic;
		encr: in std_logic;
		outcr : out std_logic_vector (3 downto 0)
    );

end contrim00;

architecture contrim0 of contrim00 is 
    signal sring: std_logic_vector (3 downto 0);
begin
    pring: process (clkcr)
	begin
		if (clkcr'event and clkcr ='1') then
			case encr is
				when '0' =>
					sring <= "1110";
					outcr <= "1111";
				when '1' =>
					sring(0) <=sring(3);
					sring(3 downto 1) <= sring (2 downto 0);
					outcr <= sring;
				when others => null;
			end case;
		end if;
	end process pring;
end contrim0;