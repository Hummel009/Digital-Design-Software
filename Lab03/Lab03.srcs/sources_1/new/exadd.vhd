library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity exadd is
    port(
		D, CLK: in STD_LOGIC;
        Q: out STD_LOGIC
	);
end exadd;

architecture Structural of exadd is
    signal master_Q: STD_LOGIC;
    signal slave_Q: STD_LOGIC;

    component dlatch is
        port(
			D, CLK: in STD_LOGIC;
            Q: out STD_LOGIC
		);
    end component;

    signal nCLK: STD_LOGIC;

begin
    Master: dlatch port map (D, CLK, master_Q);

    nCLK <= not CLK;

    Slave: dlatch port map (master_Q, nCLK, slave_Q);

    Q <= slave_Q;
end Structural;