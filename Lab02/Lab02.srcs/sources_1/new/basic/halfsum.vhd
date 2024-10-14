library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity halfsum is
	port(
		A, B: in STD_LOGIC;
		S, P: out STD_LOGIC
	);
end halfsum;

architecture Structural of halfsum is

	component and2
		port(
			A, B: in STD_LOGIC;
			Z: out STD_LOGIC
		);
	end component;

	component inv
		port(
			A: in STD_LOGIC;
			nA: out STD_LOGIC
		);
	end component;

	component or2
		port(
			A, B: in STD_LOGIC;
			Z: out STD_LOGIC
		);
	end component;

	signal AorB, AB, nAB: STD_LOGIC;

begin
	OR_1: or2 port map (A, B, AorB);
	AND_1: and2 port map (A, B, AB);
	AND_2: and2 port map (AorB, nAB, S);
	NOT_1: inv port map (AB, nAB);
	P <= AB;
end Structural;

architecture Behavioral of halfsum is
begin
	P <= A and B;
	S <= (A or B) and not (A and B);
end Behavioral;