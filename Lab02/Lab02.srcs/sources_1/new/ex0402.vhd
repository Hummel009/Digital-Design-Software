-- STRUCTURAL --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity ex0402s is
	port(        					
		S, D: in std_logic; 
		Q1, Q2: out std_logic
	); 
end ex0402s;

architecture Structural of ex0402s is
		
	component and2
		port(							
			A, B: in STD_LOGIC; 
			R: out STD_LOGIC
		);	
	end component;
 	
	signal nS: STD_LOGIC;
   
begin
        nS <= not S;
        U1: and2 port map(D, nS, Q1);
        U2: and2 port map(D, S, Q2);
end Structural;

-- BEHAVIORAL --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity ex0402b is
	port(        					
		S, D: in std_logic; 
		Q1, Q2: out std_logic
	); 
end ex0402b;

architecture Behavioral of ex0402b is
begin
    PROC: process(S, D)
    begin
        if S = '0' then
            Q1 <= D;
            Q2 <= '0';
        else
            Q1 <= '0';
            Q2 <= D;
        end if;
    end process;
end Behavioral;

-- TEST --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ex0402t is
end ex0402t;

architecture Test of ex0402t is

    component ex0402s
        port(							
			S, D: in std_logic; 
			Q1, Q2: out std_logic
        ); 
    end component;

    component ex0402b
        port(							
			S, D: in std_logic; 
			Q1, Q2: out std_logic
        ); 
    end component;

	signal S, D: STD_LOGIC := '0';
	signal Q_1B, Q_2B, Q_1S, Q_2S: STD_LOGIC;
	signal ERROR_1: STD_LOGIC;
	signal ERROR_2: STD_LOGIC;
    signal TEST_VECTOR: STD_LOGIC_VECTOR(1 downto 0);
	
	constant PERIOD: time := 10 ns; 
	    
begin
    UUT_S: ex0402s port map(S, D, Q_1S, Q_2S);
    UUT_B: ex0402b port map(S, D, Q_1B, Q_2B);
    
    S <= TEST_VECTOR(0);
    D <= TEST_VECTOR(1);
    
    PROC: process
    begin
        for i in 0 to 3 loop
            TEST_VECTOR <= STD_LOGIC_VECTOR(to_unsigned(i, TEST_VECTOR'length));
            wait for PERIOD;
        end loop;
            
        report "End of simulation" severity FAILURE;
    end process;
        
    ERROR_1 <= Q_1B xor Q_1S;
    ERROR_2 <= Q_2B xor Q_2S;
end Test;