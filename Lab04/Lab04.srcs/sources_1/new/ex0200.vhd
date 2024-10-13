-- STRUCTURAL --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0200s is
	generic(
		N: INTEGER := 3
	);
	port(
		Sin, SE, CLK, RST: in STD_LOGIC;
		Dout: out STD_LOGIC_VECTOR(0 to N-1)
	);
end ex0200s;	

architecture Structural of ex0200s is

	component d_flipflop_clr is
		port(
			CLK, E, CLR, D: in STD_LOGIC;
			Q: out STD_LOGIC
		);
	end component;
	
	signal outS: STD_LOGIC_VECTOR(0 to N-1);

begin			   
	U_0: d_flipflop_clr port map(CLK, SE, RST, Sin, outS(0));
	
	reg: for I in 1 to N-1 generate			
		U_I: d_flipflop_clr port map (CLK, SE, RST, outS(I-1), outS(I));
	end generate;
	
	Dout <= outS;
end Structural;		  

-- BEHAVIORAL --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0200b is
	generic(
		N: INTEGER := 3
	);
	port(
		Sin, SE, CLK, RST: in STD_LOGIC;
		Dout: out STD_LOGIC_VECTOR(0 to N-1)
	);
end ex0200b;	

architecture Behavioral of ex0200b is
	signal register_state: STD_LOGIC_VECTOR(0 to N-1);
begin
	main: process (CLK, RST, Sin, SE)
	begin
		if RST = '1' then
			register_state <= (others => '0');
		elsif rising_edge(CLK) then
			if SE = '1' then
				register_state <= Sin & register_state(0 to N-2);
			end if;
		end if;
	end process;	
	
	Dout <= register_state; 
end Behavioral;

-- TEST --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;	

entity ex0200t is	
	generic(
		N: INTEGER := 3
	);
end ex0200t;

architecture Test of ex0200t is

	component ex0200s
		generic(
			N: INTEGER := 3
		);
		port(
			Sin, SE, CLK, RST: in STD_LOGIC;
			Dout: out STD_LOGIC_VECTOR(0 to N-1)
		);
	end component;

	component ex0200b
		generic(
			N: INTEGER := 3
		);
		port(
			Sin, SE, CLK, RST: in STD_LOGIC;
			Dout: out STD_LOGIC_VECTOR(0 to N-1)
		);
	end component;
	
	signal Sin: STD_LOGIC := '0';
	signal SE: STD_LOGIC := '1';
	signal CLK: STD_LOGIC := '0';
	signal RST: STD_LOGIC;
	
	signal Dout_Behavioral: STD_LOGIC_VECTOR(0 to N-1);
	signal Dout_Structural: STD_LOGIC_VECTOR(0 to N-1);
	
	constant clock_period: TIME := 10 ns;
	
begin

	Structural: ex0200s generic map (N) port map (Sin, SE, CLK, RST, Dout_Structural);
	Behavioral: ex0200b generic map (N) port map (Sin, SE, CLK, RST, Dout_Behavioral);

	reset: process
	begin
		RST <= '1';
		wait for clock_period;
		RST <= '0';
		wait for clock_period * (N + 1) * 2;
	end process;
	
	CLK <= not CLK after clock_period;
	Sin <= not Sin after clock_period;
	SE <= not SE after clock_period * (N + 1) * 2;	
	
end Test;