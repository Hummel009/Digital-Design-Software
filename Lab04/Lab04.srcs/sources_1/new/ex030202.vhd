library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex030202 is
	generic (
		N: INTEGER := 7
	);
	port(
		CLK, RST: in STD_LOGIC;
		Pout: out STD_LOGIC_VECTOR(0 to N-1)
	);
end ex030202;

architecture Behavioral of ex030202 is
	signal register_state: STD_LOGIC_VECTOR(0 to N-1) := "1111111";
begin
	Main: process (CLK, RST)
	begin
		if RST = '1' then
			register_state <= "1111111";
		elsif rising_edge(CLK) then
			register_state <= (register_state(0) xor register_state(N-1)) & register_state(0 to N-2);
		end if;
	end process;

	Pout <= register_state;
end Behavioral;

-- TEST --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex030202t is
	generic(
		N: INTEGER := 7
	);
end ex030202t;

architecture Test of ex030202t is

	component ex030202
		generic(
			N: INTEGER := 7
		);
		port(
			CLK, RST: in STD_LOGIC;
			Pout: out STD_LOGIC_VECTOR(0 to N-1)
		);
	end component;

	signal CLK: STD_LOGIC := '0';
	signal RST: STD_LOGIC := '0';

	signal Pout: STD_LOGIC_VECTOR(0 to N-1);

	constant clock_period: TIME := 10 ns;

begin
	uut: ex030202 port map (CLK, RST, Pout);

	CLK <= not CLK after clock_period;
end Test;