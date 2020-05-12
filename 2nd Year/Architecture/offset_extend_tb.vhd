library ieee;
use ieee.std_logic_1164.all;
 
entity offset_extend_tb is
end offset_extend_tb;
 
architecture behavior of offset_extend_tb is 
 
component offset_extend
port( 
	dr : in STD_LOGIC_VECTOR(2 downto 0);
	sb : in STD_LOGIC_VECTOR(2 downto 0);
	output : out STD_LOGIC_VECTOR( 15 downto 0)
);	
end component; 

--In
signal dr : STD_LOGIC_VECTOR(2 downto 0);
signal sb : STD_LOGIC_VECTOR(2 downto 0);

--Out
signal output : STD_LOGIC_VECTOR(15 downto 0);

begin
	uut: offset_extend port map (
		dr => dr,
		sb => sb,
		output => output
	);

	stim_proc: process
	begin
		dr<="100";
		sb<="001";
		wait for 5 ns;
		dr<="000";
		sb<="001";
		wait for 5 ns;
	end process;
end;
