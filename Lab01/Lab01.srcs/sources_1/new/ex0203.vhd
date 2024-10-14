library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0203 is
	port(
		A, B, C: in STD_LOGIC;
		Q, nQ: out STD_LOGIC
	);
end ex0203;

architecture Behavioral of ex0203 is
	signal tempQ: STD_LOGIC;
begin
	tempQ <= (A and B) or (C and not B);
	Q <= tempQ;
	nQ <= not tempQ;
end Behavioral;
