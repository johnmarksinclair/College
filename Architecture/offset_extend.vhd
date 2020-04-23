library ieee;
use ieee.std_logic_1164.all;

entity offset_extend is
port( 
	dr : in STD_LOGIC_VECTOR(2 downto 0);
	sb : in STD_LOGIC_VECTOR(2 downto 0);
	output : out STD_LOGIC_VECTOR( 15 downto 0)
);	
end offset_extend;

architecture behavioral of offset_extend is

constant prop_delay : time := 1 ns;

begin
	output(15 downto 6) <= "1111111111" after 1 ns when dr(2) ='1' else
							"0000000000" after 1 ns when dr(2) ='0';
	output(5 downto 3) <= dr after 1 ns;
	output(2 downto 0) <= sb after 1 ns;
	 
end behavioral;