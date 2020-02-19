library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packageosc00.all;

entity osc00 is
    port(
        indiv0: in std_logic_vector(4 downto 0);
        oscout0 : inout std_logic
    );
end osc00;

architecture osc0 of osc00 is
    signal sclk: std_logic;
    begin
        OS00: oscint00 port map(osc_int => sclk);
		
        OS01: div00 port map(
            clkdiv => sclk,
            indiv => indiv0,
            outdiv => oscout0
        );        
end osc0;