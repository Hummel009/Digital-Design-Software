library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0508 is
	port(
		J, K, CLK: in STD_LOGIC;	
		Q: out STD_LOGIC
	);
end ex0508;

architecture Behavioral of ex0508 is
	signal result: STD_LOGIC;
begin
	process(J, K, CLK)
	begin
		if rising_edge(CLK) then 
			if (J = '1' and K = '1') then
				result <= not result;
			elsif K = '1' then
				result <= '0';
			elsif J = '1' then
				result <= '1';
			end if; 
		end if;
	end process; 
	
	Q <= result;
end Behavioral;

-- TEST --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0508t is
end ex0508t;

architecture Test of ex0508t is
	component ex0508
		port(
			J, K, CLK: in STD_LOGIC;
			Q: out STD_LOGIC
		);
	end component;

	signal J: STD_LOGIC := '0';
	signal K: STD_LOGIC := '0';
	signal CLK: STD_LOGIC := '0';
	
	signal Q: STD_LOGIC := '0';
	
	constant clock: time := 10 ns;
	
begin
	UUT: ex0508 port map (J, K, CLK, Q);

	CLK <= not CLK after clock;
	J <= not J after clock * 8;
	K <= not K after clock * 16;
end Test;