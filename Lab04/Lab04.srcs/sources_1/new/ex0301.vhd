library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0301 is
	generic(
		N: INTEGER := 7
	);
	port(
		CLK, RST: in STD_LOGIC;
		Pout: out STD_LOGIC_VECTOR(0 to N-1)
	);
end ex0301;

architecture Behavioral of ex0301 is
	signal register_state: STD_LOGIC_VECTOR(0 to N-1) := "0000000";
begin
	Main: process (CLK, RST)
	begin
		if RST = '1' then
			register_state <= "0000000";
		elsif rising_edge(CLK) then
			register_state <= not(register_state(N-1)) & register_state(0 to N-2);
		end if;
	end process;

	Pout <= register_state;
end Behavioral;

-- TEST --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0301t is
	generic(
		N: INTEGER := 7
	);
end ex0301t;

architecture Test of ex0301t is

	component ex0301
		generic(
			N: INTEGER := 7
		);
		port(
			CLK, RST: in STD_LOGIC;
			Pout: out STD_LOGIC_VECTOR(0 to N-1)
		);
	end component;

	signal CLK: STD_LOGIC := '0';
	signal RST: STD_LOGIC := '1';

	signal Pout: STD_LOGIC_VECTOR(0 to N-1);

	constant clock_period: TIME := 10 ns;

begin
	UUT: ex0301 port map (CLK, RST,	POut);

	CLK <= not CLK after clock_period;

	reset: process
	begin
		RST <= '1';
		wait for clock_period;
		RST <= '0';
		wait for clock_period * N * 4;
	end process;

end Test;