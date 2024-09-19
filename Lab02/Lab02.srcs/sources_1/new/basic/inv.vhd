library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inv is
	port(
		A: in STD_LOGIC;
		nA: out STD_LOGIC
		);
end inv;

architecture Behavioral of inv is
begin
	nA <= not A;
end;