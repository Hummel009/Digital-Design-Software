-- STRUCTURAL --

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ex04s is
	port(
		D, E: in STD_LOGIC;
		Q, nQ: out STD_LOGIC
	);
end ex04s;

architecture Structural of ex04s is

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

	component and2
		port(
			A, B: in STD_LOGIC;
			R: out STD_LOGIC
		);
	end component;

	signal d_t, ea_t, n_t1, n_t2, da_t: STD_LOGIC;

begin
	U1: and2 port map (A => E, B => D, R => ea_t);
	U2: inv port map (A => D, nA => d_t);
	U3: and2 port map (A => d_t, B => e, R => da_t);
	U4: nor2 port map (A => ea_t,B => n_t2, R => n_t1);
	U5: nor2 port map (A => da_t, B => n_t1, R => n_t2);
	Q <= n_t2;
	nQ <= n_t1;
end Structural;

-- BEHAVIORAL --

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ex04b is
	port(
		D, E: in STD_LOGIC;
		Q, nQ: out STD_LOGIC
	);
end ex04b;

architecture Behavioral of ex04b is
	signal data: STD_LOGIC;
begin
	data <= D when (E = '1');
	Q <= data;
	nQ <= not data;
end Behavioral;

-- PARAMETRAL --

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ex04p is
	port(
		D, E: in STD_LOGIC;
		Q, nQ: out STD_LOGIC
	);
end ex04p;

architecture Parametral of ex04p is
	signal data: STD_LOGIC;
begin
	data <= D when (E = '1');
	Q <= data after 2 ns;
	nQ <= not data after 3 ns;
end Parametral;

-- TEST --

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ex04t is
end ex04t;

architecture Test of ex04t is

	component ex04s
		port(
			D, E: in STD_LOGIC;
			Q, nQ: out STD_LOGIC
		);
	end component;

	component ex04b
		port(
			D, E: in STD_LOGIC;
			Q, nQ: out STD_LOGIC
		);
	end component;

	component ex04p
		port(
			D, E: in STD_LOGIC;
			Q, nQ: out STD_LOGIC
		);
	end component;

	signal D: STD_LOGIC := '0';
	signal E: STD_LOGIC := '0';

	signal Q_struct: STD_LOGIC;
	signal nQ_struct: STD_LOGIC;

	signal Q_beh: STD_LOGIC;
	signal nQ_beh: STD_LOGIC;

	signal Q_param: STD_LOGIC;
	signal nQ_param: STD_LOGIC;

	constant clock: TIME := 10 ns;

begin
	Structural: ex04s port map (D, E, Q_struct, nQ_struct);

	Behavioral: ex04b port map (D, E, Q_beh, nQ_beh);

	Parametral: ex04p port map (D, E, Q_param, nQ_param);

	D <= not D after clock;
	E <= '1' after clock * 4 when E = '0' else '0' after clock;
end Test;