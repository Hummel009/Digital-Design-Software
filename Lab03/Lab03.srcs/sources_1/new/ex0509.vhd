library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0509 is
	port(
		T, CLK: in STD_LOGIC;
		Q: out STD_LOGIC
	);
end ex0509;

architecture Behavioral of ex0509 is
	signal result: STD_LOGIC := '0';
begin
	process(T, CLK)
	begin
		if rising_edge(CLK) then
			result <= not result;
		end if;
	end process;

	Q <= result;
end Behavioral;

-- TEST --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0509t is
end ex0509t;

architecture Test of ex0509t is
	component ex0509
		port(
			T, CLK: in STD_LOGIC;
			Q: out STD_LOGIC
		);
	end component;

	signal T: STD_LOGIC := '0';
	signal CLK: STD_LOGIC := '0';

	signal Q: STD_LOGIC := '0';

	constant clock: time := 10 ns;

begin
	UUT: ex0509 port map (T, CLK, Q);

	CLK <= not CLK after clock;
	T <= not T after clock * 8;
end Test;