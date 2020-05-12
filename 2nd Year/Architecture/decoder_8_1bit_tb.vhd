library ieee;
use ieee.std_logic_1164.all;
 
entity decoder_8_1bit_tb is
end decoder_8_1bit_tb;
 
architecture behavior of decoder_8_1bit_tb is 
component decoder_8_1bit
port(
	s0 : in  STD_LOGIC;
	s1 : in  STD_LOGIC;
	s2 : in  STD_LOGIC;
	out0: out STD_LOGIC; 
	out1: out STD_LOGIC; 
	out2: out STD_LOGIC; 
	out3: out STD_LOGIC; 
	out4: out STD_LOGIC; 
	out5: out STD_LOGIC; 
	out6: out STD_LOGIC; 
	out7: out STD_LOGIC 
);
end component;
--In
signal s0 : STD_LOGIC := '0';
signal s1 : STD_LOGIC := '0';
signal s2 : STD_LOGIC := '0';
--Out
signal out0 : STD_LOGIC;
signal out1 : STD_LOGIC;
signal out2 : STD_LOGIC;
signal out3 : STD_LOGIC;
signal out4 : STD_LOGIC;
signal out5 : STD_LOGIC;
signal out6 : STD_LOGIC;
signal out7 : STD_LOGIC;

begin
	uut: decoder_8_1bit port map(
		s0 => s0,
		s1 => s1,
		s2 => s2,
		out0 => out0,
		out1 => out1,
		out2 => out2,
		out3 => out3,
		out4 => out4,
		out5 => out5,
		out6 => out6,
		out7 => out7
    );

    stim_proc: process
	begin	
		s0 <= '0';
		s1 <= '0';
		s2 <= '0';
		wait for 5 ns;
		s0 <= '1';
		s1 <= '0';
		s2 <= '0';
		wait for 5 ns;
		s0 <= '0';
		s1 <= '1';
		s2 <= '0';
		wait for 5 ns;
		s0 <= '1';
		s1 <= '1';
		s2 <= '0';
		wait for 5 ns;
		s0 <= '0';
		s1 <= '0';
		s2 <= '1';
		wait for 5 ns;
		s0 <= '1';
		s1 <= '0';
		s2 <= '1';
		wait for 5 ns;
		s0 <= '0';
		s1 <= '1';
		s2 <= '1';
		wait for 5 ns;
		s0 <= '1';
		s1 <= '1';
		s2 <= '1';
		wait for 5 ns;
	end process;
end;
