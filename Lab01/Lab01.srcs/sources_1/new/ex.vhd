library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex is
    Port ( S : in STD_LOGIC;
           A : in STD_LOGIC;
           B : in STD_LOGIC;
           Q : out STD_LOGIC);
end ex;

architecture Behavioral of ex is
begin
	Q <= A when S = '0' else B;
end Behavioral;
