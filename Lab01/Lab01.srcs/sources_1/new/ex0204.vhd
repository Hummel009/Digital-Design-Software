library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0204 is
	port(
		S, A, B, X, Y: in STD_LOGIC;
		Q1, Q2: out STD_LOGIC
	);
end ex0204;

architecture Behavioral of ex0204 is
begin
	Q1 <= A when S = '0' else X;
	Q2 <= B when S = '0' else Y;
end Behavioral;
