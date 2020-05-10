library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity memory_m is
	port(  
		memory_write: in STD_LOGIC;
		clk: in STD_LOGIC;
		data_in : in STD_LOGIC_VECTOR(15 downto 0);
		address : in STD_LOGIC_VECTOR(15 downto 0);
		data_out : out STD_LOGIC_VECTOR(15 downto 0)
	);
end memory_m;

architecture behavioral of memory_m is

type mem_array is array(0 to 511) of STD_LOGIC_VECTOR(15 downto 0);

begin
	memory_m: process(data_in, memory_write, clk)
		variable control_mem : mem_array:=(
		-- 0
		x"0007", -- 0
		x"0001", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- 1
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- 2
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- 3
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- 4
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- 5
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- 6
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- 7
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- 8
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- 9
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- A
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- B
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- C
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- D
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- E
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- F
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- 0
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- 1
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- 2
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- 3
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- 4
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- 5
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- 6
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- 7
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- 8
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- 9
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- A
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- B
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- C
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- D
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- E
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000", -- F

		-- F
		x"0000", -- 0
		x"0000", -- 1
		x"0000", -- 2
		x"0000", -- 3
		x"0000", -- 4
		x"0000", -- 5
		x"0000", -- 6
		x"0000", -- 7
		x"0000", -- 8
		x"0000", -- 9
		x"0000", -- A
		x"0000", -- B
		x"0000", -- C
		x"0000", -- D
		x"0000", -- E
		x"0000"  -- F

	);

	variable integer_address : integer;
	variable trimmed_address: STD_LOGIC_VECTOR(8 downto 0);
	variable array_output: STD_LOGIC_VECTOR(15 downto 0);

	begin 
		if (rising_edge(clk)) then
			trimmed_address := address(8 downto 0);
			integer_address := conv_integer(trimmed_address);

			if(memory_write = '0') then
				array_output := control_mem(integer_address);
				data_out <= array_output(15 downto 0);

			elsif (memory_write = '1') then 
				control_mem(integer_address) := data_in;

			else
			end if;
		end if;
	end process;
end behavioral;