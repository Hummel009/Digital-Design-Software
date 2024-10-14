-- STRUCTURAL --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0401s is
	port(
		S, A, B, C: in STD_LOGIC;
		Q: out STD_LOGIC
	);
end ex0401s;

architecture Structural of ex0401s is

	component and2
		port(
			A, B: in STD_LOGIC;
			R: out STD_LOGIC
		);
	end component;

	component mux is
		port(
			A, B, S: in STD_LOGIC;
			Q: out STD_LOGIC
		);
	end component;
 
	signal R: STD_LOGIC;

begin
	MUX: mux port map(A, B, S, R);
	COMB: and2 port map(R, C, Q);
end Structural;

-- BEHAVIORAL --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0401b is
	port(
		S, A, B, C: in STD_LOGIC;
		Q: out STD_LOGIC
	);
end ex0401b;

architecture Behavioral of ex0401b is
	signal R: STD_LOGIC;
begin
	R <= A when S = '0' else B;
	Q <= R and C;
end Behavioral;

-- TEST --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ex0401t is
end ex0401t;

architecture Test of ex0401t is

	component ex0401s
		port(
			S, A, B, C: in STD_LOGIC;
			Q: out STD_LOGIC
		);
	end component;

	component ex0401b
		port(
			S, A, B, C: in STD_LOGIC;
			Q: out STD_LOGIC
		);
	end component;

	signal S, A, B, C: STD_LOGIC := '0';
	signal Q_B, Q_S: STD_LOGIC;
	signal ERROR: STD_LOGIC;
	signal TEST_VECTOR: STD_LOGIC_VECTOR(3 downto 0);

	constant PERIOD: TIME := 10 ns;

begin
	UUT_S: ex0401s port map(S, A, B, C, Q_S);
	UUT_B: ex0401b port map(S, A, B, C, Q_B);

	S <= TEST_VECTOR(0);
	A <= TEST_VECTOR(1);
	B <= TEST_VECTOR(2);
	C <= TEST_VECTOR(3);

	PROC: process
	begin
		for i in 0 to 15 loop
			TEST_VECTOR <= STD_LOGIC_VECTOR(to_unsigned(i, TEST_VECTOR'length));
			wait for PERIOD;
		end loop;

		report "End of simulation" severity FAILURE;
	end process;

	ERROR <= Q_B xor Q_S;
end Test;