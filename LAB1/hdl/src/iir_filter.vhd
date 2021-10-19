library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity iir_filter is
  port (

    clock : in std_logic;
    rst_n : in std_logic;
    din : in std_logic_vector(8 downto 0);
    a1, a2 : in std_logic_vector(8 downto 0);
    b0, b1, b2 : in std_logic_vector(8 downto 0);
    vin : in std_logic;
    dout : out std_logic_vector(8 downto 0);
    vout : out std_logic
  );
end iir_filter;

architecture arch of iir_filter is
  signal q_reg1, q_reg2 : signed(8 downto 0);
  signal din_s, dout_s : signed(8 downto 0);
  signal a1_s, a2_s, b0_s, b1_s, b2_s : signed(8 downto 0);

begin

  outputpro : process (clock, rst_n)
    variable TMPq1_a1 : signed(17 downto 0);
    variable TMPq2_a2 : signed(17 downto 0);
    variable TMPtmpa_b0 : signed(17 downto 0);
    variable TMPq1_b1 : signed(17 downto 0);
    variable TMPq2_b2 : signed(17 downto 0);
    variable TMPa : signed(8 downto 0);
    variable TMPb : signed(8 downto 0);
  begin
    if (rising_edge(clock)) then
      if (rst_n = '1') then
        if vin = '1' then
          q_reg2 <= q_reg1;
          --TMPa := din_s + (q_reg1 * a1_s + q_reg2 * a2_s);
          TMPq1_a1 := q_reg1 * a1_s;
          TMPq2_a2 := q_reg2 * a2_s;
          TMPa := din_s + (TMPq1_a1(16 downto 8) + TMPq2_a2(16 downto 8));
          q_reg1 <= TMPa;
          --TMPb := TMPa * b0_s + (q_reg1 * b1_s + q_reg2 * b2_s);
          TMPtmpa_b0 := TMPa * b0_s;
          TMPq1_b1 := q_reg1 * b1_s;
          TMPq2_b2 := q_reg2 * b2_s;
          TMPb := TMPtmpa_b0(16 downto 8) + TMPq1_b1(16 downto 8) + TMPq2_b2(16 downto 8);
          dout_s <= TMPb;
          vout <= '1';
        end if;
      else
        q_reg1 <= (others => '0');
        q_reg2 <= (others => '0');
      end if;
    end if;
  end process; -- outputpro
  a1_s <= signed(a1);
  a2_s <= signed(a2);
  b0_s <= signed(b0);
  b1_s <= signed(b1);
  b2_s <= signed(b2);
  din_s <= signed(din);
  dout <= std_logic_vector(dout_s);

end architecture;