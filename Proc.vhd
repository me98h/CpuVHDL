library IEEE;
use ieee.std_logic_1164.all;

entity Proc is 
port(d_in: in std_logic_vector(15 downto 0);
	clk, reset, run: in std_logic;
	bus_out: out std_logic_vector(15 downto 0);
	done: out std_logic);
end Proc;

architecture behavior of Proc is
	--Composants:
	component ControlUnit is
		port(
			clk, reset, run: in std_logic;
			order: in std_logic_vector(8 downto 0);
			setRI,setA,setG,done: out std_logic;
			setALU: out std_logic_vector(2 downto 0);
			setReg: out std_logic_vector(7 downto 0);
			selMux: out std_logic_vector(3 downto 0));
		end component;

	component MUX is
		port(DIN, R0, R1, R2, R3, R4, R5, R6, R7, G	: in STD_LOGIC_VECTOR(15 DOWNTO 0);
			Sel: in STD_LOGIC_VECTOR(3 DOWNTO 0);  
			S : out	STD_LOGIC_VECTOR(15 DOWNTO 0));
	end component;
	
	component Register_Nbits is
		generic(N : integer := 16);
		port(D : IN std_logic_vector(N-1 downto 0);
			Resetn, CLK, SET : IN std_logic;
			Q : OUT std_logic_vector(N-1 downto 0));
	end component;

	component ALU is
		port(A,B : in std_logic_vector(16-1 DOWNTO 0);
			Sel: in std_logic_vector(2 DOWNTO 0);
			S: out std_logic_vector(16-1 DOWNTO 0);
			Cout : out std_logic);
	end component;
	
	--Signaux:
	signal irs_sig, as_sig, gs_sig, cout: std_logic;
	signal alu_sig: std_logic_vector(2 downto 0);
	signal bussel_sig: std_logic_vector(3 downto 0);
	signal regsel_sig: std_logic_vector(7 downto 0);
	signal ir_sig: std_logic_vector(8 downto 0);
	signal reg_sig, a_sig, g_sig: std_logic_vector(15 downto 0);
	signal reg0MUX, reg1MUX, reg2MUX, reg3MUX, reg4MUX, reg5MUX, reg6MUX, reg7MUX, gMUX_sig: std_logic_vector(15 downto 0);
	
	begin
		
	--Unité de contôle:
	control_unit: ControlUnit port map(clk=>clk, reset=>reset, run=>run,order=>ir_sig,
									   setRI=>irs_sig, setA=>as_sig,setG=>gs_sig, done=>done, 
									   setALU=>alu_sig, setReg=>regsel_sig, selMux=>bussel_sig);
	
	--Multiplexeur:
	MUX1: MUX port map(DIN=>d_in, R0=>reg0MUX, R1=>reg1MUX, R2=>reg2MUX, R3=>reg3MUX,
					   R4=>reg4MUX, R5=>reg5MUX, R6=>reg6MUX, R7=>reg7MUX, G=>gMUX_sig,
					   Sel=>bussel_sig, S=>reg_sig);

	--Banc de registres:
	reg_0: Register_Nbits generic map(N => 16) port map(D=>reg_sig, Resetn=>'0', CLK=>clk, 
											   SET=>regsel_sig(0), Q=>reg0MUX);

	reg_1: Register_Nbits generic map(N => 16) port map(D=>reg_sig, Resetn=>'0', CLK=>clk, 
											   SET=>regsel_sig(1), Q=>reg1MUX);

	reg_2: Register_Nbits generic map(N => 16) port map(D=>reg_sig, Resetn=>'0', CLK=>clk, 
											   SET=>regsel_sig(2), Q=>reg2MUX);

	reg_3: Register_Nbits generic map(N => 16) port map(D=>reg_sig, Resetn=>'0', CLK=>clk, 
											   SET=>regsel_sig(3), Q=>reg3MUX);

	reg_4: Register_Nbits generic map(N => 16) port map(D=>reg_sig, Resetn=>'0', CLK=>clk, 
											   SET=>regsel_sig(4), Q=>reg4MUX);

	reg_5: Register_Nbits generic map(N => 16) port map(D=>reg_sig, Resetn=>'0', CLK=>clk, 
											   SET=>regsel_sig(5), Q=>reg5MUX);

	reg_6: Register_Nbits generic map(N => 16) port map(D=>reg_sig, Resetn=>'0', CLK=>clk, 
											   SET=>regsel_sig(6), Q=>reg6MUX);

	reg_7: Register_Nbits generic map(N => 16) port map(D=>reg_sig, Resetn=>'0', CLK=>clk, 
											   SET=>regsel_sig(7), Q=>reg7MUX);

	--Registre d'instructions:
	reg_ir: Register_Nbits generic map(N => 9) port map(D=>d_in(15 downto 7), Resetn=>'0', CLK=>clk, 
											   SET=>irs_sig, Q(8 downto 0)=>ir_sig(8 downto 0));
	--Registre A:
	reg_A: Register_Nbits generic map(N => 16) port map(D=>reg_sig, Resetn=>'0', CLK=>clk, 
									SET=>as_sig, Q=>a_sig);
	--Registre G:
	reg_G: Register_Nbits generic map(N => 16) port map(D=>g_sig, Resetn=>'0', CLK=>clk, 
									SET=>gs_sig, Q=>gMUX_sig);
	--ALU:
	ALUnit: ALU port map(A=>a_sig, B=>reg_sig, Sel=>alu_sig, S=>g_sig, Cout=>cout);
	
	--Sortie:
	bus_out <= reg_sig;
	
	
end architecture behavior;