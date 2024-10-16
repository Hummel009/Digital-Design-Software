library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity traffic_light is
	port(
		RST: in STD_LOGIC;
		CLK: in STD_LOGIC;
		LED_R: out STD_LOGIC;
		LED_Y: out STD_LOGIC;
		LED_G: out STD_LOGIC
	);
end traffic_light;

architecture Behavioral of traffic_light is
	type STATE is (S1, S2, S3, S4);
	signal CUR_STATE : STATE := S1;
begin
	process(RST, CLK)
	begin
		if RST = '1' then
			CUR_STATE <= S1;
		elsif rising_edge(CLK) then
			case CUR_STATE is
				when S1 =>
					CUR_STATE <= S2;
				when S2 =>
					CUR_STATE <= S3;
				when S3 =>
					CUR_STATE <= S4;
				when S4 =>
					CUR_STATE <= S1;
			end case;
		end if;
	end process;

	process(CUR_STATE)
	begin
		LED_R <= '0';
		LED_Y <= '0';
		LED_G <= '0';

		case CUR_STATE is
			when S1 =>
				LED_R <= '1';
			when S2 =>
				LED_R <= '1';
				LED_Y <= '1';
			when S3 =>
				LED_G <= '1';
			when S4 =>
				LED_Y <= '1';
		end case;
	end process;
end Behavioral;