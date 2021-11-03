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
use ieee.std_logic_textio.all;
library std;
use std.textio.all;
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
    FP_A <= x"00000000";
    FP_B <= x"00000000";
    wait until clk = '1';

    FP_A <= x"3e8e377a";
    FP_B <= x"3e8e377a";
    wait until clk = '1';

    FP_A <= x"0bc80005";
    FP_B <= x"0bc80005";
    wait until clk = '1';

    FP_A <= x"3f278ddf";
    FP_B <= x"3f278ddf";
    wait until clk = '1';

    FP_A <= x"0b100005";
    FP_B <= x"0b100005";
    wait until clk = '1';

    FP_A <= x"3f800000";
    FP_B <= x"3f800000";
    wait until clk = '1';

    FP_A <= x"0c440004";
    FP_B <= x"0c440004";
    wait until clk = '1';

    FP_A <= x"3f278ddf";
    FP_B <= x"3f278ddf";
    wait until clk = '1';

    FP_A <= x"0da20000";
    FP_B <= x"0da20000";
    wait until clk = '1';

    FP_A <= x"3dc3910d";
    FP_B <= x"3dc3910d";
    wait until clk = '1';
  end process WaveGen_Proc;

  -- purpose: writing output file
  -- type   : sequential
  -- inputs : clk
  -- outputs: 
  results : process (clk) is
    file res_fp  : text open write_mode is "results_sim.txt";
    variable line_out : line;
  begin  -- process results
    if clk'event and clk = '1' then     -- rising clock edge
      hwrite(line_out, FP_Z);
      writeline(res_fp, line_out);
    end if;
  end process results;


end architecture arch;

-------------------------------------------------------------------------------

configuration FPmul_tb_arch_cfg of FPmul_tb is
  for arch
  end for;
end FPmul_tb_arch_cfg;

-------------------------------------------------------------------------------
