library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package param_pkg is
    constant N : integer := 32;
    constant n_min : integer := 5;
    type mux_array is array (0 to (N-1)) of std_logic_vector (N-1 downto 0);
end package param_pkg;