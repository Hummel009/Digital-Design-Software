library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity ex02 is
	port(        					
		A, B, A1, B1, S: in std_logic; 
		Q1, Q2: out std_logic
	); 
end ex02;

architecture Structural of ex02 is

	component ex01_cmp009 is
        port(
            A, B, S: in std_logic;
            Q: out std_logic
        );
    end component;
    
begin
	U1: ex01_cmp009 port map(A, B, S, Q1);
	U2: ex01_cmp009 port map(A1, B1, S, Q2);
end Structural;