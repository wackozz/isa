-------------------------------------------------------------------------------
-- Title      : Testbench for design "FPmul"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : FPmul_tb.vhd<src>
-- Author     : wackoz  <wackoz@wT14>
-- Company    : 
-- Created    : 2021-11-09
-- Last update: 2021-11-09
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2021 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2021-11-09  1.0      wackoz  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity FPmul_tb is

end entity FPmul_tb;

-------------------------------------------------------------------------------

architecture arch of FPmul_tb is

  -- component ports
  signal FP_A  : std_logic_vector (31 downto 0);
  signal FP_B  : std_logic_vector (31 downto 0);
  signal en    : std_logic;
  signal rst_n : std_logic;
  signal FP_Z  : std_logic_vector (31 downto 0);

  -- clock
  signal Clk : std_logic := '1';

begin  -- architecture arch

  -- component instantiation
  DUT : entity work.FPmul
    port map (
      FP_A  => FP_A,
      FP_B  => FP_B,
      en    => en,
      rst_n => rst_n,
      clk   => clk,
      FP_Z  => FP_Z);

  -- clock generation
  clk <= not clk after 10 ns;
  -- waveform generation
  WaveGen_Proc : process
  begin
    en    <= '1';
    rst_n <= '0';
    wait for 7 ns;
    rst_n <= '1';
    FP_A  <= x"00000000";
    FP_B  <= x"00000000";
    wait until clk = '1';

    FP_A <= x"3e9e377a";
    FP_B <= x"3e9e377a";
    wait until clk = '1';

    FP_A <= x"25a00002";
    FP_B <= x"25a00002";
    wait until clk = '1';

    FP_A <= x"3f4f1bbd";
    FP_B <= x"3f4f1bbd";
    wait until clk = '1';

    FP_A <= x"25400003";
    FP_B <= x"25400003";
    wait until clk = '1';

    FP_A <= x"3f800000";
    FP_B <= x"3f800000";
    wait until clk = '1';

    FP_A <= x"a5e00002";
    FP_B <= x"a5e00002";
    wait until clk = '1';

    FP_A <= x"3f4f1bbd";
    FP_B <= x"3f4f1bbd";
    wait until clk = '1';

    FP_A <= x"a6900000";
    FP_B <= x"a6900000";
    wait until clk = '1';

    FP_A <= x"3e9e377a";
    FP_B <= x"3e9e377a";
    wait;
  end process WaveGen_Proc;




end architecture arch;

-------------------------------------------------------------------------------

configuration FPmul_tb_arch_cfg of FPmul_tb is
  for arch
  end for;
end FPmul_tb_arch_cfg;

-------------------------------------------------------------------------------
