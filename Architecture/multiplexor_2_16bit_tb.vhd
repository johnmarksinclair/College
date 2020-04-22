library ieee;
use ieee.std_logic_1164.all;
entity multiplexor_2_16bit_tb is
end multiplexor_2_16bit_tb;
architecture behavior of multiplexor_2_16bit_tb is
  	component multiplexor_2_16bit
    port(
         s : in  std_logic;
         in0 : in  std_logic_vector(15 downto 0);
         in1 : in  std_logic_vector(15 downto 0);
         output : out  std_logic_vector(15 downto 0)
    );
    end component;
	signal s : std_logic := '0';
	signal in0 : std_logic_vector(15 downto 0) := (others => '0');
	signal in1 : std_logic_vector(15 downto 0) := (others => '0');
	signal output : std_logic_vector(15 downto 0);
	constant clk_period : time := 10 ns;
begin
	uut: multiplexor_2_16bit port map (
		s => s,
		in0 => in0,
		in1 => in1,
		output => output
	);
	stim_proc: process
	begin	
		in0 <= "1010101010101010";
		in1 <= "1100110011001100";
		s <= '0';
		wait for clk_period;
		s <= '1';
		wait for clk_period;
	end process;
end;
