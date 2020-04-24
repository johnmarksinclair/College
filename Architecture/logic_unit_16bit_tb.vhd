library ieee;
use ieee.std_logic_1164.all;
 
entity logic_unit_16bit_tb is
end logic_unit_16bit_tb;

architecture behavioral of logic_unit_16bit_tb is

component logic_unit_16bit
	port( 
		s : in STD_LOGIC_VECTOR(1 downto 0);
		input_a : in  STD_LOGIC_VECTOR(15 downto 0);
		input_b : in  STD_LOGIC_VECTOR(15 downto 0);
		output : out  STD_LOGIC_VECTOR(15 downto 0)
	);
end component;
--In
signal s : STD_LOGIC_VECTOR(1 downto 0);
signal input_a : STD_LOGIC_VECTOR(15 downto 0);
signal input_b : STD_LOGIC_VECTOR(15 downto 0);
--Out
signal output : STD_LOGIC_VECTOR(15 downto 0);
   
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