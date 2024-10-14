library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity d_latch is
	port(
		D, E: in STD_LOGIC;
		Q: out STD_LOGIC;
		nQ: out STD_LOGIC
	);
end d_latch;

architecture Behavioral of d_latch is
	signal data: STD_LOGIC;
begin
	data <= D when (E = '1');
	Q <= data;
	nQ <= not data;
end Behavioral;