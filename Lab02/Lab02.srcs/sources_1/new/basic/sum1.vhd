library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sum1 is
	port(
		A, B, Q: in STD_LOGIC;
		S,
		C: out STD_LOGIC
		);
end sum1;

architecture Structural of sum1 is

	component half_sum
		port(
			A, B: in STD_LOGIC;
			S,
			C: out STD_LOGIC
			);
	end component;
	
	component or2
		port(
			A, B: in STD_LOGIC;
			R: out STD_LOGIC
			);
	end component;
	
	signal A_B_sum, A_B_carry, A_B_Q_carry: STD_LOGIC;
	
begin
	U1: half_sum port map(A=>A, B=>B, S=>A_B_sum, C=>A_B_carry);
	U2: half_sum port map(A=>Q, B=>A_B_sum, S=>S, C=>A_B_Q_carry);
	U3: or2 port map(A=>A_B_Q_carry, B=>A_B_carry, R=>C);
end Structural;