LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ALU IS
GENERIC (SIZE : positive := 16);
PORT(
	A,B : IN std_logic_vector(SIZE-1 DOWNTO 0);
	Sel: IN std_logic_vector(2 DOWNTO 0);
	S: OUT std_logic_vector(SIZE-1 DOWNTO 0);
	Cout : OUT std_logic
);
END ALU;

ARCHITECTURE behavior OF ALU IS

  Component FAdder_Nbits IS
	GENERIC (SIZE : positive := 16);
  PORT(
    A, B : IN std_logic_vector(SIZE-1 DOWNTO 0);
    Cin : IN std_logic;
    S : OUT std_logic_vector(SIZE-1 DOWNTO 0);
    Cout : OUT std_logic
  );
  END Component;

  Component Substractor_nbits IS
  GENERIC(SIZE : positive := 4);
  PORT(
    A,B : IN std_logic_vector(0 TO SIZE-1);
    Cin : IN std_logic;
    S : OUT std_logic_vector(0 TO SIZE-1);
    Cout : OUT std_logic
  );
  END Component;

  SIGNAL in1, in2 : std_logic_vector(15 DOWNTO 0);
  SIGNAL addOut, subOut, multOut : std_logic_vector(15 DOWNTO 0);
	SIGNAL Cadd, Csub : std_logic;

BEGIN

	add : FAdder_Nbits GENERIC MAP(SIZE => 16) PORT MAP(A=>A, B=>B, Cin=>'0', S=>addOut, Cout=>Cadd);
	sub : Substractor_nbits GENERIC MAP(16) PORT MAP(A=>A, B=>B, Cin=>'0', S=>subOut, Cout=>Csub);

  PROCESS(A, B, addOut, subOut, multOut)
	BEGIN
		CASE(Sel) IS
			WHEN "000" => S <= addOut; --ADD
			WHEN "001" => S <= subOut; --SUB
	--	WHEN "010" => S <= multOut; --MULT
			WHEN "011" => S <= A and B; --AND
			WHEN "100" => S <= A or B; --OR
			WHEN "101" => S <= not A; --NOT
			WHEN OTHERS => S <= "0000000000000000";
		END CASE;
	END PROCESS;

END behavior;
