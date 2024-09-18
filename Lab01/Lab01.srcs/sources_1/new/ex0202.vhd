library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0202 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           Q : out STD_LOGIC);
end ex0202;

architecture Behavioral of ex0202 is
begin
	Q <= (A and B) or (C and not B);
end Behavioral;