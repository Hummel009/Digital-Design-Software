library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex01 is
    Port ( S : in STD_LOGIC;
           A : in STD_LOGIC;
           B : in STD_LOGIC;
           Q : out STD_LOGIC);
end ex01;

architecture Behavioral of ex01 is
begin
	Q <= A when S = '0' else B;
end Behavioral;
