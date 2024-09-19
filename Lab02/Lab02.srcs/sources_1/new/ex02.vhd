library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity ex02 is
	port(        					
		A, B, A1, B1, S: in std_logic; 
		Q, Q1: out std_logic
	); 
end ex02;

architecture Structural of ex02 is

	component mux2 is
		port(
			A, B, S: in std_logic;
			Q: out std_logic
		);
	end component;

begin
	MUX0: mux2 port map(A, B, S, Q);
	MUX1: mux2 port map(A1, B1, S, Q1);
end Structural;