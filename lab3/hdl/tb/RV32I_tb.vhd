-------------------------------------------------------------------------------
-- Title      : Testbench for design "RV32I"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : RV32I_tb.vhd
-- Author     : stefano  <stefano@stefano-N56JK>
-- Company    : 
-- Created    : 2022-01-10
-- Last update: 2022-02-01
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
use ieee.std_logic_textio.all;
use std.textio.all;

-------------------------------------------------------------------------------

entity RV32I_tb is

end entity RV32I_tb;

-------------------------------------------------------------------------------

architecture arch of RV32I_tb is
  type instr is (LUI, AUIPC, JAL, BEQ, LW, SW, ADD, ADDI, ANDI, SRAI, SLT, EXOR, UNDEFINED, NOP);
  signal fetch, decode, execute, mem, writeback : instr;
  signal opcode                                 : std_logic_vector(6 downto 0);
  signal funct3                                 : std_logic_vector(2 downto 0);
  signal rs1_fetch, rs2_fetch, rd_fetch         : std_logic_vector(4 downto 0);
  signal rs1_decode, rs2_decode, rd_decode      : std_logic_vector(4 downto 0);
  signal rs1_execute, rs2_execute, rd_execute   : std_logic_vector(4 downto 0);
  signal rs1_mem, rs2_mem, rd_mem               : std_logic_vector(4 downto 0);
  signal rs1_wb, rs2_wb, rd_wb                  : std_logic_vector(4 downto 0);
  signal immediate                              : std_logic_vector(31 downto 0);

  signal clock               : std_logic        := '0';
  signal reset               : std_logic;
  signal inst_adr, data_adr  : integer range 0 to 256;
  signal write_data_mem      : std_logic_vector(31 downto 0);
  signal data_mem_adr        : std_logic_vector(31 downto 0);
  signal MemWrite            : std_logic;
  signal read_data_mem       : std_logic_vector (31 downto 0);
  signal instruction_mem_adr : std_logic_vector(31 downto 0);
  signal instruction_fetch   : std_logic_vector(31 downto 0);
  signal MemRead             : std_logic;
  constant NOP_instruction   : std_logic_vector := "00000000000000000000000000010011";

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

  fetch <= LUI when opcode = "0110111" else
           AUIPC when opcode = "0010111" else
           JAL   when opcode = "1101111" else
           BEQ   when opcode = "1100011" else
           LW    when opcode = "0000011" else
           SW    when opcode = "0100011" else
           ADDI  when opcode = "0010011" and funct3 = "000" and instruction_fetch /= NOP_instruction else
           ANDI  when opcode = "0010011" and funct3 = "111" else
           SRAI  when opcode = "0010011" and funct3 = "101" else
           ADD   when opcode = "0110011" and funct3 = "000" else
           SLT   when opcode = "0110011" and funct3 = "010" else
           EXOR  when opcode = "0110011" and funct3 = "100" else
           NOP   when instruction_fetch = NOP_instruction else
           UNDEFINED;

  decode_phase : process (clock, reset) is
  begin  -- process decode_phase
    if reset = '0' then                 -- asynchronous reset (active low)
      decode      <= UNDEFINED;
      execute     <= UNDEFINED;
      mem         <= UNDEFINED;
      writeback   <= UNDEFINED;
      rs1_decode  <= "00000";
      rs1_execute <= "00000";
      rs1_mem     <= "00000";
      rs1_wb      <= "00000";
      rs2_decode  <= "00000";
      rs2_execute <= "00000";
      rs2_mem     <= "00000";
      rs2_wb      <= "00000";
      rd_decode   <= "00000";
      rd_execute  <= "00000";
      rd_mem      <= "00000";
      rd_wb       <= "00000";

    elsif clock'event and clock = '1' then  -- rising clock edge
      decode      <= fetch;
      execute     <= decode;
      mem         <= execute;
      writeback   <= mem;
      rs1_decode  <= rs1_fetch;
      rs1_execute <= rs1_decode;
      rs1_mem     <= rs1_execute;
      rs1_wb      <= rs1_mem;
      rs2_decode  <= rs2_fetch;
      rs2_execute <= rs2_decode;
      rs2_mem     <= rs2_execute;
      rs2_wb      <= rs2_mem;
      rd_decode   <= rd_fetch;
      rd_execute  <= rd_decode;
      rd_mem      <= rd_execute;
      rd_wb       <= rd_mem;
    end if;
  end process decode_phase;

  rs1_fetch <= "00000" when fetch = LUI or fetch = AUIPC or fetch = JAL                                               else instruction_fetch(19 downto 15);
  rs2_fetch <= "00000" when fetch = LUI or fetch = AUIPC or fetch = JAL or fetch = LW or fetch = ADDI or fetch = ANDI else instruction_fetch(24 downto 20);
  rd_fetch  <= "00000" when fetch = BEQ or fetch = SW                                                                 else instruction_fetch(11 downto 7);


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


  data_adr <= to_integer(unsigned(data_mem_adr(7 downto 0))/4);
  inst_adr <= to_integer(unsigned(instruction_mem_adr(7 downto 0))/4);

  opcode <= instruction_fetch(6 downto 0);
  funct3 <= instruction_fetch(14 downto 12);

  -- instance "immediate_generator_1"
  immediate_generator_1 : entity work.immediate_generator
    port map (
      instruction => instruction_fetch,
      immediate   => immediate);
end architecture arch;

-------------------------------------------------------------------------------

configuration RV32I_tb_arch_cfg of RV32I_tb is
  for arch
  end for;
end RV32I_tb_arch_cfg;

-------------------------------------------------------------------------------
