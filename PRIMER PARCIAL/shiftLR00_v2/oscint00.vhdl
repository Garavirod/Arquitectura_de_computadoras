-- NOMBRE DEL FOLDER DE PROYECTO osc00, ocs0
-- nombrar el anterior pack otro como oscint00

-- archivo oscint00

library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
-- library matchxo2;  // estan en la de lattice
-- use matchxo2.all;

entity oscint00 is
	port (
			osc_int: out std_logic);
end oscint00;

architecture oscint0 of oscint00 is
	COMPONENT OSCH
		GENERIC  (NOM_FREQ: string := "2.08");
		PORT ( STDBY:IN std_logic;
			   OSC:OUT std_logic;
		       SEDSTDBY:OUT std_logic);
	END COMPONENT; 
    
	attribute NOM_FREQ : string;
	attribute NOM_FREQ of OSCinst0 : label is "2.08";

begin
	-- STDBY si es 0 esta activa, si es 1 esta OFF.
	OSCInst0: OSCH
	GENERIC MAP( NOM_FREQ  => "2.08" )
	PORT MAP ( STDBY => '0',
			   OSC => osc_int);

end oscint0;


