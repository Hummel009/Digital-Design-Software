library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0201 is
	port(
		A, B, C, D: in STD_LOGIC;
		Q: out STD_LOGIC
	);
end ex0201;

architecture Behavioral of ex0201 is
begin
	Q <= A and B and C and D;
end Behavioral;
