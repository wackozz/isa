library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity iir_filter is
  port (
    clock : in std_logic;
    rst_n : in std_logic;
    din : in std_logic_vector(8 downto 0);
    a1, c2, c3 : in std_logic_vector(8 downto 0); -- c1=a1*a1-a2, c2=-a1*a2
    b0, b1, b2 : in std_logic_vector(8 downto 0);
    vin : in std_logic;
    dout : out std_logic_vector(8 downto 0);
    vout : out std_logic
  );
end iir_filter;

architecture arch of iir_filter is
  component reg is
    generic (
      N : integer);
    port (
      D : in std_logic_vector(N - 1 downto 0);
      clock, reset, enable : in std_logic;
      Q : out std_logic_vector(N - 1 downto 0));
  end component reg;

  component ff is
    port (
      D : in std_logic;
      clock, reset, enable : in std_logic;
      Q : out std_logic);
  end component ff;

  -- signal decl
  signal tmp_a_slv, q_reg1, q_reg2, q_reg3, q_reg4, q_reg5, q_reg6, q_reg7, q_reg8 : std_logic_vector (6 downto 0);
  signal q_reg3_s, q_reg4_s, q_reg2_s, q_reg1_s, q_reg5_s, q_reg6_s, q_reg7_s, q_reg8_s : signed (6 downto 0);
  signal din_s, TMPa, TMP_reg1 : signed (6 downto 0);
  signal a1_s, c2_s, c3_s, b0_s, b1_s, b2_s : signed (6 downto 0);
  signal TMPq2_c2, TMPq3_c3, TMP_a1 : signed(13 downto 0);
  signal TMPq8_b0, TMPq7_b1, TMPq5_b2 : signed(13 downto 0);
  signal TMPb : signed (7 downto 0);
  signal tmp_b_slv, dout_pad: std_logic_vector(7 downto 0);
begin
  TMP_a1 <= din_s * a1_s;
  TMPq3_c3 <= q_reg3_s * c3_s;
  TMPq2_c2 <= q_reg4_s * c2_s;
  TMP_reg1 <= TMP_a1(12 downto 6) + TMPq3_c3(12 downto 6);
  TMPa <= din_s + q_reg1_s + q_reg2_s;

  TMPq8_b0 <= q_reg8_s * b0_s;
  TMPq7_b1 <= q_reg7_s * b1_s;
  TMPq5_b2 <= q_reg5_s * b2_s;
  TMPb <= TMPq8_b0(13 downto 6) + TMPq7_b1(13 downto 6) + TMPq5_b2(13 downto 6);
 
  -- instance reg 
  reg_1 : reg
  generic map(
    N => 7)
  port map(
    D => std_logic_vector(TMP_reg1),
    clock => clock,
    reset => rst_n,
    enable => vin,
    Q => q_reg1);

  reg_2 : reg
  generic map(
    N => 7)
  port map(
    D => std_logic_vector(TMPq2_c2(12 downto 6)),
    clock => clock,
    reset => rst_n,
    enable => vin,
    Q => q_reg2);

  reg_3 : reg
  generic map(
    N => 7)
  port map(
    D => q_reg4,
    clock => clock,
    reset => rst_n,
    enable => vin,
    Q => q_reg3);
  reg_4 : reg
  generic map(
    N => 7)
  port map(
    D => tmp_a_slv,
    clock => clock,
    reset => rst_n,
    enable => vin,
    Q => q_reg4);

  reg_5 : reg
  generic map(
    N => 7)
  port map(
    D => q_reg6,
    clock => clock,
    reset => rst_n,
    enable => vin,
    Q => q_reg5);

  reg_6 : reg
  generic map(
    N => 7)
  port map(
    D => q_reg4,
    clock => clock,
    reset => rst_n,
    enable => vin,
    Q => q_reg6);

  reg_7 : reg
  generic map(
    N => 7)
  port map(
    D => q_reg4,
    clock => clock,
    reset => rst_n,
    enable => vin,
    Q => q_reg7);

  reg_8 : reg
  generic map(
    N => 7)
  port map(
    D => tmp_a_slv,
    clock => clock,
    reset => rst_n,
    enable => vin,
    Q => q_reg8);

  -- instance "ff"
  ff_1 : ff
    port map(
      D      => vin,
      clock  => clock,
      reset  => rst_n,
      enable => '1',
      Q      => vout);

    -- instance "reg_dout"
    reg_dout : reg
    generic map(
      N => 8)
    port map(
      D      => tmp_b_slv,
      clock  => clock,
      reset  => rst_n,
      enable => vin,
      Q      => dout_pad);

  din_s <= signed(din(8 downto 2));
  a1_s <= signed(a1(8 downto 2));
  c2_s <= signed(c2(8 downto 2));
  c3_s <= signed(c3(8 downto 2));
  b0_s      <= signed(b0(8 downto 2));
  b1_s      <= signed(b1(8 downto 2));
  b2_s      <= signed(b2(8 downto 2));
  q_reg1_s <= signed(q_reg1);
  q_reg2_s <= signed(q_reg2);
  q_reg3_s <= signed(q_reg3);
  q_reg4_s <= signed(q_reg4);
  q_reg5_s <= signed(q_reg5);
  q_reg6_s <= signed(q_reg6);
  q_reg7_s <= signed(q_reg7);
  q_reg8_s <= signed(q_reg8);
  tmp_a_slv <= std_logic_vector(TMPa);
  tmp_b_slv <= std_logic_vector(tmpb);
  dout      <= dout_pad & '0';
end architecture;