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
-- 2021-11-09  1.0      wackoz	Created
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
  signal clk   : std_logic;
  signal FP_Z  : std_logic_vector (31 downto 0);

  -- clock
  signal Clk : std_logic := '1';

begin  -- architecture arch

  -- component instantiation
  DUT: entity work.FPmul
    port map (
      FP_A  => FP_A,
      FP_B  => FP_B,
      en    => en,
      rst_n => rst_n,
      clk   => clk,
      FP_Z  => FP_Z);

  -- clock generation
  Clk <= not Clk after 10 ns;

  -- waveform generation
  WaveGen_Proc: process
  begin
    -- insert signal assignments here

    wait until Clk = '1';
  end process WaveGen_Proc;

  

end architecture arch;

-------------------------------------------------------------------------------

configuration FPmul_tb_arch_cfg of FPmul_tb is
  for arch
  end for;
end FPmul_tb_arch_cfg;

-------------------------------------------------------------------------------
