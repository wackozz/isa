library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.param_pkg.all;

entity mux_2to1 is
  port(
    in_mux_0 : in  std_logic_vector(N-1 downto 0);
    in_mux_1 : in  std_logic_vector(N-1 downto 0);
    sel      : in  std_logic;
    out_mux  : out std_logic_vector (N-1 downto 0));
end mux_2to1;

architecture arch of mux_2to1 is

begin
  dec_proc : process (sel) is
  begin
    out_mux <= (others => '0');
    case sel is
      when '0'    => out_mux <= in_mux_0;
      when '1'    => out_mux <= in_mux_1;
      when others => null;
    end case;
  end process;
end architecture arch;
