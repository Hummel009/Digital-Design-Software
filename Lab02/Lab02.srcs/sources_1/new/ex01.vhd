library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex01 is
    Port ( S : in STD_LOGIC;
           A : in STD_LOGIC;
           B : in STD_LOGIC;
           Q : out STD_LOGIC);
end ex01;

architecture Structural of ex01 is

component AND2 is
    Port ( A : in STD_LOGIC;
       B : in STD_LOGIC;
       Q : out STD_LOGIC);
end component;

component OR2 is
    Port ( A : in STD_LOGIC;
       B : in STD_LOGIC;
       Q : out STD_LOGIC);
end component;

component INV is
    Port ( A : in STD_LOGIC;
       Q : out STD_LOGIC);
end component;

signal SN, ASN, SB: STD_LOGIC;

begin
	U1: INV port map (S, SN);
	U2: AND2 port map (A, SN, ASN);
	U3: AND2 port map (S, B, SB);
	U4: OR2 port map (ASN, SB, Q);
end Structural;
