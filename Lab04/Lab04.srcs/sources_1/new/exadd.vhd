library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity exadd is
	port(
		clk: in STD_LOGIC;
		rst: in STD_LOGIC;
		button: in STD_LOGIC;
		debounced: out STD_LOGIC
	);
end exadd;

architecture Behavioral of exadd is
	signal button_sync: STD_LOGIC_VECTOR(1 downto 0);
	signal counter: INTEGER := 0;
	signal stable_button: STD_LOGIC := '0';
	
	constant COUNT_MAX: INTEGER := 100000;
begin

process(clk, rst)
begin
	if rst = '1' then
		button_sync <= (others => '0');
		counter <= 0;
		stable_button <= '0';
	elsif rising_edge(clk) then
		button_sync(0) <= button;
		button_sync(1) <= button_sync(0);

		if button_sync(0) = button_sync(1) then
			if counter < COUNT_MAX then
				counter <= counter + 1;
			else
				stable_button <= button_sync(1);
			end if;
		else
			counter <= 0;
		end if;
	end if;
end process;

debounced <= stable_button;

end Behavioral;