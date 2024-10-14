library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex030201 is
	generic (
		N: INTEGER := 7;
		init_state: STD_LOGIC_VECTOR := "1111111"
	);
	port(
		CLK, RST: in STD_LOGIC;
		State: out STD_LOGIC_VECTOR(0 to N-1);
		Pout: out STD_LOGIC
	);

end ex030201;

architecture Behavioral of ex030201 is
	signal register_state: STD_LOGIC_VECTOR(0 to N-1) := init_state;
begin
	Main: process (CLK, RST)
	begin
		if RST = '1' then
			register_state <= init_state;
		elsif rising_edge(CLK) then
			register_state <= (register_state(N-1) & (register_state(0) xor register_state(N-1))) & register_state(1 to N-2);
		end if;
	end process;

	Pout <= register_state(N-1);
	State <= register_state;

end Behavioral;

-- TEST --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex030201t is
	generic(
		N: INTEGER := 7
	);
end ex030201t;

architecture Behavioral of ex030201t is

	component ex030201
		generic(
			N: INTEGER := 7
		);
		port(
			CLK, RST: in STD_LOGIC;
			State: out STD_LOGIC_VECTOR(0 to N-1);
			Pout: out STD_LOGIC
		);
	end component;

	signal CLK: STD_LOGIC := '0';
	signal RST: STD_LOGIC := '0';

	signal State: STD_LOGIC_VECTOR(0 to N-1);
	signal Pout: STD_LOGIC;

	constant clock_period: TIME := 10 ns;

begin
	uut: ex030201 port map (CLK, RST, State, POut);

	CLK <= not CLK after clock_period;
end Behavioral;