library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0507 is
	port(
		R, S, CLK: in STD_LOGIC;
		Q: out STD_LOGIC
	);
end ex0507;

architecture Behavioral of ex0507 is
	signal result: STD_LOGIC;
begin
	process(R, S, CLK)
	begin
		if rising_edge(CLK) then
			if (R = '1' and S = '1') then
				result <= 'U';
			elsif R = '1' then
				result <= '0';
			elsif S = '1' then
				result <= '1';
			end if;
		end if;
	end process;

	Q <= result;
end Behavioral;

-- TEST --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0507t is
end ex0507t;

architecture Test of ex0507t is
	component ex0507
		port(
			R, S, CLK: in STD_LOGIC;
			Q: out STD_LOGIC
		);
	end component;

	signal R: STD_LOGIC := '0';
	signal S: STD_LOGIC := '0';
	signal CLK: STD_LOGIC := '0';

	signal Q: STD_LOGIC := '0';

	constant clock: time := 10 ns;

begin
	UUT: ex0507 port map (R, S, CLK, Q);

	CLK <= not CLK after clock;
	S <= not S after clock * 4;
	R <= not R after clock * 8;
end Test;