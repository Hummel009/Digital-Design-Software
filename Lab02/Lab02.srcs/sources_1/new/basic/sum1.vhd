library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sum1 is
	port(
		A, B, P0: in STD_LOGIC;
		S, P: out STD_LOGIC
	);
end sum1;

architecture Behavioral of sum1 is

	component halfsum
		port(
			A, B: in STD_LOGIC;
			S, P: out STD_LOGIC
		);
	end component;

	component or2
		port(
			A, B: in STD_LOGIC;
			R: out STD_LOGIC
		);
	end component;

	signal S1, P1, P2: STD_LOGIC;

begin
	SUM_1: halfsum port map(A, B, S1, P1);
	SUM_2: halfsum port map(S1, P0, S, P2);
	OR_1: or2 port map(P2, P1, P);
end Behavioral;