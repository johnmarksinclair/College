library ieee;
use ieee.std_logic_1164.all;

entity function_unit_16bit_tb is
end function_unit_16bit_tb;

architecture behavioral of function_unit_16bit_tb is

component function_unit_16bit
port( 
	s : in STD_LOGIC_VECTOR(4 downto 0);
	V, C, N, Z : out  STD_LOGIC;
    input_a : in  STD_LOGIC_VECTOR(15 downto 0);
	input_b : in  STD_LOGIC_VECTOR(15 downto 0);
    output : out  STD_LOGIC_VECTOR(15 downto 0)
);
end component;
--In
signal s : STD_LOGIC_VECTOR(4 downto 0);
signal input_a : STD_LOGIC_VECTOR(15 downto 0);
signal input_b : STD_LOGIC_VECTOR(15 downto 0);
--Out
signal C : STD_LOGIC;
signal V : STD_LOGIC;
signal N : STD_LOGIC;
signal Z : STD_LOGIC;
signal output : STD_LOGIC_VECTOR(15 downto 0);

begin
	uut: function_unit_16bit port map(
		s => s,
		C => C,
		V => V,
		Z => Z,
		N => N,
		input_a => input_a,
		input_b => input_b,
		output => output
	);

	stim_proc: process
	begin		
		input_a <= "1111111100000000";
		input_b <= "0000000011111111";
		s <= "00000";
		wait for 20 ns;	
		s <= "00001";
		wait for 20 ns;	
		s <= "00010";
		wait for 20 ns;	
		s <= "00011";
		wait for 20 ns;	
		s <= "00100";
		wait for 20 ns;	
		s <= "00101";
		wait for 20 ns;	
		s <= "00110";
		wait for 20 ns;	
		s <= "00111";
		wait for 20 ns;	
		s <= "01000";
		wait for 20 ns;	
		s <= "01010";
		wait for 20 ns;	
		s <= "01100";
		wait for 20 ns;	
		s <= "01110";
		wait for 20 ns;	
		s <= "10000";
		wait for 20 ns;	
		s <= "10100";
		wait for 20 ns;	
		s <= "11000";
		wait for 20 ns;
	end process;
end;
