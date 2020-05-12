library ieee;
use ieee.std_logic_1164.all;

entity multiplexor_2_16bit is
port( 
	s : in  STD_LOGIC;
	in0 : in  STD_LOGIC_VECTOR(15 downto 0);
	in1 : in  STD_LOGIC_VECTOR(15 downto 0);
	output : out  STD_LOGIC_VECTOR(15 downto 0)
);
end multiplexor_2_16bit;

architecture behavioral of multiplexor_2_16bit is

begin
	output <= 
		in0 after 0 ns when s = '0' else
		in1 after 0 ns when s = '1' else
		"0000000000000000" after 0 ns;
end behavioral;