library ieee;
use ieee.std_logic_1164.all;
 
entity control_address_register_tb is
end control_address_register_tb;
 
architecture behavioral of control_address_register_tb is 
 
component control_address_register
    port( 
			address : in STD_LOGIC_VECTOR(7 downto 0);
			load: in STD_LOGIC;
			clk : in STD_LOGIC;
			output : out STD_LOGIC_VECTOR(7 downto 0)
	);
end component;
--In
signal address : STD_LOGIC_VECTOR(7 downto 0);
signal clk : STD_LOGIC := '0';
signal load : STD_LOGIC;
--Out
signal output : STD_LOGIC_VECTOR(7 downto 0);
 
begin
	uut: control_address_register port map (
	  address => address,
	  load => load,
	  clk => clk,
	  output => output
	);

	stim_proc: process
	begin
		load <= '0';
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
		address <= "00000000";
		clk <= '0';
		load <= '1';
		wait for 10 ns;	
		clk <= '1';
		wait for 10 ns;
		clk <= '0';
		load <= '0';
		wait for 10 ns;	
		clk <= '1';
		wait for 10 ns;	
		address <= "11111111";
		clk <= '0';
		load <= '1';
		wait for 10 ns;	
		clk <= '1';
		wait for 10 ns;
	end process;
end;