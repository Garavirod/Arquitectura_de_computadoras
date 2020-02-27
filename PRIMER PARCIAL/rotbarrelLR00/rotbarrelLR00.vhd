library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library lattice;
use lattice.all;

entity rotbarrelLR00 is
	port
	(
		clksLR: in std_logic;
		ens: in std_logic;
		ins: in std_logic_vector(7 downto 0);
		notimes: in std_logic_vector(3 downto 0);
		outs: out std_logic_vector(7 downto 0)
	);
end rotbarrelLR00;

architecture rotbarrelLR0 of rotbarrelLR00 is
signal sins: std_logic_vector(7 downto 0);
signal snotimes: std_logic_vector(3 downto 0);
begin
	psLR: process(clksLR)
	begin
		if(clksLR'event and clksLR = '1') then
			case ens is
				when '0' => 
					outs <= (others => '0');
					sins <= ins;
					snotimes <= notimes + '1';
				when '1' =>
					if (snotimes > 0) then
						sins(7) <= sins(0);
						sins(6 downto 0) <= sins(7 downto 1);
						outs <= sins;
						snotimes <= snotimes - '1';		
					end if;
				when others => null;
			end case;
		end if;
	end process psLR;
end rotbarrelLR0;