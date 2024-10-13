-- STRUCTURAL --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0101s is
	generic(
		n: INTEGER := 4
	);
	port(
		Din: in STD_LOGIC_VECTOR(n-1 downto 0);
		EN: in STD_LOGIC;
		Dout: out STD_LOGIC_VECTOR(n-1 downto 0)
	);
end ex0101s;

architecture Structural of ex0101s is

	component d_latch
		port(
			D, E: in STD_LOGIC;
			Q: out STD_LOGIC
		);
	end component;	

begin
	reg: for i in n-1 downto 0 generate
		U_J: d_latch port map(Din(i), EN, Dout(i));
	end generate;	
end Structural;

-- BEHAVIORAL --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0101b is
	generic(
		n: INTEGER := 4
	);
	port(
		Din: in STD_LOGIC_VECTOR(n-1 downto 0);
		EN: in STD_LOGIC;
		Dout: out STD_LOGIC_VECTOR(n-1 downto 0)
	);
end ex0101b;

architecture Behavioral of ex0101b is
begin	
	Dout <= Din when EN = '1';
end Behavioral;

-- TEST --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;  
use IEEE.NUMERIC_STD.all;

entity ex0101t is
	generic(
		n: INTEGER := 4
	);
end ex0101t;

architecture Test of ex0101t is

	component ex0101s
		generic(
			n: INTEGER := 4
		);
		port(
			Din: in STD_LOGIC_VECTOR(n-1 downto 0);
			EN: in STD_LOGIC;
			Dout: out STD_LOGIC_VECTOR(n-1 downto 0) 
		);
	end component;

	component ex0101b
		generic(
			n: INTEGER := 4
		);
		port(
			Din: in STD_LOGIC_VECTOR(n-1 downto 0);
			EN: in STD_LOGIC;
			Dout: out STD_LOGIC_VECTOR(n-1 downto 0) 
		);
	end component;
	
	signal Din: STD_LOGIC_VECTOR(n-1 downto 0) := (others => '0');
	signal EN: STD_LOGIC := '0';
	
	signal Dout_Behavioral: STD_LOGIC_VECTOR(n-1 downto 0);
	signal Dout_Structural: STD_LOGIC_VECTOR(n-1 downto 0);
	
	constant register_size: INTEGER := 4;
	constant in_delay: TIME := 10 ns;
	
begin

	Structural: ex0101s generic map (register_size) port map (Din, EN, Dout_Structural);
	Behavioral: ex0101b generic map (register_size) port map (Din, EN, Dout_Behavioral);	
	
	Din <= Din + "1" after in_delay;
	
	enable: process
	begin
		wait for in_delay / 3;
		EN <= '1';
		wait for in_delay / 3;
		EN <= '0';
		wait for in_delay * 4 + in_delay / 3;
	end	process;
	
end Test;