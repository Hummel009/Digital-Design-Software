library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex3 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           Q : out STD_LOGIC;
           NQ : out STD_LOGIC);
end ex3;

architecture Behavioral of ex3 is
	signal tempQ : STD_LOGIC;
begin
	tempQ <= (A and B) or (C and not B);
	Q <= tempQ;
	NQ <= not tempQ;
end Behavioral;
