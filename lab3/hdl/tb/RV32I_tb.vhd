-------------------------------------------------------------------------------
-- Title      : Testbench for design "RV32I"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : RV32I_tb.vhd
-- Author     : stefano  <stefano@stefano-N56JK>
-- Company    : 
-- Created    : 2022-01-10
-- Last update: 2022-01-10
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2022 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2022-01-10  1.0      stefano Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.param_pkg.all;

-------------------------------------------------------------------------------

entity RV32I_tb is

end entity RV32I_tb;

-------------------------------------------------------------------------------

architecture arch of RV32I_tb is

  signal clock               : std_logic;
  signal reset               : std_logic;
  signal instruction_mem_adr : std_logic_vector(31 downto 0);
  signal instruction_fetch   : std_logic_vector(31 downto 0);
  signal read_data_mem       : std_logic_vector(31 downto 0);
  signal write_data_mem      : std_logic_vector(31 downto 0);
  signal data_mem_adr        : std_logic_vector(31 downto 0);
  signal MemWrite            : std_logic;
  signal MemRead             : std_logic;

  constant Tck : time := 10 ns;

begin  -- architecture arch

  -- component instantiation
  DUT : entity work.RV32I
    port map (
      clock               => clock,
      reset               => reset,
      instruction_mem_adr => instruction_mem_adr,
      instruction_fetch   => instruction_fetch,
      read_data_mem       => read_data_mem,
      write_data_mem      => write_data_mem,
      data_mem_adr        => data_mem_adr,
      MemWrite            => MemWrite,
      MemRead             => MemRead);

  clock_proc : process
  begin
    clock <= '0';
    wait for Tck/2;
    clock <= '1';
    wait for Tck/2;
  end process;


end architecture arch;

-------------------------------------------------------------------------------

configuration RV32I_tb_arch_cfg of RV32I_tb is
  for arch
  end for;
end RV32I_tb_arch_cfg;

-------------------------------------------------------------------------------
