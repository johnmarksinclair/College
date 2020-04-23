library ieee;
use ieee.std_logic_1164.all;

entity function_unit_16bit is
port ( 
	s : in STD_LOGIC_VECTOR(4 downto 0);
	V, C, N, Z : out  STD_LOGIC;
	input_a : in  STD_LOGIC_VECTOR(15 downto 0);
	input_b : in  STD_LOGIC_VECTOR(15 downto 0);
	output : out  STD_LOGIC_VECTOR(15 downto 0)
);
end function_unit_16bit;

architecture behavioral of function_unit_16bit is

component multiplexor_2_16bit
port(
	s : in STD_LOGIC;
	in0 : in STD_LOGIC_VECTOR(15 downto 0);
	in1 : in STD_LOGIC_VECTOR(15 downto 0);
	output : out STD_LOGIC_VECTOR(15 downto 0);
);
end component;

component arithmetic_logic_unit_16bit
port( 
	s : in STD_LOGIC_VECTOR(2 downto 0); 
	carry_in : in  STD_LOGIC;
	input_a : in  STD_LOGIC_VECTOR(15 downto 0);
	input_b : in  STD_LOGIC_VECTOR(15 downto 0);
	carry : out STD_LOGIC;
	negative : out STD_LOGIC;
	overflow : out STD_LOGIC;
	zero : out STD_LOGIC;
	output : out  STD_LOGIC_VECTOR(15 downto 0);
);
end component;

component shifter_16bit
port(
	s0, s1 : in  STD_LOGIC;
	input : in  STD_LOGIC_VECTOR(15 downto 0);
	output : out  STD_LOGIC_VECTOR(15 downto 0)
);
end component;

signal arithmetic_logic_unit_out : STD_LOGIC_VECTOR(15 downto 0);
signal shifter_out : STD_LOGIC_VECTOR(15 downto 0);


begin
	multiplexor_select: multiplexor_2_16bit port map (
		s => s(4),
		in0 => arithmetic_logic_unit_out,
		in1 => shifter_out,
		output => output
	);

	arithmetic_logic_unit : arithmetic_logic_unit_16bit port map (
		carry_in => s(0),
		s => s(3 downto 1),
		input_a => input_a,
		input_b => input_b,
		carry => C,
		negative => N,
		overflow => V,
		zero => Z,
		output => arithmetic_logic_unit_out
	);

	shifter : shifter_16bit port map (
		s0 => s(2), 
		s1 => s(3), 
		input => input_b, 
		output => shifter_out
	);
end behavioral;
