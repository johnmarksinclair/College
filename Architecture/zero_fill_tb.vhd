library ieee;
use ieee.std_logic_1164.all;
 
entity zero_fill_tb is
end zero_fill_tb;
 
architecture behavior of zero_fill_tb is
 
component zero_fill
port( 
	input: in STD_LOGIC_VECTOR(2 downto 0);
	output : out STD_LOGIC_VECTOR( 15 downto 0)
);	
end component;
--In
signal input : STD_LOGIC_VECTOR(2 downto 0);
--Out
signal output : STD_LOGIC_VECTOR(15 downto 0);

begin
	uut: zero_fill port map (
		input => input,
		output => output
	);

	stim_proc: process
	begin		
		input <= "001";
		wait for 5 ns;	
		input <= "100";
		wait for 5 ns;	
	end process;
end;
