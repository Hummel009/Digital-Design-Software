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
	U2: nor2 port map (A => R, B => t1, R => t2);
	U1: nor2 port map (A => S, B => t2, R => t1);
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
	component nor2t is
    port(
        A, B: in STD_LOGIC;
        R: out STD_LOGIC
    );
end component;

signal t1, t2: STD_LOGIC;

begin
    U2: nor2t port map (A => R, B => t1, R => t2);
    U1: nor2t port map (A => S, B => t2, R => t1);
    nQ <= t1;
    Q <= t2;
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
	
begin
	U1: ex02s port map (R => R, S => S, Q => Q_struct, nQ => nQ_struct);
	
	U2: ex02b port map (R => R, S => S, Q => Q_beh, nQ => nQ_beh);	 
	
	U3: ex02p port map (R => R, S => S, Q => Q_param, nQ => nQ_param);

	Simulate: process
	begin
		R <= '0';
		S <= '0';
		wait for 10 ns;	 
		
		R <= '1';
		S <= '0';
		wait for 10 ns;	
		
		R <= '0';
		S <= '0';
		wait for 10 ns;	 
		
		R <= '0';
		S <= '1';
		wait for 10 ns;	 
		
		R <= '0';
		S <= '0';
		wait for 10 ns;		
		
		-- error value 
		
		R <= '1';
		S <= '1';
		wait for 10 ns;	
		
		R <= '0';
		S <= '0';
		wait for 10 ns;
	end process;
end Test;