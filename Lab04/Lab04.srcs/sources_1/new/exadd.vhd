library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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
	signal stable_button: STD_LOGIC := '0';
	
begin

process(clk, rst)
begin
	if rst = '1' then
		button_sync <= (others => '0');
		stable_button <= '0';
	elsif rising_edge(clk) then
		button_sync(0) <= button;
		button_sync(1) <= button_sync(0);

		if button_sync(0) = '1' and button_sync(1) = '0' then
			stable_button <= '1';
		elsif button_sync(0) = '0' and button_sync(1) = '1' then
			stable_button <= '0';
		end if;
	end if;
end process;

debounced <= stable_button;

end Behavioral;