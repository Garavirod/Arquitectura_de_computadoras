library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity coder00 is
	port(
		  clkc: in std_logic; -- puede que la quitemos al final
		  incontc: in std_logic_vector(3 downto 0);
		  inkeyc: in std_logic_vector(3 downto 0);
		  outcoder: out std_logic_vector(6 downto 0));
end coder00;

architecture coder0 of coder00 is
begin
	pcoder: process (clkc)
	variable aux: bit:='0';
	variable aux1: bit:='0';
	variable aux2: bit:='0';
	variable aux3: bit:='0';
	variable aux4: bit:='0';
	begin
		if(clkc'event and clkc = '1') then
			case incontc is
				when "1000" =>  -- incontc 
					case inkeyc is
						when "0000" =>
							aux:= '0';
							aux1:= '0';
						when "0001" =>
							if(aux = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0') then
								aux:= '1'; --resolviendo problema del rebote
								aux1:= '1';
								outcoder <= "1001111"; -- 1
							end if;
						when "0010" =>
							if(aux = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0') then
								aux:= '1';
								aux1:= '1';
								outcoder <= "0010010"; -- 2
							end if;
						when "0100" =>
							if(aux = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0') then
								aux:= '1'; 
								aux1:= '1';
								outcoder <= "0000110"; -- 3
							end if;
						when "1000" =>
							if(aux = '0' and aux2 = '0' and aux3 = '0' and aux4 = '0') then
								aux:= '1';
								aux1:= '1';
								outcoder <= "0001000"; -- A
							end if;
						when others => null;
					end case;
				
				when "0100" => -- incontc
					case inkeyc is
						when "0000" =>
							aux:= '0';
							aux2:= '0';
						when "0001" =>
							if(aux = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0') then
								aux:= '1'; 
								aux2:= '1';
								outcoder <= "1001100"; -- 4
							end if;
						when "0010" =>
							if(aux = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0') then
								aux:= '1';
								aux2:= '1';
								outcoder <= "0100100"; -- 5
							end if;
						when "0100" =>
							if(aux = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0') then
								aux:= '1';
								aux2:= '1';
								outcoder <= "0100000"; -- 6
							end if;
						when "1000" =>
							if(aux = '0' and aux1 = '0' and aux3 = '0' and aux4 = '0') then
								aux:= '1';
								aux2:= '1';								
								outcoder <= "1100000"; -- b
							end if;
						when others => null;
					end case;
					
				when "0010" => -- incontc
					case inkeyc is
						when "0000" =>
							aux:= '0';
							aux3:= '0';
						when "0001" =>
							if(aux = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0') then
								aux:= '1';
								aux3:= '1';
								outcoder <= "0001111"; -- 7
							end if;
						when "0010" =>
							if(aux = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0') then
								aux:= '1';
								aux3:= '1';
								outcoder <= "0000000"; -- 8
							end if;
						when "0100" =>
							if(aux = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0') then
								aux:= '1';
								aux3:= '1';
								outcoder <= "0000100"; -- 9
							end if;
						when "1000" =>
							if(aux = '0' and aux1 = '0' and aux2 = '0' and aux4 = '0') then
								aux:= '1';
								aux3:= '1';
								outcoder <= "0110001"; -- C
							end if;
						when others => null;
					end case;
					
				when "0001" => -- incontc
					case inkeyc is
						when "0000" =>
							aux:= '0';
							aux4:= '0';
						when "0001" =>
							if(aux = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0') then
								aux:= '1';
								aux4:= '1';
								outcoder <= "0011100"; -- *
							end if;
						when "0010" =>
							if(aux = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0') then
								aux:= '1';
								aux4:= '1';
								outcoder <= "0000001"; -- 0
							end if;
						when "0100" =>
							if(aux = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0') then
								aux:= '1';
								aux4:= '1';
								outcoder <= "1100010"; -- +
							end if;
						when "1000" =>
							if(aux = '0' and aux1 = '0' and aux2 = '0' and aux3 = '0') then
								aux:= '1';
								aux4:= '1';
								outcoder <= "1111110"; -- -
							end if;
						when others => null;
					end case;
					
				when others => outcoder <= "1111111";
			end case;
		end if;
	end process pcoder;
end coder0;