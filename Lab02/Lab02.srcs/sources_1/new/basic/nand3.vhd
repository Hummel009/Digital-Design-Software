library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nand3 is
	port(
		A, B, C: in STD_LOGIC;
		R: out STD_LOGIC
		);
end nand3;

architecture Structural of nand3 is

	component and3
		port(
			A, B, C: in STD_LOGIC;
			R: out STD_LOGIC
		);
	end component;

	component inv
		port(
			A: in STD_LOGIC;
			nA: out STD_LOGIC
		);
	end component;

	signal original: STD_LOGIC;

begin
	U1:	and3 port map(A, B, C, original);
	U2: inv port map(original, R);
end Structural;