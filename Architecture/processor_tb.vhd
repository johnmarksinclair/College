library ieee;
use ieee.std_logic_1164.all;
 
entity processor_tb is
end processor_tb;
 
architecture behavior of processor_tb is 

component processor
port( 
    clk : in STD_LOGIC;
    reg0: out STD_LOGIC_VECTOR(15 downto 0);
    reg1: out STD_LOGIC_VECTOR(15 downto 0);
    reg2: out STD_LOGIC_VECTOR(15 downto 0);
    reg3: out STD_LOGIC_VECTOR(15 downto 0);
    reg4: out STD_LOGIC_VECTOR(15 downto 0);
    reg5: out STD_LOGIC_VECTOR(15 downto 0);
    reg6: out STD_LOGIC_VECTOR(15 downto 0);
    reg7: out STD_LOGIC_VECTOR(15 downto 0);
    reg8: out STD_LOGIC_VECTOR(15 downto 0);
    PC_test : out STD_LOGIC_VECTOR(15 downto 0);
    control_out : out STD_LOGIC_VECTOR(27 downto 0);
    ir_in : out STD_LOGIC_VECTOR(15 downto 0);
);
end component;

--In
signal clk : STD_LOGIC;

--Out
signal reg0 : STD_LOGIC_VECTOR(15 downto 0);
signal reg1 : STD_LOGIC_VECTOR(15 downto 0);
signal reg2 : STD_LOGIC_VECTOR(15 downto 0);
signal reg3 : STD_LOGIC_VECTOR(15 downto 0);
signal reg4 : STD_LOGIC_VECTOR(15 downto 0);
signal reg5 : STD_LOGIC_VECTOR(15 downto 0);
signal reg6 : STD_LOGIC_VECTOR(15 downto 0);
signal reg7 : STD_LOGIC_VECTOR(15 downto 0);
signal reg8 : STD_LOGIC_VECTOR(15 downto 0);
signal control_out : STD_LOGIC_VECTOR(27 downto 0);
signal ir_in : STD_LOGIC_VECTOR(15 downto 0);
signal PC_test : STD_LOGIC_VECTOR(15 downto 0);

begin
    uut: processor port map (
        clk => clk,
        reg0 => reg0,
        reg1 => reg1,
        reg2 => reg2,
        reg3 => reg3,
        reg4 => reg4,
        reg5 => reg5,
        reg6 => reg6,
        reg7 => reg7,
        reg8 => reg8,
        control_out => control_out,
        ir_in => ir_in,
        PC_test => PC_test
    );

	stim_proc: process
	begin	
		clk <= '0';
		wait for 20 ns;	
		clk <= '1';
		wait for 20 ns;	
	end process;
end;
