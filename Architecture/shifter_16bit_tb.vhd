library ieee;
use ieee.std_logic_1164.all;
 
entity shifter_16bit_tb is
end shifter_16bit_tb;
 
architecture behavior of shifter_16bit_tb is
 
component shifter_16bit
port(
	s0, s1 : in  STD_LOGIC;
	input : in  STD_LOGIC_VECTOR(15 downto 0);
	output : out  STD_LOGIC_VECTOR(15 downto 0)
);
end component;
--In
signal s0 : STD_LOGIC := '0';
signal s1 : STD_LOGIC := '0';
signal input : STD_LOGIC_VECTOR(15 downto 0); := (others => '0');
--Out
signal output : STD_LOGIC_VECTOR(15 downto 0);
 
begin
	uut : shifter_16bit port map(
		s0 => s0,
		s1 => s1,
		input => input,
		output => output
	);

	stim_proc: process
	begin
		input <= "1111111111111111";
		s0 <= '0';
		s1 <= '0';
		wait for 5 ns;
		s0 <= '1';
		s1 <= '0';
		wait for 5 ns;	
		s0 <= '0';
		s1 <= '1';
		wait for 5 ns;
		s0 <= '1';
		s1 <= '1';
		wait for 5 ns;	
	end process;
end;
