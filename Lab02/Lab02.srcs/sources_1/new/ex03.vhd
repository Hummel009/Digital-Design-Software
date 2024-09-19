-- STRUCTURAL --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex03s is
	port(							
		A, B, C, D: in STD_LOGIC; 
		Q: out STD_LOGIC
	); 
end ex03s;

architecture Structural of ex03s is
	
	component and2
		port(							
			A, B: in STD_LOGIC; 
			R: out STD_LOGIC
		);	
	end component;
	
	component and3
		port(							
			A, B, C: in STD_LOGIC; 
			R: out STD_LOGIC
		);	
	end component;

	component or2
		port(
			A, B: in STD_LOGIC;
			R: out STD_LOGIC
		);
	end component;
	
	signal ABC, CD: STD_LOGIC;

begin	
	U1: and3 port map(A, B, C, ABC);
	U2: and2 port map(C, D, CD);
	U3: or2 port map(ABC, CD, Q);
end Structural;

-- BEHAVIORAL --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex03b is
	port(							
		A, B, C, D: in STD_LOGIC; 
		Q: out STD_LOGIC
	); 
end ex03b;

architecture Behavioral of ex03b is
begin
	Q <= (A and B and C) or (C and D);
end Behavioral;

-- TEST --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ex03t is
end ex03t;

architecture Test of ex03t is

    component ex03s
        port(							
            A, B, C, D: in STD_LOGIC; 
            Q: out STD_LOGIC
        ); 
    end component;

    component ex03b
        port(							
            A, B, C, D: in STD_LOGIC; 
            Q: out STD_LOGIC
        ); 
    end component;


	signal A, B, C, D: STD_LOGIC := '0';
	signal Q_B, Q_S: STD_LOGIC;
	signal ERROR: STD_LOGIC;
    signal TEST_VECTOR: STD_LOGIC_VECTOR(3 downto 0);
	
	constant PERIOD: time := 10 ns; 
	    
begin
    UUT_B: ex03b port map(A, B, C, D, Q_B);
    UUT_S: ex03s port map(A, B, C, D, Q_S);
    
    A <= TEST_VECTOR(0);
    B <= TEST_VECTOR(1);
    C <= TEST_VECTOR(2);
    D <= TEST_VECTOR(3);
    
    PROC: process
    begin
        for i in 0 to 15 loop
            TEST_VECTOR <= STD_LOGIC_VECTOR(to_unsigned(i, TEST_VECTOR'length));
            wait for PERIOD;
        end loop;
            
        report "End of simulation" severity FAILURE;
    end process;
        
    ERROR <= Q_B xor Q_S;
end Test;