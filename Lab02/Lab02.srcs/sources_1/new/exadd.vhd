-- STRUCTURAL --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity exadds is
	port(
		A, B, C, D: in STD_LOGIC;
		Q: out STD_LOGIC
	);
end exadds;

architecture Structural of exadds is

	component xor2
		port(
			A, B: in STD_LOGIC;
			R: out STD_LOGIC
		);
	end component;

	signal AB, CD: STD_LOGIC;

begin
	U1: xor2 port map(A, B, AB);
	U2: xor2 port map(C, D, CD);
	U3: xor2 port map(AB, CD, Q);
end Structural;

-- BEHAVIORAL --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity exaddb is
	port(
		A, B, C, D: in STD_LOGIC;
		Q: out STD_LOGIC
	);
end exaddb;

architecture Behavioral of exaddb is
begin
	Q <= (A xor B) xor (C xor D);
end Behavioral;

-- TEST --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity exaddt is
end exaddt;

architecture Test of exaddt is

	component exadds
		port(
			A, B, C, D: in STD_LOGIC;
			Q: out STD_LOGIC
		);
	end component;

	component exaddb
		port(
			A, B, C, D: in STD_LOGIC;
			Q: out STD_LOGIC
		);
	end component;

	signal A, B, C, D: STD_LOGIC := '0';
	signal Q_B, Q_S: STD_LOGIC;
	signal ERROR: STD_LOGIC;
	signal TEST_VECTOR: STD_LOGIC_VECTOR(3 downto 0);

	constant PERIOD: time := 10 ns;

begin
	UUT_S: exadds port map(A, B, C, D, Q_S);
	UUT_B: exaddb port map(A, B, C, D, Q_B);

	A <= TEST_VECTOR(0);
	B <= TEST_VECTOR(1);
	C <= TEST_VECTOR(2);
	D <= TEST_VECTOR(3);

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