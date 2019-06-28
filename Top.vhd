library IEEE;
use ieee.std_logic_1164.all;

entity Top is
	PORT( LEDR:OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
			SW:IN STD_LOGIC_VECTOR(9 DOWNTO 0); 
			KEY:IN STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
end Top;

architecture behavior of Top is
	component Proc is
		port(d_in: in std_logic_vector(15 downto 0);
			clk, reset, run: in std_logic;
			bus_out: out std_logic_vector(15 downto 0);
			done: out std_logic);
	end component;
	
	begin
	Processor: Proc port map(d_in(15 downto 7)=>SW(9 downto 1), clk=> not KEY(0), reset=> not KEY(1), run=>SW(0),
						bus_out(15 downto 7)=>LEDR(9 downto 1), done=>LEDR(0));
end architecture behavior;