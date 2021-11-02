-------------------------------------------------------------------------------
-- Title      : Testbench for design "FPmul"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : FPmul_tb.vhd
-- Author     :   <isa18_2021_2022@localhost.localdomain>
-- Company    : 
-- Created    : 2021-11-02
-- Last update: 2021-11-02
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2021 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2021-11-02  1.0      isa18_2021_2022 Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity FPmul_tb is

end entity FPmul_tb;

-------------------------------------------------------------------------------
architecture arch of FPmul_tb is

  -- component ports
  signal FP_A : std_logic_vector (31 downto 0);
  signal FP_B : std_logic_vector (31 downto 0);
  signal clk  : std_logic := '1';
  signal FP_Z : std_logic_vector (31 downto 0);

begin  -- architecture arch

  -- component instantiation
  DUT : entity work.FPmul
    port map (
      FP_A => FP_A,
      FP_B => FP_B,
      clk  => clk,
      FP_Z => FP_Z);

  -- clock generation
  clk <= not Clk after 10 ns;

  -- waveform generation
  WaveGen_Proc : process
  begin
    FP_A <= x"00000014";
    FP_B <= x"00000017";
    wait for 20 ns;

    --FP_A <= x"000000f6";
    --FP_B <= x"00000026";
    --wait for 20 ns;
  end process WaveGen_Proc;

  

end architecture arch;

-------------------------------------------------------------------------------

configuration FPmul_tb_arch_cfg of FPmul_tb is
  for arch
  end for;
end FPmul_tb_arch_cfg;

-------------------------------------------------------------------------------
