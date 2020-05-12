library ieee;
use ieee.std_logic_1164.all;

entity multiplexor_4_1bit is
port ( 
	s0, s1 : in  STD_LOGIC;
	in0 : in  STD_LOGIC;
	in1 : in  STD_LOGIC;
	in2 : in  STD_LOGIC;
	in3 : in  STD_LOGIC;
	output : out  STD_LOGIC
);
end multiplexor_4_1bit;

architecture behavioral of multiplexor_4_1bit is

begin
	output <= 	
		in0 after 1 ns when s1='0' and s0='0' else
		in1 after 1 ns when s1='0' and s0='1' else
		in2 after 1 ns when s1='1' and s0='0' else
		in3 after 1 ns when s1='1' and s0='1' else
		'0' after 1 ns;
end behavioral;