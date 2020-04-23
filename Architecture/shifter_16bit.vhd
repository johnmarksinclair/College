library ieee;
use ieee.std_logic_1164.all;

entity shifter_16bit is
    port( 
		s0, s1 : in  STD_LOGIC;
        input : in  STD_LOGIC_VECTOR(15 downto 0);
		output : out  STD_LOGIC_VECTOR(15 downto 0)
	);
end shifter_16bit;

architecture behavioral of shifter_16bit is

begin
	output(0) <= 
		input(1) after 1 ns when s1 = '0' and s0 ='1' else
		'0' after 1 ns when s1 = '1' and s0 = '0' else 
		input(0) after 1 ns;
	output(1) <= 
		input(2) after 1 ns when s1 = '0' and s0 = '1' else
		input(0) after 1 ns when s1 = '1' and s0 = '0' else 
		input(1) after 1 ns;
	output(2) <= 
		input(3) after 1 ns when s1 = '0' and s0 = '1' else
		input(1) after 1 ns when s1 = '1' and s0 = '0' else 
		input(2) after 1 ns;
	output(3) <= 
		input(4) after 1 ns when s1 = '0' and s0 = '1' else
		input(2) after 1 ns when s1 = '1' and s0 = '0' else 
		input(3) after 1 ns;
	output(4) <=
		input(5) after 1 ns when s1 = '0' and s0 = '1' else
		input(3) after 1 ns when s1 = '1' and s0 = '0' else 
		input(4) after 1 ns;
	output(5) <=
		input(6) after 1 ns when s1 = '0' and s0 = '1' else
		input(4) after 1 ns when s1 = '1' and s0 = '0' else 
		input(5) after 1 ns;
	output(6) <= 
		input(7) after 1 ns when s1 = '0' and s0 = '1' else
		input(5) after 1 ns when s1 = '1' and s0 = '0' else 
		input(6) after 1 ns;
	output(7) <= 
		input(8) after 1 ns when s1 = '0' and s0 = '1' else
		input(6) after 1 ns when s1 = '1' and s0 = '0' else 
		input(7) after 1 ns;
	output(8) <= 
		input(9) after 1 ns when s1 = '0' and s0 = '1' else
		input(7) after 1 ns when s1 = '1' and s0 = '0' else 
		input(8) after 1 ns;
	output(9) <= 
		input(10) after 1 ns when s1 = '0' and s0 = '1' else
		input(8) after 1 ns when s1 = '1' and s0 = '0' else 
		input(9) after 1 ns;
	output(10) <= 
		input(11) after 1 ns when s1 = '0' and s0 = '1' else
		input(9) after 1 ns when s1 = '1' and s0 = '0' else 
		input(10) after 1 ns;
	output(11) <= 
		input(12) after 1 ns when s1 = '0' and s0 = '1' else
		input(10) after 1 ns when s1 = '1' and s0 = '0' else 
		input(11) after 1 ns;
	output(12) <= 
		input(13) after 1 ns when s1 = '0' and s0 = '1' else
		input(11) after 1 ns when s1 = '1' and s0 = '0' else 
		input(12) after 1 ns;
	output(13) <=
		input(14) after 1 ns when s1 = '0' and s0 = '1' else
		input(12) after 1 ns when s1 = '1' and s0 = '0' else 
		input(13) after 1 ns;
	output(14) <= 
		input(15) after 1 ns when s1 = '0' and s0 = '1' else
		input(13) after 1 ns when s1 = '1' and s0 = '0' else 
		input(14) after 1 ns;
	output(15) <= 
		'0' after 1 ns when s1 = '0' and s0 = '1' else
		input(14) after 1 ns when s1 = '1' and s0 = '0' else 
		input(15) after 1 ns;
end behavioral;
