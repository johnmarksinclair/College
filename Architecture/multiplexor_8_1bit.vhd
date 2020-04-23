library ieee;
use ieee.std_logic_1164.all;

entity multiplexor_8_1bit is
port(
	s0 : in STD_LOGIC;
	s1 : in STD_LOGIC;
	s2 : in STD_LOGIC;
	in0 : in  STD_LOGIC;
	in1 : in  STD_LOGIC;
	in2 : in  STD_LOGIC;
	in3 : in  STD_LOGIC;
	in4 : in  STD_LOGIC;
	in5 : in  STD_LOGIC;
	in6 : in  STD_LOGIC;
	in7 : in  STD_LOGIC;
	output : out  STD_LOGIC
);
end multiplexor_8_1bit;

architecture behavioral of multiplexor_8_1bit is

begin
	output <= 
		in0 after 1 ns when s2='0' and s1='0' and s0='0' else
		in1 after 1 ns when s2='0' and s1='0' and s0='1' else
		in2 after 1 ns when s2='0' and s1='1' and s0='0' else
		in3 after 1 ns when s2='0' and s1='1' and s0='1' else
		in4 after 1 ns when s2='1' and s1='0' and s0='0' else
		in5 after 1 ns when s2='1' and s1='0' and s0='1' else
		in6 after 1 ns when s2='1' and s1='1' and s0='0' else
		in7 after 1 ns when s2='1' and s1='1' and s0='1' else
		'0' after 1 ns;
end behavioral;