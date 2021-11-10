library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity iir_filter is
  port (
    clock          : in  std_logic;
    rst_n          : in  std_logic;
    din            : in  std_logic_vector(8 downto 0);
    c1, c2         : in  std_logic_vector(8 downto 0);  -- c1=a1^2-a2, c2=a1*a2
    d0, d1, d2, d3 : in  std_logic_vector(8 downto 0);  -- d0: b0, d1=b1-a1*b0,
                                                        -- d2=b2-a1*b1, d3=b2
    vin            : in  std_logic;
    dout           : out std_logic_vector(8 downto 0);
    vout           : out std_logic
    );
end iir_filter;

architecture arch of iir_filter is
  component reg is
    generic (
      N : integer);
    port (
      D                    : in  std_logic_vector(N - 1 downto 0);
      clock, reset, enable : in  std_logic;
      Q                    : out std_logic_vector(N - 1 downto 0));
  end component reg;

  component ff is
    port (
      D                    : in  std_logic;
      clock, reset, enable : in  std_logic;
      Q                    : out std_logic);
  end component ff;

  signal tmp_a_slv, tmp_b_slv, q_reg1, q_reg2, q_reg3 : std_logic_vector(8 downto 0);
  signal din_s                                        : signed(8 downto 0);
  signal c1_s, c2_s, d0_s, d1_s, d2_s, d3_s           : signed(8 downto 0);
  signal TMPq2_c1, TMPq3_c2                           : signed(17 downto 0);
  signal TMPtmpa_d0, TMPq1_d1, TMPq2_d2, TMPq3_d3     : signed(17 downto 0);
  signal TMPa                                         : signed(8 downto 0);
  signal TMPb                                         : signed(8 downto 0);

begin
  TMPq2_c1 <= signed(q_reg2) * c1_s;
  TMPq3_c2 <= signed(q_reg3) * c2_s;
  TMPa     <= din_s + TMPq2_c1(16 downto 8) + TMPq3_c2(16 downto 8);

  TMPtmpa_d0 <= TMPa * d0_s;
  TMPq1_d1   <= signed(q_reg1) * d1_s;
  TMPq2_d2   <= signed(q_reg2) * d2_s;
  TMPq3_d3   <= signed(q_reg3) * d3_s;

  TMPb <= TMPtmpa_d0(16 downto 8) + TMPq1_d1(16 downto 8) + TMPq2_d2(16 downto 8) + TMPq3_d3(16 downto 8);

  -- instance "reg_1"
  reg_1 : reg
    generic map(
      N => 9)
    port map(
      D      => tmp_a_slv,
      clock  => clock,
      reset  => rst_n,
      enable => vin,
      Q      => q_reg1);

  -- instance "reg_2"
  reg_2 : reg
    generic map(
      N => 9)
    port map(
      D      => q_reg1,
      clock  => clock,
      reset  => rst_n,
      enable => vin,
      Q      => q_reg2);

  -- instance "reg_2"
  reg_3 : reg
    generic map(
      N => 9)
    port map(
      D      => q_reg2,
      clock  => clock,
      reset  => rst_n,
      enable => vin,
      Q      => q_reg3);

  -- instance "reg_dout"
  reg_dout : reg
    generic map(
      N => 9)
    port map(
      D      => tmp_b_slv,
      clock  => clock,
      reset  => rst_n,
      enable => vin,
      Q      => dout);

  -- instance "ff"
  ff_1 : ff
    port map(
      D      => vin,
      clock  => clock,
      reset  => rst_n,
      enable => '1',
      Q      => vout);

  din_s     <= signed(din);
  c1_s      <= signed(c1);
  c2_s      <= signed(c2);
  d0_s      <= signed(d0);
  d1_s      <= signed(d1);
  d2_s      <= signed(d2);
  d3_s      <= signed(d3);
  tmp_a_slv <= std_logic_vector(tmpa);
  tmp_b_slv <= std_logic_vector(tmpb);
end architecture;
