library ieee;
use ieee.std_logic_1164.all;

entity decoder_8_1bit is 
	port( 
		s0: in STD_LOGIC;
		s1: in STD_LOGIC;
		s2: in STD_LOGIC;
		out0: out STD_LOGIC; 
		out1: out STD_LOGIC; 
		out2: out STD_LOGIC; 
		out3: out STD_LOGIC; 
		out4: out STD_LOGIC; 
		out5: out STD_LOGIC; 
		out6: out STD_LOGIC; 
		out7: out STD_LOGIC
	); 
end decoder_8_1bit;

architecture behavioral of decoder_8_1bit is

begin	
	out0 <= ( (not s2) and (not s1) and (not s0) ) after 1 ns;
	out1 <= ( (not s2) and (not s1) and (s0) ) after 1 ns;
	out2 <= ( (not s2) and (s1) and (not s0) ) after 1 ns;   
	out3 <= ( (not s2) and (s1) and (s0) ) after 1 ns;			
	out4 <= ( (s2) and (not s1) and (not s0) ) after 1 ns;
	out5 <= ( (s2) and (not s1) and (s0) ) after 1 ns;
	out6 <= ( (s2) and (s1) and (not s0) ) after 1 ns;   
	out7 <= ( (s2) and (s1) and (s0) ) after 1 ns;
end behavioral; 	