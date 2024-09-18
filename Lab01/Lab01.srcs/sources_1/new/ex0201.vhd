library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0201 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           D : in STD_LOGIC;
           Q : out STD_LOGIC);
end ex0201;

architecture Behavioral of ex0201 is
begin
	Q <= A and B and C and D;
end Behavioral;
