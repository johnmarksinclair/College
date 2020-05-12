library ieee;
use ieee.std_logic_1164.all;
 
entity ripple_adder_16bit_tb is
end ripple_adder_16bit_tb;

architecture behavioral of ripple_adder_16bit_tb is

component ripple_adder_16bit
port(
   carry_in : in STD_LOGIC;
   x : in STD_LOGIC_VECTOR(15 downto 0);
   y : in STD_LOGIC_VECTOR(15 downto 0);
   output : out STD_LOGIC_VECTOR(15 downto 0);	
   carry_out : out STD_LOGIC
);
end component;
--In
signal x : STD_LOGIC_VECTOR(15 downto 0);
signal y : STD_LOGIC_VECTOR(15 downto 0);
signal carry_in : STD_LOGIC;
--Out
signal carry_out : STD_LOGIC;
signal output : STD_LOGIC_VECTOR(15 downto 0);

begin
	uut: ripple_adder_16bit port map (
	x => x,
	y => y,
	carry_in => carry_in,
	carry_out => carry_out,
	output => output
	);

	stim_proc: process
	begin		
		x <= "1111111111111111";
		y <= "0000000000000001";
		carry_in <= '1';
		wait for 20 ns;	
		x <= "1111111111111111";
		y <= "1111111111111111";
		carry_in <= '0';
		wait for 20 ns;	
		x <= "0000000000000000";
		y <= "0000000000000000";
		carry_in <= '1';
		wait for 20 ns;	
		x <= "0000000000000000";
		y <= "1111111111111111";
		carry_in <= '0';
		wait for 20 ns;	
	end process;
end;
