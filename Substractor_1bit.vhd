LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Substractor_1bit IS
PORT(
	A,B,Cin : IN std_logic;
	S, Cout : OUT std_logic
);
END Substractor_1bit;

ARCHITECTURE behavior OF Substractor_1bit IS

SIGNAL s1 : std_logic_vector(2 DOWNTO 0);
SIGNAL s2 : std_logic_vector(1 DOWNTO 0);

BEGIN

	s1 <= A & B & Cin;

	WITH s1 SELECT
		 s2 <=	"00" when "000",
				"10" when "100",
				"11" when "010",
				"11" when "001",
				"00" when "110",
				"00" when "101",
				"01" when "011",
				"11" when "111";

  	S <= s2(0);
	Cout <= s2(1);

END behavior;
