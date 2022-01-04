-------------------------------------------------------------------------------
-- Title      : Testbench for design "RV32I"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : RV32I_tb.vhd
-- Author     : wackoz  <wackoz@wT14>
-- Company    : 
-- Created    : 2022-01-03
-- Last update: 2022-01-03
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2022 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2022-01-03  1.0      wackoz	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity RV32I_tb is

end entity RV32I_tb;

-------------------------------------------------------------------------------

architecture arch of RV32I_tb is

  -- component ports
  signal clock           : std_logic;
  signal reset           : std_logic;
  signal regWrite        : std_logic;
  signal PCSrc           : std_logic;
  signal ALUSrc          : std_logic;
  signal MemtoReg        : std_logic;
  signal instruction     : std_logic_vector(N-1 downto 0);
  signal data            : std_logic_vector(N-1 downto 0);
  signal instruction_adr : std_logic_vector(N-1 downto 0);
  signal data_adr        : std_logic_vector(N-1 downto 0);

  -- clock
  signal Clk : std_logic := '1';

begin  -- architecture arch

  -- component instantiation
  DUT: entity work.RV32I
    port map (
      clock           => clock,
      reset           => reset,
      regWrite        => regWrite,
      PCSrc           => PCSrc,
      ALUSrc          => ALUSrc,
      MemtoReg        => MemtoReg,
      instruction     => instruction,
      data            => data,
      instruction_adr => instruction_adr,
      data_adr        => data_adr);

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

configuration RV32I_tb_arch_cfg of RV32I_tb is
  for arch
  end for;
end RV32I_tb_arch_cfg;

-------------------------------------------------------------------------------
