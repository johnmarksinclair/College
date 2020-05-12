library ieee;
use ieee.std_logic_1164.all;

entity multiplexor_4_16bit is
port( 
	s0, s1 : in  STD_LOGIC;
	in0 : in  STD_LOGIC_VECTOR(15 downto 0);
	in1 : in  STD_LOGIC_VECTOR(15 downto 0);
	in2 : in  STD_LOGIC_VECTOR(15 downto 0);
	in3 : in  STD_LOGIC_VECTOR(15 downto 0);
	output : out  STD_LOGIC_VECTOR(15 downto 0)
);
end multiplexor_4_16bit;

architecture behavioral of multiplexor_4_16bit is

begin
	output <= 
		in0 after 1 ns when s1='0' and s0='0' else
		in1 after 1 ns when s1='0' and s0='1' else
		in2 after 1 ns when s1='1' and s0='0' else
		in3 after 1 ns when s1='1' and s0='1' else
		"0000000000000000" after 1 ns;
end behavioral;