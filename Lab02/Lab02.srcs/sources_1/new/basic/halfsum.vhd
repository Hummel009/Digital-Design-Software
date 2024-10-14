library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity halfsum is
	port(
		A: in STD_LOGIC;
		B: in STD_LOGIC;
		S: out STD_LOGIC;
		P: out STD_LOGIC
	);
end halfsum;

architecture struct of halfsum is

	component and2
		port(
			A, B: in std_logic;
			Z: out std_logic
		);
	end component;

	component inv
		port(
			A: in std_logic;
			nA: out std_logic
		);
	end component;

	component or2
		port(
			A, B: in std_logic;
			Z: out std_logic
		);
	end component;

	signal AorB, AB, nAB: std_logic;

begin
	OR_1: or2 port map (A, B, AorB);
	AND_1: and2 port map (A, B, AB);
	AND_2: and2 port map (AorB, nAB, S);
	NOT_1: inv port map (AB, nAB);
	P <= AB;
end struct;

architecture beh of halfsum is
begin
	P <= A and B;
	S <= (A or B) and not (A and B);
end beh;