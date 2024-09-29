library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex05040506 is
	port(
		CLR, PRE, D, E, CLK: in STD_LOGIC;
		Q: out STD_LOGIC
	);
end ex05040506;

architecture Behavioral of ex05040506 is
	signal S: STD_LOGIC;
begin
	process(CLR, PRE, D, E, CLK)
	begin
		if CLR = '1' then
			S <= '0';
		elsif PRE = '1' then
			S <= '1';
		elsif E = '1' then
			if rising_edge(CLK) then
				S <= D;	 
			end if;
		end if;
	end process; 
	
	Q <= S;
end Behavioral;

-- TEST --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex05040506t is
end ex05040506t;

architecture Test of ex05040506t is
	component ex05040506
		port(
			CLR, PRE, D, E, CLK: in STD_LOGIC;
			Q: out STD_LOGIC
		);
	end component;
	
	signal CLR: STD_LOGIC := '0';
	signal PRE: STD_LOGIC := '0';
	signal D: STD_LOGIC := '0';
	signal E: STD_LOGIC := '0';
	signal CLK: STD_LOGIC := '0';
	
	signal Q: STD_LOGIC;	
	
	constant clock: time := 10 ns;
begin
	UUT: ex05040506
	port map (CLR, PRE, D, E, CLK, Q);

	CLK <= not CLK after clock;
	D <= not D after clock * 4;
	E <= not E after clock * 8;
	PRE <= '1' after clock * 19.5 when PRE = '0' else '0' after clock * 0.5;
	CLR <= '1' after clock * 39.5 when CLR = '0' else '0' after clock * 0.5;
end Test;