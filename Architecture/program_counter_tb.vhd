library ieee;
use ieee.std_logic_1164.all;
 
entity program_counter_tb is
end program_counter_tb;
 
architecture behavior OF program_counter_tb is
 
component program_counter
  port( 
		pl : in STD_LOGIC;
		pi: in STD_LOGIC;
		clk: in STD_LOGIC;
		offset : in STD_LOGIC_VECTOR(15 downto 0);
		output : out STD_LOGIC_VECTOR(15 downto 0);
	);
end component;
--In
signal pi : STD_LOGIC;
signal clk : STD_LOGIC := '0';
signal pl : STD_LOGIC;
signal offset : STD_LOGIC_VECTOR(15 downto 0);
--Out
signal output : STD_LOGIC_VECTOR(15 downto 0);

begin
	uut: program_counter port map (
	pi => pi,
	pl => pl,
	offset => offset,
	clk => clk,
	output => output
	);

	stim_proc: process
	begin		
		clk <= '0';
		pi <= '1';
		pl <= '0';
		offset <= "0000111100001111";
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
		clk <= '0';
		pi <= '0';
		pl <= '1';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
	end process;

END;