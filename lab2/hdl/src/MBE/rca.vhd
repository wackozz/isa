library ieee;
use ieee.std_logic_1164.all;

entity ripple_carry_adder is
  generic (
    N : natural := 2
    );
  port (
    A   : in  std_logic_vector(N-1 downto 0);
    B   : in  std_logic_vector(N-1 downto 0);
    Cin : in  std_logic;
    Sum : out std_logic_vector(N downto 0)
    );
end ripple_carry_adder;


architecture str of ripple_carry_adder is

  component full_adder is
    port (
      A    : in  std_logic;
      B    : in  std_logic;
      Cin  : in  std_logic;
      Sum  : out std_logic;
      Cout : out std_logic);
  end component full_adder;

  signal w_CARRY : std_logic_vector(N downto 0);
  signal w_SUM   : std_logic_vector(N-1 downto 0);


begin

  w_CARRY(0) <= Cin;

  SET_WIDTH : for i in 0 to N-1 generate
    full_adder_inst : full_adder
      port map (
        A    => A(i),
        B    => B(i),
        Cin  => w_CARRY(i),
        Sum  => w_SUM(i),
        Cout => w_CARRY(i+1)
        );
  end generate SET_WIDTH;

  Sum <= w_CARRY(N) & w_SUM;            -- VHDL Concatenation

end str;
