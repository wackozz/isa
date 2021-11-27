library ieee;
use ieee.std_logic_1164.all;

entity full_adder_vhdl_code is
  port (A    : in  std_logic;
        B    : in  std_logic;
        Cin  : in  std_logic;
        S    : out std_logic;
        Cout : out std_logic);
end full_adder_vhdl_code;

architecture gate_level of full_adder_vhdl_code is

begin

  S    <= A xor B xor Cin;
  Cout <= (A and B) or (Cin and A) or (Cin and B);

end gate_level;
