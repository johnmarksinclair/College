library ieee;
use ieee.std_logic_1164.all;
entity logic_unit_16bit_tb is
end logic_unit_16bit_tb;
architecture behavioral of logic_unit_16bit_tb is
component logic_unit_16bit
	port( 
		s : in std_logic_vector(1 downto 0);
		input_a : in  std_logic_vector(15 downto 0);
		input_b : in  std_logic_vector(15 downto 0);
		output : out  std_logic_vector(15 downto 0)
	);
end component;
signal s : std_logic_vector(1 downto 0);
signal input_a : std_logic_vector(15 downto 0);
signal input_b : std_logic_vector(15 downto 0);
signal output : std_logic_vector(15 downto 0);
constant clk_period : time := 10ns;
begin
uut: logic_unit_16bit port map (
	s => s,
	input_a => input_a,
	input_b => input_b,
	output => output
);
stim_proc: process
begin
    input_a <= "0000000000000000";
	input_b <= "0000000000000001";
	s <= "00";
    wait for 10 ns;	
	s <= "01";
	wait for 10 ns;	
	s <= "10";
	wait for 10 ns;
	s <= "11";
	wait for 10 ns;
end process;
end;
