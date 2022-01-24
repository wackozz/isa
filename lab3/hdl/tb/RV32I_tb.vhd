-------------------------------------------------------------------------------
-- Title      : Testbench for design "RV32I"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : RV32I_tb.vhd
-- Author     : stefano  <stefano@stefano-N56JK>
-- Company    : 
-- Created    : 2022-01-10
-- Last update: 2022-01-24
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
  type instr is (UNDEFINED, LUI, AUIPC, JAL, BEQ, LW, SW, AL_IMMEDIATE, AL_REGISTERS, NOP);
  type alu_operation is (aluADD, aluAND, aluSRA, aluSLT, aluEXOR, UNDEFINED, NOT_USED);
  signal current_instruction : instr;
  signal current_alu_op      : alu_operation;

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
  constant NOP_instruction : std_logic_vector := "00000000000000000000000000011001";
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

  -- Label instructions
  instr_label : process is
  begin  -- process label
    if instruction_fetch = NOP_instruction then
      current_instruction <= NOP;
    else
      case instruction_fetch(6 downto 0) is
        when "0110111" => current_instruction <= LUI;
        when "0010111" => current_instruction <= AUIPC;
        when "1101111" => current_instruction <= JAL;
        when "1100011" => current_instruction <= BEQ;
        when "0000011" => current_instruction <= LW;
        when "0100011" => current_instruction <= SW;
        when "0010011" => current_instruction <= AL_IMMEDIATE;
        when "0110011" => current_instruction <= AL_REGISTERS;
        when others    => current_instruction <= UNDEFINED;
      end case;
    end if;
  end process instr_label;

  aluop_label : process is
  begin  -- process label
    if current_instruction = AL_REGISTERS or current_instruction = AL_IMMEDIATE then  
      case instruction_fetch(14 downto 12) is
        when "000"  => current_alu_op <= aluADD;
        when "111"  => current_alu_op <= aluAND;
        when "101"  => current_alu_op <= aluSRA;
        when "010"  => current_alu_op <= aluSLT;
        when "100"  => current_alu_op <= aluEXOR;
        when others => current_alu_op <= UNDEFINED;
      end case;
    else
      current_alu_op <= NOT_USED;
    end if;

  end process aluop_label;

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
