library ieee;
use ieee.std_logic_1164.all;
entity ram is
  port
    (
      clock         : in  std_logic;
      data          : in  std_logic_vector (31 downto 0);
      address  : in  integer range 0 to 31;
      w_en          : in  std_logic;
      q             : out std_logic_vector (31 downto 0)
      );
end ram;
architecture rtl of ram is
  type mem is array(0 to 31) of std_logic_vector(31 downto 0);
  signal ram_block : mem;
begin
  process (clock)
  begin
    if (clock'event and clock = '1') then
      if (w_en = '1') then
        ram_block(address) <= data;
      end if;
      q <= ram_block(address);
    end if;
  end process;
end rtl;
