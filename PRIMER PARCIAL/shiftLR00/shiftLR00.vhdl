library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;


entity shiftLR00 is
    port(
        clks : in std_logic;
        ens: in std_logic;
        ins : in std_logic_vector(7 downto 0);
        outs : out std_logic_vector(7 downto 0)
    );
end shiftLR00;


architecture shiftLR0 of shiftLR00 is
begin
    pshiftRL: process(clks)
    begin
        --if (clks'event clks = '1') then
            
        --end if;
    end process pshiftRL;
end shiftLR0;