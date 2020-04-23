library ieee;
use ieee.std_logic_1164.all;

entity register_16bit_tb is
end register_16bit_tb;
 
architecture behavior of register_16bit_tb is
 
component register_16bit
port(
	input: in STD_LOGIC_VECTOR(15 downto 0);
	load, clk : in STD_LOGIC;
	output: out STD_LOGIC_VECTOR(15 downto 0);
);
end component;

--In
signal load : STD_LOGIC := '0';
signal clk : STD_LOGIC := '0';
signal input : STD_LOGIC_VECTOR(15 downto 0); := (others => '0');
--Out
signal output : STD_LOGIC_VECTOR(15 downto 0);
   
begin
	uut: register_16bit port map (
	load => load,
	clk => clk,
	input => input,
	output => output
	);

	stim_proc: process
	begin
		load <= '1';
		input <= "1111111111111111";
		clk <= '0';
		wait for 2 ns;	
		clk <= '1';
		wait for 2 ns;	
		clk <= '0';
		input <= "0000000100000000";
		wait for 2 ns;
		clk <= '1';
		wait for 2 ns;
		clk <= '0';
		load <= '0';
		input <= "0000111111110000";
		wait for 2 ns;
		clk <= '1';
		wait for 2 ns;
	end process;
end;
