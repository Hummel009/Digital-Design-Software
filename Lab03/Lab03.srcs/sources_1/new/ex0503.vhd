library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0503 is 
	port(
		D, CLK: in STD_LOGIC;
		Q: out STD_LOGIC
	);
end ex0503;

architecture Behavioral of ex0503 is		   
	signal S: STD_LOGIC;
begin
	process(CLK)
	begin		
		if rising_edge(CLK) then
			S <= D;
		end if;
	end process;	
	
	Q <= S;
end Behavioral;

-- TEST --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0503t is
end ex0503t;

architecture Test of ex0503t is

	component ex0503
		port(
			D, CLK: in STD_LOGIC;
			Q: out STD_LOGIC
		);
	end component;

	signal D: STD_LOGIC := '0';
	signal CLK: STD_LOGIC := '0';

	signal Q: STD_LOGIC;
	
	constant clock: time := 10 ns;
	
begin
	UUT: ex0503 port map (D, CLK, Q);	  
	
	D <= not D after clock * 4;
	CLK <= not CLK after clock;
end Test;