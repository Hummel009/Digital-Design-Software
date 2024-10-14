library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity d_flipflop_clr is
	port(
		CLR, D, E, CLK: in STD_LOGIC;
		Q: out STD_LOGIC
	);
end d_flipflop_clr;

architecture Behavioral of d_flipflop_clr is
	signal s: STD_LOGIC;
begin
	process(CLR, D, E, CLK)
	begin
		if CLR = '1' then
			s <= '0';
		elsif E = '1' then
			if rising_edge(CLK) then
				s <= D;
			end if;
		end if;
	end process;

	Q <= s;
end Behavioral;
