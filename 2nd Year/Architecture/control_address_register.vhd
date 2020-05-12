library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity control_address_register is
	port( 
		address : in STD_LOGIC_VECTOR(7 downto 0);
		load: in STD_LOGIC;
		clk : in STD_LOGIC;
		output : out STD_LOGIC_VECTOR(7 downto 0)
	);
end control_address_register;

architecture Behavioral of control_address_register is

begin
	process(clk, load)
		variable current_address : integer := 191;
		begin
			if (rising_edge(clk)) then
				if load='1' then
					output <= address after 1ns;
					current_address := conv_integer(address);
				else 
					current_address := current_address + 1;
					output <= conv_STD_LOGIC_vector(current_address, output'length);
				end if;
			end if;
	end process;
end Behavioral;
