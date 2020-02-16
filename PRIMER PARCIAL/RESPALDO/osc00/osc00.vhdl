library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packageosc00.all;

entity oscoo is
    port(
        indiv0: in std_logic_vector(4 downto 0);
        osccout0 : inout std_logic
    );

end oscoo;

architecture osc0 of osc00 is
    signal sclk: std_logic;
    begin
        os00: oscint00 port map(
            osc_int=>sclk
        );
        os01: div00 port map(
            clkdiv => sclk,
            intdiv => intdiv0,
            outdiv => oscout0
        );
        
end osc0;