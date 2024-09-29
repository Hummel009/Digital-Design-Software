library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0509 is
	port(
		T, CLK, CLR: in STD_LOGIC;	
		Q: out STD_LOGIC
	);
end ex0509;

architecture Behavioral of ex0509 is
	signal s: STD_LOGIC;
begin
	process(T, CLK, CLR)
	begin
		if CLR = '1' then
			s <= '0';
		elsif T = '1' then
			if rising_edge(CLK) then
				s <= not s;	 
			end if;
		end if;
	end process; 
	
	Q <= s;
end Behavioral;

-- TEST --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0509t is
end ex0509t;

architecture Test of ex0509t is
	component ex0509
		port(
			T, CLK, CLR: in STD_LOGIC;	
			Q: out STD_LOGIC
		);
	end component;

	signal T: STD_LOGIC := '0';
	signal CLK: STD_LOGIC := '0';
	signal CLR: STD_LOGIC := '1';
	
	signal Q: STD_LOGIC;
	
	constant clock: time := 10 ns;

begin
	UUT: ex0509 port map (T, Q, CLK, CLR);

	CLK <= not CLK after clock;
	T <= not T after clock * 8;
	CLR <= '1' after clock * 9.5 when CLR = '0' else '0' after clock;
end Test;