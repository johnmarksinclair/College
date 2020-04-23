library ieee;
use ieee.std_logic_1164.all;

entity arithmetic_unit_16bit is
    port(
		s : in STD_LOGIC_VECTOR(1 downto 0); 
		carry_in : in  STD_LOGIC;
        input_a : in  STD_LOGIC_VECTOR(15 downto 0);
        input_b : in  STD_LOGIC_VECTOR(15 downto 0);
		output : out  STD_LOGIC_VECTOR(15 downto 0);
		carry_out : out  STD_LOGIC
	);
end arithmetic_unit_16bit;

architecture behavioral of arithmetic_unit_16bit is

component multiplexor_4_16bit
	port(
		s0, s1 : in  STD_LOGIC;
		in0 : in  STD_LOGIC_VECTOR(15 downto 0);
		in1 : in  STD_LOGIC_VECTOR(15 downto 0);
		in2 : in  STD_LOGIC_VECTOR(15 downto 0);
		in3 : in  STD_LOGIC_VECTOR(15 downto 0);
		output : out  STD_LOGIC_VECTOR(15 downto 0);
	);
end component;

component ripple_adder_16bit
port(
   carry_in : in STD_LOGIC;
   x : in STD_LOGIC_VECTOR(15 downto 0);
   y : in STD_LOGIC_VECTOR(15 downto 0);
   output : out STD_LOGIC_VECTOR(15 downto 0);	
   carry_out : out STD_LOGIC
);
end component;

signal multiplexor_out : STD_LOGIC_VECTOR(15 downto 0);
signal not_input_b : STD_LOGIC_VECTOR(15 downto 0);

begin
	not_input_b <= not input_b;
	 
	multiplexor_immediate: multiplexor_4_16bit port map (
		s0 => s(0),
		s1 => s(1),
		in0 => "0000000000000000",
		in1 => input_b,
		in2 => not_input_b,
		in3 => "1111111111111111",
		output => multiplexor_out
	);
	 
	ripple_adder: ripple_adder_16bit port map(
		carry_in => carry_in,
		x => input_a,
		y => multiplexor_out,
		output => output,
		carry_out => carry_out
	);
end behavioral;