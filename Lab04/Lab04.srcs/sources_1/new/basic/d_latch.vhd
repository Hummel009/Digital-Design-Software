library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity d_latch is
	port(
		D, E: in std_logic;
		Q: out std_logic;
		nQ: out std_logic
	);
end d_latch;

architecture Behavioral of d_latch is
	signal data : std_logic;
begin
	data <= D when (E = '1');
	Q <= data;
	nQ <= not data;
end Behavioral;