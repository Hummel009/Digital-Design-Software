library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0303 is
	generic (
		N: INTEGER := 7
	);
	port(
		CLK, RST, Pin: in STD_LOGIC;
		Pout: out STD_LOGIC_VECTOR(0 to N-1)
	);
end ex0303;

architecture Behavioral of ex0303 is
	signal register_state: STD_LOGIC_VECTOR(0 to N-1) := "1111111";
begin
	Main: process (CLK, RST)
	begin
		if RST = '1' then
			register_state <= "1111111";
		elsif rising_edge(CLK) then
			register_state <= (Pin xor register_state(N-1)) & (register_state(0) xor register_state(N-1)) & register_state(1 to N-2);
		end if;
	end process;

	Pout <= register_state;
end Behavioral;

-- TEST --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0303t is
	generic(
		N: INTEGER := 7
	);
end ex0303t;

architecture Test of ex0303t is

	component ex0303
		generic(
			N: INTEGER := 7
		);
		port(
			CLK, RST, Pin: in STD_LOGIC;
			Pout: out STD_LOGIC_VECTOR(0 to N-1)
		);
	end component;

	signal CLK: STD_LOGIC := '0';
	signal RST: STD_LOGIC := '0';
	signal Pin: STD_LOGIC := '0';

	signal Pout: STD_LOGIC_VECTOR(0 to N-1);

	constant clock_period: time := 10 ns;
	constant test_polynom: STD_LOGIC_VECTOR := "11000011";

begin
	uut: ex0303 port map (CLK, RST, Pin, Pout);

	simulate: process
	begin
		wait for clock_period;
		for i in test_polynom'length-1 downto 0 loop
			Pin <= test_polynom(i);
			wait for clock_period * 2;
		end loop;
	end process;

	CLK <= not CLK after clock_period;

end Test;