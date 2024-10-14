-- STRUCTURAL --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0403s is
	port(
		A: in STD_LOGIC_VECTOR(4 downto 0);
		Q: out STD_LOGIC
	);
end ex0403s;

architecture Structural of ex0403s is

	component and2
		port(
			A, B: in STD_LOGIC;
			R: out STD_LOGIC
		);
	end component;

	signal tQ: STD_LOGIC_vector (3 downto 0);

begin
	U0: and2 port map(A(0), A(1), tQ(0));
	GEN: for i in 2 to 4 generate
		U: and2 port map(A(i), tQ(i - 2), tQ(i - 1));
		end generate;
	Q <= tQ(3);
end Structural;

-- BEHAVIORAL --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0403b is
	port(
		A: in STD_LOGIC_VECTOR(4 downto 0);
		Q: out STD_LOGIC
	);
end ex0403b;

architecture Behavioral of ex0403b is
	signal tQ: STD_LOGIC;
begin
	Q <= A(0) and A(1) and A(2) and A(3) and A(4);
end Behavioral;

-- TEST --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ex0403t is
end ex0403t;

architecture Test of ex0403t is

	component ex0403s
		port(
			A: in STD_LOGIC_VECTOR(4 downto 0);
			Q: out STD_LOGIC
		);
	end component;

	component ex0403b
		port(
			A: in STD_LOGIC_VECTOR(4 downto 0);
			Q: out STD_LOGIC
		);
	end component;

	signal A: STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
	signal Q_B, Q_S: STD_LOGIC;
	signal ERROR: STD_LOGIC;
	signal TEST_VECTOR: STD_LOGIC_VECTOR(4 downto 0);

	constant PERIOD: TIME := 10 ns;

begin
	UUT_S: ex0403s port map(A, Q_S);
	UUT_B: ex0403b port map(A, Q_B);

	A <= TEST_VECTOR;

	PROC: process
	begin
		for i in 0 to 31 loop
			TEST_VECTOR <= STD_LOGIC_VECTOR(to_unsigned(i, TEST_VECTOR'length));
			wait for PERIOD;
		end loop;

		report "End of simulation" severity FAILURE;
	end process;

	ERROR <= Q_B xor Q_S;
end Test;