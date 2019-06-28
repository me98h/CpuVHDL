library IEEE;
use ieee.std_logic_1164.all;

entity ALU_test is
	port(	SW: in std_logic_vector(9 downto 0);
			LEDR: out std_logic_vector(9 downto 0));
end ALU_test;

architecture behavior of ALU_test is
	component ALU is
		GENERIC (SIZE : positive := 16);
PORT(
	A,B : IN std_logic_vector(SIZE-1 DOWNTO 0);
	Sel: IN std_logic_vector(2 DOWNTO 0);
	S: OUT std_logic_vector(SIZE-1 DOWNTO 0);
	Cout : OUT std_logic
);	end component;
	
	begin
	ALU1: ALU  port map(A=>"0000000000000"&SW(9 downto 7), B=>"0000000000000"&SW(6 downto 4), sel=>SW(3 downto 1), Cout=>LEDR(9),
						S(8 downto 0)=>LEDR(8 downto 0));
end architecture behavior;