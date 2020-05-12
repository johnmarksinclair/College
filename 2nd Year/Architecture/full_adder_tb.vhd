library ieee;
use ieee.std_logic_1164.all;
 
entity full_adder_tb is
end full_adder_tb;

architecture behavioral of full_adder_tb is

component full_adder
port(
	x : in STD_LOGIC;
	y : in STD_LOGIC;
	carry_in : in STD_LOGIC;
	output : out STD_LOGIC;
	carry_out : out STD_LOGIC
);
end component;
--In
signal x : STD_LOGIC;
signal y : STD_LOGIC;
signal carry_in : STD_LOGIC;
--Out
signal output : STD_LOGIC;
signal carry_out : STD_LOGIC;
   
begin
	uut: full_adder port map (
		x => x,
		y => y,
		carry_in => carry_in,
		carry_out => carry_out,
		output => output
	);
	
	stim_proc: process
	begin
		x <= '0';
		y <= '0';
		carry_in <= '0';
		wait for 5 ns;	
		x <= '1';
		y <= '0';
		carry_in <= '0';
		wait for 5 ns;
		x <= '0';
		y <= '1';
		carry_in <= '0';
		wait for 5 ns;
		x <= '1';
		y <= '1';
		carry_in <= '0';
		wait for 5 ns;	
		x <= '0';
		y <= '0';
		carry_in <= '1';
		wait for 5 ns;
		x <= '1';
		y <= '0';
		carry_in <= '1';
		wait for 5 ns;
		x <= '0';
		y <= '1';
		carry_in <= '1';
		wait for 5 ns;
		x <= '1';
		y <= '1';
		carry_in <= '1';
		wait for 5 ns;
	end process;
end;