library ieee;
use ieee.std_logic_1164.all;

entity processor is
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
end processor;

architecture behavioral of processor is

component datapath_16bit
	port(
		DR, SA, SB : in STD_LOGIC_VECTOR(2 downto 0);
		TA, TB, TD : in STD_LOGIC;
        constant_in : in STD_LOGIC_VECTOR(15 downto 0);
		W : in STD_LOGIC;
		clk : in STD_LOGIC;
        MB : in STD_LOGIC;
		MD : in STD_LOGIC;
		FS : in STD_LOGIC_VECTOR(4 downto 0);
		data_in : in STD_LOGIC_VECTOR(15 downto 0);
		N : out STD_LOGIC;
		V : out STD_LOGIC;
		C : out STD_LOGIC;
		Z : out STD_LOGIC;
		bus_a : out STD_LOGIC_VECTOR(15 downto 0);
		bus_b : out STD_LOGIC_VECTOR(15 downto 0);
		reg0 : out STD_LOGIC_VECTOR( 15 downto 0);
		reg1 : out STD_LOGIC_VECTOR( 15 downto 0);
		reg2 : out STD_LOGIC_VECTOR( 15 downto 0);
		reg3 : out STD_LOGIC_VECTOR( 15 downto 0);
		reg4 : out STD_LOGIC_VECTOR( 15 downto 0);
		reg5 : out STD_LOGIC_VECTOR( 15 downto 0);
		reg6 : out STD_LOGIC_VECTOR( 15 downto 0);
		reg7 : out STD_LOGIC_VECTOR( 15 downto 0);
		reg8 : out STD_LOGIC_VECTOR( 15 downto 0)
    );
end component;

component memory_m
  port( 
      memory_write : in STD_LOGIC;
		  clk : in STD_LOGIC;
		  data_in : in STD_LOGIC_VECTOR(15 downto 0);
		  address : in STD_LOGIC_VECTOR(15 downto 0);
      data_out : out STD_LOGIC_VECTOR(15 downto 0);
  );
end component;

component microcoded_control_unit
    port( 
        clk : in STD_LOGIC;
        V, C, N, Z : in STD_LOGIC;
        IR_in : in STD_LOGIC_VECTOR(15 downto 0);
        PC_out : out STD_LOGIC_VECTOR(15 downto 0);
        immediate_out : out STD_LOGIC_VECTOR(15 downto 0);
        FS : out STD_LOGIC_VECTOR(4 downto 0);
        MM : out STD_LOGIC;
        MW : out STD_LOGIC;
        MB : out STD_LOGIC;
        MD : out STD_LOGIC;
        RW : out STD_LOGIC;
        TD : out STD_LOGIC;
        TA : out STD_LOGIC;
        TB : out STD_LOGIC;
        DR : out STD_LOGIC_VECTOR(2 downto 0);
        SA : out STD_LOGIC_VECTOR(2 downto 0);
        SB : out STD_LOGIC_VECTOR(2 downto 0);
        control_out : out STD_LOGIC_VECTOR(27 downto 0)
    );
end component;

component multiplexor_2_16bit
    port(
        s : in  STD_LOGIC;
        in0 : in  STD_LOGIC_VECTOR(15 downto 0);
        in1 : in  STD_LOGIC_VECTOR(15 downto 0);
        output : out  STD_LOGIC_VECTOR(15 downto 0);
    );
end component;

signal V, C, N, Z : STD_LOGIC;
signal memory_out : STD_LOGIC_VECTOR(15 downto 0);
signal PC_out : STD_LOGIC_VECTOR(15 downto 0);
signal immediate_out : STD_LOGIC_VECTOR(15 downto 0);
signal FS : STD_LOGIC_VECTOR(4 downto 0);
signal MM : STD_LOGIC;
signal MW : STD_LOGIC;
signal MB : STD_LOGIC;
signal MD : STD_LOGIC;
signal RW : STD_LOGIC;
signal TD : STD_LOGIC;
signal TA : STD_LOGIC;
signal TB : STD_LOGIC;
signal DR : STD_LOGIC_VECTOR(2 downto 0);
signal SA : STD_LOGIC_VECTOR(2 downto 0);
signal SB : STD_LOGIC_VECTOR(2 downto 0);
signal bus_a : STD_LOGIC_VECTOR(15 downto 0);
signal bus_b : STD_LOGIC_VECTOR(15 downto 0);
signal memory_address : STD_LOGIC_VECTOR(15 downto 0);

begin
	datapath: datapath_16bit port map(
		TA => TA,
		TB => TB,
		TD => TD,
		DR=>DR,
		SA=>SA,
		SB=>SB,
		constant_in=>immediate_out,
		W=>RW,
		clk=>clk,
		MB=>MB,
		MD=>MD,
		FS=>FS,
		data_in=>memory_out,
		N=>N,
		V=>V,
		C=>C,
		Z=>Z,
		bus_a=>bus_a,
		bus_b=>bus_b,
		reg0=>reg0,
		reg1=>reg1,
		reg2=>reg2,
		reg3=>reg3,
		reg4=>reg4,
		reg5=>reg5,
		reg6=>reg6,
		reg7=>reg7,
		reg8 => reg8
	);

	control_unit : microcoded_control_unit port map(
		clk => clk,
		V => V,
		C => C,
		N => N,
		Z => Z,
		IR_in => memory_out,
		PC_out => PC_out,
		immediate_out => immediate_out,
		FS => FS,
		MM => MM,
		MW => MW,
		MB => MB,
		MD => MD,
		RW => RW,
		TD => TD,
		TA => TA,
		TB => TB,
		DR => DR,
		SA => SA,
		SB => SB,
		control_out => control_out
	);

	mux_m: multiplexor_2_16bit port map (
		s => MM,
		in0 => bus_a,
		in1 => PC_out,
		output => memory_address
	);

	memory: memory_m port map (
		memory_write => MW,
		clk => clk,
		data_in => bus_b,
		data_out => memory_out,
		address => memory_address
	);

	ir_in <= memory_out;
	PC_test <= PC_out;
end behavioral;