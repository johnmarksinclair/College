library ieee;
use ieee.std_logic_1164.all;

entity arithmetic_logic_unit_16bit is
    port( 
		s : in STD_LOGIC_VECTOR(2 downto 0); 
		carry_in : in  STD_LOGIC;
        input_a : in  STD_LOGIC_VECTOR(15 downto 0);
        input_b : in  STD_LOGIC_VECTOR(15 downto 0);
		carry : out STD_LOGIC;
		negative : out STD_LOGIC;
		overflow : out STD_LOGIC;
		zero : out STD_LOGIC;
		output : out  STD_LOGIC_VECTOR(15 downto 0)
	);
end arithmetic_logic_unit_16bit;

architecture behavioral of arithmetic_logic_unit_16bit is

component multiplexor_2_16bit
    port(
         s : in  STD_LOGIC;
         in0 : in  STD_LOGIC_VECTOR(15 downto 0);
         in1 : in  STD_LOGIC_VECTOR(15 downto 0);
         output : out  STD_LOGIC_VECTOR(15 downto 0)
    );
end component;

component arithmetic_unit_16bit
port(
	s : in STD_LOGIC_VECTOR(1 downto 0); 
	carry_in : in  STD_LOGIC;
    input_a : in  STD_LOGIC_VECTOR(15 downto 0);
    input_b : in  STD_LOGIC_VECTOR(15 downto 0);
	output : out  STD_LOGIC_VECTOR(15 downto 0);
	carry_out : out  STD_LOGIC
);
end component;

component logic_unit_16bit
	port( 
		s : in STD_LOGIC_VECTOR(1 downto 0);
		input_a : in  STD_LOGIC_VECTOR(15 downto 0);
		input_b : in  STD_LOGIC_VECTOR(15 downto 0);
		output : out  STD_LOGIC_VECTOR(15 downto 0)
	);
end component;

signal arithmetic_unit_out : STD_LOGIC_VECTOR(15 downto 0);
signal logic_unit_out : STD_LOGIC_VECTOR(15 downto 0);
signal result : STD_LOGIC_VECTOR(15 downto 0);
signal carry_result : STD_LOGIC;

begin
	multiplexor_select: multiplexor_2_16bit port map (
		s => s(2),
		in0 => arithmetic_unit_out,
		in1 => logic_unit_out,
		output => result
	);
	arithmetic_unit: arithmetic_unit_16bit port map(
		s => s(1 downto 0),
		carry_in => carry_in,
		input_a => input_a,
		input_b => input_b,
		output => arithmetic_unit_out,
		carry_out => carry_result
	);
	logic_unit: logic_unit_16bit port map(
		s => s(1 downto 0),
		input_a => input_a,
		input_b => input_b,
		output => logic_unit_out
	);
	output <= result;
	carry <= carry_result;
	overflow <= carry_result;
	negative <= 
		'1' after 1 ns when result(15) = '1' else
		'0' after 1 ns;
	zero <= 
		'1' after 1 ns when result = "0000000000000000" else
		'0' after 1 ns;
end behavioral;
