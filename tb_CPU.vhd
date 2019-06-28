Library IEEE;
use ieee.std_logic_1164.all;

entity tb_CPU is
end entity;

ARCHITECTURE arch of tb_CPU IS

-- Déclaration de l'entité de la FSM

	component Proc is
	port(d_in: in std_logic_vector(15 downto 0);
		clk, reset, run: in std_logic;
		bus_out: out std_logic_vector(15 downto 0);
		done: out std_logic);
	end component;
	
	signal din_s:std_logic_vector(15 downto 0);
	signal clk_s,reset_s,run_s,done_s:std_logic;
	signal bus_out_s:std_logic_vector(15 downto 0);
	
	begin

		cpu:Proc
		port map (
			d_in=>din_s,
			clk=>clk_s,
			reset=>reset_s,
			run=>run_s,
			done=>done_s,
			bus_out=>bus_out_s
		);
		
		process
		begin

			clk_s <= '0';
			reset_s<='0';
			run_s<='1';

			din_s <= "1110000000000000"; -- mvi R0

			clk_s<='1';
			wait for 20 ns;
			clk_s<='0';

			din_s <= "0000000000000001"; -- din = 1

			clk_s<='1';
			wait for 20 ns;
			clk_s<='0';

			din_s <= "1110010000000000"; -- mvi R1

			clk_s<='1';
			wait for 20 ns;
			clk_s<='0';

			din_s <= "0000000000000010"; -- din = 2

			clk_s<='1';
			wait for 20 ns;
			clk_s<='0';

			din_s <= "0000000010000000"; -- add R0 R1
			
			clk_s<='1';
			wait for 20 ns;
			clk_s<='0';

			wait;
		end process;
	
END ARCHITECTURE;