library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sum1 is
	port(
		A: in STD_LOGIC;
		B: in STD_LOGIC;
		P0: in STD_LOGIC;
		S: out STD_LOGIC;
		P: out STD_LOGIC
	);
end sum1;

architecture Behavioral of sum1 is

	component halfsum
		port(
			A, B: in std_logic;
			S, P: out std_logic
		);
	end component;

	component or2
		port(
			A, B: in std_logic;
			R: out std_logic
		);
	end component;

	signal S1, P1, P2: std_logic;

begin
	SUM_1: halfsum port map(A, B, S1, P1);
	SUM_2: halfsum port map(S1, P0, S, P2);
	OR_1: or2 port map(P2, P1, P);
end Behavioral;