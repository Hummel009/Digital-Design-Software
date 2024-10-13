-- STRUCTURAL --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0102s is
	generic (n: integer := 4);
	port(
		Din: in STD_LOGIC_VECTOR(n-1 downto 0);
		EN: in STD_LOGIC;
		CLK : in std_logic;
		Dout: out STD_LOGIC_VECTOR(n-1 downto 0)
	);
end ex0102s;

architecture Structural of ex0102s is

	component d_flipflop
		port(
			D, E, CLK: in STD_LOGIC;
			Q: out STD_LOGIC
		);
	end component;	

begin
	reg: for i in n-1 downto 0 generate
		U_J: d_flipflop port map(Din(i), EN, CLK, Dout(i));
	end generate;	
end Structural;

-- BEHAVIORAL --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0102b is
	generic (n: integer := 4);
	port(
		Din: in STD_LOGIC_VECTOR(n-1 downto 0);
		EN: in STD_LOGIC;
		CLK : in std_logic;
		Dout: out STD_LOGIC_VECTOR(n-1 downto 0)
	);
end ex0102b;

architecture Behavioral of ex0102b is
	signal result : STD_LOGIC_VECTOR(n-1 downto 0);
begin	
	main : process(Din, EN, CLK)
	begin
		if EN = '1' then
			if rising_edge(CLK) then
				result <= Din;
			end if;
		end if;
	end process;
	
	Dout <= result;
end Behavioral;

-- TEST --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;  
use IEEE.NUMERIC_STD.all;

entity ex0102t is
	generic (n: integer := 4);
end ex0102t;

architecture Test of ex0102t is

	component ex0102s
		generic (n: integer := 4);
		port(
			Din: in STD_LOGIC_VECTOR(n-1 downto 0);
			EN: in STD_LOGIC;
			CLK: in STD_LOGIC;
			Dout: out STD_LOGIC_VECTOR(n-1 downto 0) 
		);
	end component;

	component ex0102b
		generic (n: integer := 4);
		port(
			Din: in STD_LOGIC_VECTOR(n-1 downto 0);
			EN: in STD_LOGIC;
			CLK: in STD_LOGIC;
			Dout: out STD_LOGIC_VECTOR(n-1 downto 0) 
		);
	end component;
	
	signal Din: STD_LOGIC_VECTOR(n-1 downto 0) := (others => '0');
	signal EN: STD_LOGIC := '0';
	signal CLK : STD_LOGIC := '0';
	
	signal Dout_Behavioral: STD_LOGIC_VECTOR(n-1 downto 0);
	signal Dout_Structural: STD_LOGIC_VECTOR(n-1 downto 0);
	
	constant register_size: integer := 4;
	constant clock_period : time := 10 ns;
	
begin

	Behavioral: ex0102b generic map (register_size) port map (Din, EN, CLK, Dout_Behavioral);	
	Structural: ex0102s generic map (register_size) port map (Din, EN, CLK, Dout_Structural);
	
	CLK <= not CLK after clock_period;	
	Din <= Din + "1" after clock_period * 2;
	
	enable: process
	begin
		EN <= '1';
		wait for clock_period;
		EN <= '0';
		wait for clock_period * 4;
	end	process;
	
end Test;