library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
	port(
		x, y, carry_in : in STD_LOGIC;
		output : out STD_LOGIC;
		carry_out : out STD_LOGIC
	);
end full_adder;

architecture behavioral of full_adder is

begin
	output <= x xor y xor carry_in after 1 ns;
	carry_out <= ( x and y ) or ( carry_in and ( x xor y ) ) after 1 ns;
end behavioral;

