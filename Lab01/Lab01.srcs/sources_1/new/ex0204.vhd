library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex0204 is
    Port ( S : in STD_LOGIC;
           A : in STD_LOGIC;
           B : in STD_LOGIC;
           X : in STD_LOGIC;
           Y : in STD_LOGIC;
           Q1 : out STD_LOGIC;
           Q2 : out STD_LOGIC);
end ex0204;

architecture Behavioral of ex0204 is
begin
	Q1 <= A when S = '0' else X;
	Q2 <= B when S = '0' else Y;
end Behavioral;
