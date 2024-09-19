library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity ex0401 is
	port(        					
		S, A, B, C: in std_logic; 
		Q: out std_logic
	); 
end ex0401;

architecture Structural of ex0401 is
		
	component and2
		port(							
			A, B: in STD_LOGIC; 
			R: out STD_LOGIC
		);	
	end component;

	component ex01_cmp009 is
        port(
            A, B, S: in std_logic;
            Q: out std_logic
        );
    end component;
 	
	signal R: STD_LOGIC;
   
begin
	U1: ex01_cmp009 port map(A, B, S, R); -- multiplexer
	U2: and2 port map(R, C, Q); -- combine device
end Structural;

--architecture Behavioral of ex0401 is
--	signal R: STD_LOGIC;
--begin
--    R <= A when S = '0' else B;
--	Q <= R and C;
--end Behavioral;