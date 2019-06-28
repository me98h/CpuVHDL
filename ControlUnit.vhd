	library IEEE;
use ieee.std_logic_1164.all;

entity ControlUnit is
port(
	clk, reset, run: in std_logic;
	order: in std_logic_vector(8 downto 0);
	setRI,setA,setG,done: out std_logic;
	setALU: out std_logic_vector(2 downto 0);
	setReg: out std_logic_vector(7 downto 0);
	selMux: out std_logic_vector(3 downto 0));
end ControlUnit;

architecture behavior of ControlUnit is

type state is (fetch,cycle1,cycle2,cycle3);
signal present_state, future_state: state;

begin

	-- REGISTRE D'ÉTAT
	state_reg: process(clk, reset)
	begin
		if reset='1' then
			present_state <= fetch;
		elsif rising_edge(clk) then
			present_state <= future_state;
		end if;
	end process;

	-- FONCTION DE TRANSITION
	transition_func: process(present_state, run, order)
	begin
		if (run='1') then
			
			case present_state is
                
                when fetch => future_state<=cycle1;
                
                when cycle1 =>  if(order(8 downto 6)="110" or order(8 downto 6)="111") then 
                                    if(run='1') then future_state<=fetch;
                                    else future_state<=cycle1;
                                    end if;
                                else future_state<=cycle2;
                                end if;
                
                when cycle2 => future_state<=cycle3;
                
                when cycle3 => if(run='1') then future_state<=fetch;
                               else future_state<=cycle3;
                               end if;
			end case;

		end if;
	end process;

	--FONCTION DE GÉNÉRATION
	generate_func: process(present_state, order)
	begin
        case present_state is
            
			when fetch => selMux<="1111";
						setReg<="00000000";
						setALU<="000";
						setA<='0'; 
						setG<='0';
						setRI<='1';
                        done<='0';
                        
            when cycle1 =>  if(order(8 downto 6)="110" or order(8 downto 6)="111") then -- MV / MVI
                                -- autorisation d'écriture dans Rx
                                if (order(5 downto 3)="000") then setReg<="00000001";
                                elsif (order(5 downto 3)="001") then setReg<="00000010";
                                elsif (order(5 downto 3)="010") then setReg<="00000100";
                                elsif (order(5 downto 3)="011") then setReg<="00001000";
                                elsif (order(5 downto 3)="100") then setReg<="00010000";
                                elsif (order(5 downto 3)="101") then setReg<="00100000";
                                elsif (order(5 downto 3)="110") then setReg<="01000000";
                                elsif (order(5 downto 3)="111") then setReg<="10000000";
                                end if;
                                -- si MVI on selection l'entreé order, sinon on sélectionne Ry
                                if(order(8 downto 6)="111") then selMux<="1111";
                                else
                                    if (order(2 downto 0)="000") then selMux<="0000";
                                    elsif (order(2 downto 0)="001") then selMux<="0001";
                                    elsif (order(2 downto 0)="010") then selMux<="0010";
                                    elsif (order(2 downto 0)="011") then selMux<="0011";
                                    elsif (order(2 downto 0)="100") then selMux<="0100";
                                    elsif (order(2 downto 0)="101") then selMux<="0101";
                                    elsif (order(2 downto 0)="110") then selMux<="0110";
                                    elsif (order(2 downto 0)="111") then selMux<="0111";
                                    end if;
                                end if;                                

                                setALU<="000";
                                setA<='0'; 
                                setG<='0';
                                setRI<='0'; 
                                done<='1';
                                
                            else -- Opération sur l'ALU (cycle 1)

                                -- selection de registre Rx
                                if (order(5 downto 3)="000") then selMux<="0000";
                                elsif (order(5 downto 3)="001") then selMux<="0001";
                                elsif (order(5 downto 3)="010") then selMux<="0010";
                                elsif (order(5 downto 3)="011") then selMux<="0011";
                                elsif (order(5 downto 3)="100") then selMux<="0100";
                                elsif (order(5 downto 3)="101") then selMux<="0101";
                                elsif (order(5 downto 3)="110") then selMux<="0110";
                                elsif (order(5 downto 3)="111") then selMux<="0111";
                                end if;
                                
                                setReg<="00000000";
                                setALU<="000";
                                setA<='1'; -- autorisation d'écriture dans A 
                                setG<='0';
                                setRI<='0';  
                                done<='0';

                            end if;
                                
							
			when cycle2 =>if (order(2 downto 0)="000") then selMux<="0000";
						elsif (order(2 downto 0)="001") then selMux<="0001";
						elsif (order(2 downto 0)="010") then selMux<="0010";
						elsif (order(2 downto 0)="011") then selMux<="0011";
						elsif (order(2 downto 0)="100") then selMux<="0100";
						elsif (order(2 downto 0)="101") then selMux<="0101";
						elsif (order(2 downto 0)="110") then selMux<="0110";
						elsif (order(2 downto 0)="111") then selMux<="0111";
						end if;

						setReg<="00000000";
						setALU<=order(8 downto 6); -- selection de l'opération dans l'alu
						setRI<='0';
						setA<='0';
						setG<='1';  -- autorisation d'écriture dans G
						done<='0';					

            when cycle3 =>selMux<="1000"; -- Selection de registre G
            
						if (order(5 downto 3)="000") then setReg<="00000001";
						elsif (order(5 downto 3)="001") then setReg<="00000010";
						elsif (order(5 downto 3)="010") then setReg<="00000100";
						elsif (order(5 downto 3)="011") then setReg<="00001000";
						elsif (order(5 downto 3)="100") then setReg<="00010000";
						elsif (order(5 downto 3)="101") then setReg<="00100000";
						elsif (order(5 downto 3)="110") then setReg<="01000000";
						elsif (order(5 downto 3)="111") then setReg<="10000000";
						end if;

						setALU<="000";
						setA<='0'; 
						setG<='0';
						setRI<='0'; 
                  		done<='1';
                        					
		end case;
	end process;

end architecture behavior;