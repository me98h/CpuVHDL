LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY FAdder_1bit IS
  PORT(
    A, B, Cin : IN std_logic;
    S, Cout : OUT std_logic
  );
END FAdder_1bit;

ARCHITECTURE behavior OF FAdder_1bit IS

BEGIN
  S <= A xor B xor Cin;
  Cout <= (A and B) or ((A xor B) and Cin);
END behavior;
