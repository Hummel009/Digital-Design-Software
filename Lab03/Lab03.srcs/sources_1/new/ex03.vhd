-- STRUCTURAL --

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ex03s is
	port(
		D: in STD_LOGIC;
		Q, nQ: out STD_LOGIC
	);
end ex03s;

architecture Structural of ex03s is

	component nor2
		port(
			A, B: in STD_LOGIC;
			R: out STD_LOGIC
		);
	end component;

	component inv
		port(
			A: in STD_LOGIC;
			nA: out STD_LOGIC
		);
	end component;

	signal t1, t2, t3: STD_LOGIC;

begin
	U1: inv port map (D, t3);
	U2: nor2 port map (D, t2, t1);
	U3: nor2 port map (t3, t1, t2);
	Q <= t2;
	nQ <= t1;
end Structural;

-- BEHAVIORAL --

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ex03b is
	port(
		D: in STD_LOGIC;
		Q, nQ: out STD_LOGIC
	);
end ex03b;

architecture Behavioral of ex03b is
	signal U, M, R: STD_LOGIC;
begin
	R <= not D;
	M <= D nor U;
	U <= R nor M;
	nQ <= M;
	Q <= U;
end Behavioral;

-- PARAMETRAL --

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ex03p is
	port(
		D: in STD_LOGIC;
		Q, nQ: out STD_LOGIC
	);
end ex03p;

architecture Parametral of ex03p is
	signal U, M, R: STD_LOGIC;
begin
	R <= not D;
	M <= D nor U after 3 ns;
	U <= R nor M after 3 ns;
	nQ <= transport M after 2 ns;
	Q <= transport U after 3 ns;
end Parametral;

-- TEST --

library ieee;
use ieee.STD_LOGIC_1164.all;

entity ex03t is
end ex03t;

architecture Test of ex03t is

	component ex03s
		port(
			D: in STD_LOGIC;
			Q, nQ: out STD_LOGIC
		);
	end component;

	component ex03b
		port(
			D: in STD_LOGIC;
			Q, nQ: out STD_LOGIC
		);
	end component;

	component ex03p
		port(
			D: in STD_LOGIC;
			Q, nQ: out STD_LOGIC
		);
	end component;

	signal D: STD_LOGIC := '0';

	signal Q_struct: STD_LOGIC;
	signal nQ_struct: STD_LOGIC;

	signal Q_beh: STD_LOGIC;
	signal nQ_beh: STD_LOGIC;

	signal Q_param: STD_LOGIC;
	signal nQ_param: STD_LOGIC;

	constant clock: TIME := 10 ns;

begin
	Structural: ex03s port map (D, Q_struct, nQ_struct);

	Behavioral: ex03b port map (D, Q_beh, nQ_beh);

	Parametral: ex03p port map (D, Q_param, nQ_param);

	D <= not D after clock;
end Test;