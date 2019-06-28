LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY FAdder_Nbits IS
	GENERIC (SIZE : INTEGER := 16);
	PORT (
		A, B : IN STD_LOGIC_VECTOR(SIZE - 1 DOWNTO 0);
		Cin : IN STD_LOGIC;
		Cout : OUT STD_LOGIC;
		S : OUT STD_LOGIC_VECTOR(SIZE - 1 DOWNTO 0));
END FAdder_Nbits;

ARCHITECTURE Behavior OF FAdder_Nbits IS
	SIGNAL C: STD_LOGIC_VECTOR(SIZE - 2 DOWNTO 0); -- Last in Cout
	COMPONENT FAdder_1bit
		PORT (
		A, B, Cin : IN STD_LOGIC;
		Cout, S : OUT STD_LOGIC);
	END COMPONENT;
BEGIN
	adders : FOR i IN 0 TO SIZE - 1 GENERATE
		cas_0 : IF (i = 0) GENERATE
				ad_0 : FAdder_1bit PORT MAP (A(0), B(0), Cin, C(i), S(0));
				END GENERATE ;
		cas_i : IF (i > 0) and (i < SIZE - 1) GENERATE
				ad_i : FAdder_1bit PORT MAP (A(i), B(i), C(i - 1), C(i), S(i));
				END GENERATE ;
		cas_n : IF (i = SIZE - 1) GENERATE
				ad_n : FAdder_1bit PORT MAP (A(i), B(i), C(i - 1), Cout, S(i));
				END GENERATE ;
	END GENERATE ;
END Behavior;
