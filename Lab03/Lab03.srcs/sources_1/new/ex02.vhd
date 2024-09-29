-- STRUCTURAL --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity ex02s is
	port(
		R, S: in STD_LOGIC;
		Q, nQ: out STD_LOGIC
	);
end ex02s;

architecture Structural of ex02s is

	component nor2 is
		port(
			A, B: in STD_LOGIC;
			R: out STD_LOGIC
		);
	end component;
	
	signal t1, t2: STD_LOGIC;
	
begin
	U2: nor2 port map (R, t1, t2);
	U1: nor2 port map (S, t2, t1);
	nQ <= t1;
	Q <= t2;
end Structural;

-- BEHAVIORAL --

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ex02b is
	port(
		R, S: in STD_LOGIC;
		Q, nQ: out STD_LOGIC
	);
end ex02b;

architecture Behavioral of ex02b is
	signal t1, t2: STD_LOGIC;
begin
	t2 <= R nor t1;
	t1 <= S nor t2;
	nQ <= t1;
	Q <= t2;
end Behavioral;

-- PARAMETRAL --

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ex02p is
	port(
		R, S: in STD_LOGIC;
		Q, nQ: out STD_LOGIC
	);
end ex02p;

architecture Parametral of ex02p is
	signal t1, t2: std_logic;
begin
	t2 <= R nor t1 after 3 ns;
	t1 <= S nor t2 after 3 ns;
	nQ <= transport t1 after 2 ns;
	Q <= transport t2 after 3 ns;
end Parametral;

-- TEST --

library ieee;
use ieee.STD_LOGIC_1164.all;

entity ex02t is
end ex02t;

architecture Test of ex02t is

	component ex02b
		port(
			R, S: in STD_LOGIC;
			Q, nQ: out STD_LOGIC
		);
	end component;
	
	component ex02s
		port(
			R, S: in STD_LOGIC;
			Q, nQ: out STD_LOGIC
		);
	end component;
	
	component ex02p
		port(
			R, S: in STD_LOGIC;
			Q, nQ: out STD_LOGIC
		);
	end component;
	
	signal R: STD_LOGIC;
	signal S: STD_LOGIC;
	
	signal Q_struct: STD_LOGIC;
	signal nQ_struct: STD_LOGIC;	 
	
	signal Q_beh: STD_LOGIC;
	signal nQ_beh: STD_LOGIC;
	
	signal Q_param: STD_LOGIC;
	signal nQ_param: STD_LOGIC;	
	
	constant clock: time := 10 ns;
	
begin
	Structural: ex02s port map (R, S, Q_struct, nQ_struct);
	
	Behavioral: ex02b port map (R, S, Q_beh, nQ_beh);	 
	
	Parametral: ex02p port map (R, S, Q_param, nQ_param);

	Simulate: process
	begin
		R <= '0';
		S <= '0';
		wait for clock;	 
		
		R <= '1';
		S <= '0';
		wait for clock;	
		
		R <= '0';
		S <= '0';
		wait for clock;	 
		
		R <= '0';
		S <= '1';
		wait for clock;	 
		
		R <= '0';
		S <= '0';
		wait for clock;		
		
		-- error value 
		
		R <= '1';
		S <= '1';
		wait for clock;	
		
		R <= '0';
		S <= '0';
		wait for clock;
	end process;
end Test;