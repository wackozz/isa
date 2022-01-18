-------------------------------------------------------------------------------
-- Title      : Testbench for design "RV32I"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : RV32I_tb.vhd
-- Author     : stefano  <stefano@stefano-N56JK>
-- Company    : 
-- Created    : 2022-01-10
-- Last update: 2022-01-18
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2022 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2022-01-10  0.1      stefano Created
-- 2022-01-17  1.0      wackoz  initial experient
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.param_pkg.all;
use ieee.std_logic_textio.all;
use std.textio.all;

-------------------------------------------------------------------------------

entity RV32I_tb is

end entity RV32I_tb;

-------------------------------------------------------------------------------

architecture arch of RV32I_tb is
  signal clock               : std_logic := '0';
  signal reset               : std_logic;
  signal inst_adr, data_adr  : integer range 0 to 256;
  signal write_data_mem      : std_logic_vector(31 downto 0);
  signal data_mem_adr        : std_logic_vector(31 downto 0);
  signal MemWrite            : std_logic;
  signal read_data_mem       : std_logic_vector (31 downto 0);
  signal instruction_mem_adr : std_logic_vector(31 downto 0);
  signal instruction_fetch   : std_logic_vector(31 downto 0);
  signal MemRead             : std_logic;

  component ram is
    port (
      clock    : in  std_logic;
      data     : in  std_logic_vector (31 downto 0);
      address  : in  integer range 0 to 256;
      w_en     : in  std_logic;
      q        : out std_logic_vector (31 downto 0);
      reset    : in  std_logic;
      filename : in  string(1 to 8));
  end component ram;

  component RV32I is
    port (
      clock               : in  std_logic;
      reset               : in  std_logic;
      instruction_mem_adr : out std_logic_vector(31 downto 0);
      instruction_fetch   : in  std_logic_vector(31 downto 0);
      read_data_mem       : in  std_logic_vector(31 downto 0);
      write_data_mem      : out std_logic_vector(31 downto 0);
      data_mem_adr        : out std_logic_vector(31 downto 0);
      MemWrite            : out std_logic;
      MemRead             : out std_logic);
  end component RV32I;

begin  -- architecture arch

  clock <= not clock after 10 ns;

  -- waveform generation
  WaveGen_Proc : process
  begin
    --reset test
    wait for 1 ns;
    reset <= '0';
    wait for 3 ns;
    reset <= '1';
    wait;
  end process WaveGen_Proc;

  -- component instantiation
  processor : RV32I
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

  -- instance "ram_1"
  ram_instr : ram
    port map (
      clock    => clock,
      data     => x"00000000",
      address  => inst_adr,
      w_en     => '0',
      q        => instruction_fetch,
      reset    => reset,
      filename => "inst.txt");

  -- instance "ram_2"
  ram_data : ram
    port map (
      clock    => clock,
      data     => write_data_mem,
      address  => data_adr,
      w_en     => MemWrite,
      q        => read_data_mem,
      reset    => reset,
      filename => "data.txt");


  data_adr <= to_integer(unsigned(data_mem_adr(7 downto 0)));
  inst_adr <= to_integer(unsigned(instruction_mem_adr(7 downto 0)));
end architecture arch;

-------------------------------------------------------------------------------

configuration RV32I_tb_arch_cfg of RV32I_tb is
  for arch
  end for;
end RV32I_tb_arch_cfg;

-------------------------------------------------------------------------------
