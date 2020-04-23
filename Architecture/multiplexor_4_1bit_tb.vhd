library ieee;
use ieee.std_logic_1164.all;

entity multiplexor_4_1bit_tb is
end multiplexor_4_1bit_tb;
 
architecture behavior of multiplexor_4_1bit_tb is 
component multiplexor_4_1bit
port( 
	s0 : in  STD_LOGIC;
	s1 : in  STD_LOGIC;
	in0 : in  STD_LOGIC;
	in1 : in  STD_LOGIC;
	in2 : in  STD_LOGIC;
	in3 : in  STD_LOGIC;
	output : out  STD_LOGIC
);
end component;
--In
signal s0 : STD_LOGIC := '0';
signal s1 : STD_LOGIC := '0';
signal in0 : STD_LOGIC;
signal in1 : STD_LOGIC;
signal in2 : STD_LOGIC;
signal in3 : STD_LOGIC;
--Out
signal output : STD_LOGIC;

begin
	uut: multiplexor_4_1bit port map (
		s0 => s0,
		s1 => s1,
		in0 => in0,
		in1 => in1,
		in2 => in2,
		in3 => in3,
		output => output
	);
	stim_proc: process
	begin	
		s0 <= '0';
		s1 <= '0';
		in0 <= '1';
		in1 <= '0';
		in2 <= '1';
		in3 <= '0';
		wait for 10 ns;	
		s0 <= '1';
		s1 <= '0';
		wait for 10 ns;	
		s0 <= '0';
		s1 <= '1';
		wait for 10 ns;	
		s0 <= '1';
		s1 <= '1';
		wait for 10 ns;
	end process;
end;
