library ieee;
use ieee.std_logic_1164.all;
 
entity multiplexor_4_16bit_tb is
end multiplexor_4_16bit_tb;
 
architecture behavior of multiplexor_4_16bit_tb is 
component multiplexor_4_16bit
port(
	s0, s1 : in  STD_LOGIC;
	in0 : in  STD_LOGIC_VECTOR(15 downto 0);
	in1 : in  STD_LOGIC_VECTOR(15 downto 0);
	in2 : in  STD_LOGIC_VECTOR(15 downto 0);
	in3 : in  STD_LOGIC_VECTOR(15 downto 0);
	output : out  STD_LOGIC_VECTOR(15 downto 0);
);
end component;
--In
signal s0 : STD_LOGIC := '0';
signal s1 : STD_LOGIC := '0';
signal in0 : STD_LOGIC_VECTOR(15 downto 0); := (others => '0');
signal in1 : STD_LOGIC_VECTOR(15 downto 0); := (others => '0');
signal in2 : STD_LOGIC_VECTOR(15 downto 0); := (others => '0');
signal in3 : STD_LOGIC_VECTOR(15 downto 0); := (others => '0');
--Out
signal output : STD_LOGIC_VECTOR(15 downto 0);
 
begin
	uut: multiplexor_4_16bit port map (
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
		in0 <= "1010101010101010";
		in1 <= "1100110011001100";
		in2 <= "1111000011110000";
		in3 <= "1111111100000000";
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
