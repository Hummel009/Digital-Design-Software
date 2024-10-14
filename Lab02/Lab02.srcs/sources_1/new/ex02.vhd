library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex02 is
	port(
		A, B, A1, B1, S: in STD_LOGIC;
		Q1, Q2: out STD_LOGIC
	);
end ex02;

architecture Structural of ex02 is

	component mux_ex01 is
		port(
			A, B, S: in STD_LOGIC;
			Q: out STD_LOGIC
		);
	end component;

begin
	U1: mux_ex01 port map(A, B, S, Q1);
	U2: mux_ex01 port map(A1, B1, S, Q2);
end Structural;