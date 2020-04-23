library ieee;
use ieee.std_logic_1164.all;

entity register_16bit is
	port(
		input: in STD_LOGIC_VECTOR(15 downto 0);
		load, clk : in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(15 downto 0);
	);
end register_16bit;

architecture behavioral of register_16bit is

signal current_value : STD_LOGIC_VECTOR(15 downto 0); := "0000000000000000";

begin
	process(clk, load, input)
	begin
		if (rising_edge(clk)) then
			if load='1' then
				current_value <= input;
				output <= input after 1 ns;
			elsif load = '0' then
				output <= current_value after 1 ns;
			end if;
		end if;
	end process;
end behavioral;