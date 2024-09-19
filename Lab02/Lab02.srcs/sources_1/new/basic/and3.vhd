library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and3 is
	port(
		A, B, C: in STD_LOGIC;
		R: out STD_LOGIC
		);
end and3;

architecture Structural of and3 is

	component and2
		port(
			A, B: in STD_LOGIC;
			R: out STD_LOGIC
			);
	end component;

	signal and2_connector: STD_LOGIC;

begin
	U1:	and2 port map(A, B, and2_connector);
	U2: and2 port map(C, and2_connector, R);
end Structural;