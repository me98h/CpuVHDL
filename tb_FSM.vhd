Library IEEE;
use ieee.std_logic_1164.all;

entity tb_FSM is
end entity;

ARCHITECTURE arch of tb_FSM IS

-- Déclaration de l'entité de la FSM
	component ControlUnit is
	port(
		clk, reset, run: in std_logic;
		order: in std_logic_vector(8 downto 0);
		setRI,setA,setG,done: out std_logic;
		setALU: out std_logic_vector(2 downto 0);
		setReg: out std_logic_vector(7 downto 0);
		selMux: out std_logic_vector(3 downto 0));
	end component;
	
	SIGNAL clk_s, reset_s,run_s: std_logic;
	SIGNAL setRI_s,setA_s,setG_s,done_s: std_logic;
	SIGNAL order_s:std_logic_vector(8 DOWNTO 0); 
	SIGNAL setALU_s:std_logic_vector(2 downto 0);
	SIGNAL setReg_s: std_logic_vector(7 downto 0);
	SIGNAL selMux_s:std_logic_vector(3 downto 0);

	begin

		fsm:ControlUnit
		port map (
			clk=>clk_s,
			reset=>reset_s,
			run=>run_s,
			order=>order_s,
			setRI=>setRI_s,
			setA=>setA_s,
			setG=>setG_s,
			done=>done_s,
			setALU=>setALU_s,
			setReg=>setReg_s,
			selMux=>selMux_s
		);
		
		process
		begin

			clk_s <= '0';
			reset_s<='0';
			run_s<='1';

			order_s <= "111000000"; -- mvi R0
			clk_s <= '1';
			wait for 20 ns;
			clk_s <= '0';

			order_s <= "111001000"; -- mvi R1
			clk_s <= '1';
			wait for 20 ns;
			clk_s <= '0';


			order_s <= "000000001"; -- add R0 R1
			clk_s <= '1';
			wait for 20 ns;
			clk_s <= '0';
					
			wait;
		end process;
	
END ARCHITECTURE;