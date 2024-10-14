library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_flipflop is
	port(
		D, CLK, E: in STD_LOGIC;
		Q: out STD_LOGIC
	);
end d_flipflop;

architecture Behavioral of d_flipflop is
	signal s: STD_LOGIC;
begin
	process(CLK)
	begin
		if E = '1' then
			if rising_edge(CLK) then
				s <= D;
			end if;
		end if;
	end process;

	Q <= s;
end Behavioral;