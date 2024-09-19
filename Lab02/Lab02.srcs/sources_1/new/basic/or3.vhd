library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or3 is
	port(
		A, B, C: in STD_LOGIC;
		R: out STD_LOGIC
	);
end or3;

architecture Structural of or3 is

	component or2
		port(
			A, B: in STD_LOGIC;
			R: out STD_LOGIC
		);
	end component;

	signal or2_connector: STD_LOGIC;

begin
	U1:	or2 port map(A, B, or2_connector);
	U2: or2 port map(C, or2_connector, R);
end Structural;