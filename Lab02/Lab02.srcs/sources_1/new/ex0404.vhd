-- STRUCTURAL --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0404s is
	port(
		A0, B0, A1, B1, C0: in STD_LOGIC;
		S0, S1: out STD_LOGIC;
		C2: out STD_LOGIC
	);
end ex0404s;

architecture Structural of ex0404s is

    component sum1
    port(
		A, B, P0: in STD_LOGIC;
		S, P: out STD_LOGIC
    );
    end component;

    signal C1 : std_logic;

begin
	SUM_1: sum1 port map(A0, B0, C0, S0, C1);
	SUM_2: sum1 port map(A1, B1, C1, S1, C2);
end Structural;

-- BEHAVIORAL --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0404b is
	port(
		A0, B0, A1, B1, C0: in STD_LOGIC;
		S0, S1: out STD_LOGIC;
		C2: out STD_LOGIC
	);
end ex0404b;

architecture Behavioral of ex0404b is
    signal C1, buf_C2: STD_LOGIC;
begin
	C1 <= (A0 and B0) or (A0 and C0) or (B0 and C0);
	C2 <= (A1 and B1) or (A1 and C1) or (B1 and C1);
	buf_C2 <= (A1 and B1) or (A1 and C1) or (B1 and C1);

	S0 <= ((not C1) and (A0 or B0 or C0)) or (A0 and B0 and C0);
	S1 <= ((not buf_C2) and (A1 or B1 or C1)) or (A1 and B1 and C1);
end Behavioral;

-- TEST --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ex0404t is
end ex0404t;

architecture Test of ex0404t is

	component ex0404s
		port(
			A0, B0, A1, B1, C0: in STD_LOGIC;
			S0, S1: out STD_LOGIC;
			C2: out STD_LOGIC
		);
	end component;

	component ex0404b
		port(
			A0, B0, A1, B1, C0: in STD_LOGIC;
			S0, S1: out STD_LOGIC;
			C2: out STD_LOGIC
		);
	end component;

	signal A0, B0, A1, B1, C0: STD_LOGIC;
	signal S0_B, S1_B, C2_B, S0_S, S1_S, C2_S: STD_LOGIC;
	signal ERROR_S0, ERROR_S1, ERROR_C2: STD_LOGIC;
	signal TEST_VECTOR: STD_LOGIC_VECTOR(4 downto 0);

	constant PERIOD: time := 10 ns;

begin
	UUT_S: ex0404s port map(A0, B0, A1, B1, C0, S0_S, S1_S, C2_S);
	UUT_B: ex0404b port map(A0, B0, A1, B1, C0, S0_B, S1_B, C2_B);

	A0 <= TEST_VECTOR(0);
	B0 <= TEST_VECTOR(1);
	A1 <= TEST_VECTOR(2);
	B1 <= TEST_VECTOR(3);
	C0 <= TEST_VECTOR(4);

	PROC: process
	begin
		for i in 0 to 31 loop
			TEST_VECTOR <= STD_LOGIC_VECTOR(to_unsigned(i, TEST_VECTOR'length));
			wait for PERIOD;
		end loop;

		report "End of simulation" severity FAILURE;
	end process;

	ERROR_S0 <= S0_B xor S0_S;
	ERROR_S1 <= S1_B xor S1_S;
	ERROR_C2 <= C2_B xor C2_S;
end Test;