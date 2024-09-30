library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity dlatch is
	port(
		D, CLK: in  STD_LOGIC;
		Q: out STD_LOGIC
	);
end dlatch;

architecture Behavioral of dlatch is
begin
	process(D, CLK)
	begin
		if (CLK = '1') then
			Q <= D;
		end if;
	end process;
end Behavioral;