library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity zero_fill is
port( 
	input: in STD_LOGIC_VECTOR(2 downto 0);
	output : out STD_LOGIC_VECTOR( 15 downto 0)
);	
end zero_fill;

architecture behavioral of zero_fill is

begin
	output(15 downto 3) <=  "0000000000000" after 1 ns;
	output(2 downto 0) <= input after 1 ns;
end behavioral;