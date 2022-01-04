-------------------------------------------------------------------------------
-- Title      : RV32I
-- Project    : 
-------------------------------------------------------------------------------
-- File       : RV32I.vhd
-- Author     : wackoz  <wackoz@wT14>
-- Company    : 
-- Created    : 2021-12-22
-- Last update: 2022-01-04
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2021 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2021-12-22  1.0      GR18    Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.param_pkg.all;

-------------------------------------------------------------------------------

entity RV32I is

  port (
    clock           : in  std_logic;
    reset           : in  std_logic;
    regWrite        : in  std_logic;
    PCSrc           : in  std_logic;
    ALUSrc          : in  std_logic;
    MemtoReg        : in  std_logic;
    instruction     : in  std_logic_vector(N-1 downto 0);
    data_in         : in  std_logic_vector(N-1 downto 0);
    data_out        : in  std_logic_vector(N-1 downto 0);
    instruction_adr : out std_logic_vector(N-1 downto 0);
    data_adr        : out std_logic_vector(N-1 downto 0)
    );

end entity RV32I;

-------------------------------------------------------------------------------

architecture str of RV32I is

  component alu is
    port (
      A      : in  std_logic_vector(31 downto 0);
      B      : in  std_logic_vector(31 downto 0);
      result : out std_logic_vector(31 downto 0));
  end component alu;

  component immediate_generator is
    port (
      instruction : in  std_logic_vector(31 downto 0);
      immediate   : out std_logic_vector(63 downto 0));
  end component immediate_generator;

  component reg_file is
    port (
      read_reg1, read_reg2   : in  std_logic_vector (n_min-1 downto 0);
      write_reg              : in  std_logic_vector (n_min-1 downto 0);
      clock, reset, enable   : in  std_logic;
      write_data             : in  std_logic_vector (N-1 downto 0);
      write_en               : in  std_logic;
      read_data1, read_data2 : out std_logic_vector (N-1 downto 0));
  end component reg_file;

  component reg is
    port (
      D                    : in  std_logic_vector (N-1 downto 0);
      clock, reset, enable : in  std_logic;
      Q                    : out std_logic_vector (N-1 downto 0));
  end component reg;

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------
  signal pcinput_mux_in_0, pcinput_mux_in_1, pcinput_mux_out                                                                  : std_logic_vector(N-1 downto 0);
  signal pcinput_mux_in_1_tmp                                                                                                 : std_logic_vector(63 downto 0);
  signal data_mem_mux_in_0, data_mem_mux_in_1, data_mem_mux_out                                                               : std_logic_vector(N-1 downto 0);
  signal alu_B_mux_in_0, alu_B_mux_in_1, alu_B_mux_out                                                                        : std_logic_vector(N-1 downto 0);
  signal pc_in, pc_out_fetch, pc_out_decode, pc_out_execute                                                                   : std_logic_vector(N-1 downto 0);
  signal alu_in_A_decode, alu_in_A_execute, alu_in_B_decode, alu_in_B_execute, alu_result_execute, alu_result_mem             : std_logic_vector(31 downto 0);
  signal reg_file_read_data_1_decode, reg_file_read_data_1_execute, reg_file_read_data_2_decode, reg_file_read_data_2_execute : std_logic_vector(31 downto 0);
  signal target_address_execute, target_address_decode                                                                        : std_logic_vector(64 downto 0);
  signal imm_gen_out_decode, imm_gen_out_execute                                                                              : std_logic_vector(63 downto 0);
  signal imm_gen_in                                                                                                           : std_logic_vector(32 downto 0);
  signal immediate                                                                                                            : std_logic_vector(63 downto 0);
  signal instruction_fetch, instruction_decode                                                                                : std_logic_vector(32 downto 0);
begin  -- architecture str

  -----------------------------------------------------------------------------
  -- Component instantiations
  -----------------------------------------------------------------------------

  -- Register File
  register_file : reg_file
    port map (
      read_reg1  => instruction_decode(19 downto 15),  --rs1
      read_reg2  => instruction_decode(24 downto 20),  --rs2
      write_reg  => instruction_decode(11 downto 7),
      clock      => clock,
      reset      => reset,
      enable     => '1',
      write_data => data_mem_mux_out,
      write_en   => '1',
      read_data1 => reg_file_read_data_1,
      read_data2 => reg_file_read_data_2);

  -- Br
  pcinput_mux : mux_2to1
    port map (
      in_mux_0 => pcinput_mux_in_0,
      in_mux_1 => pcinput_mux_in_1,
      sel      => PCSrc,
      out_mux  => PC_in);

  -- PC INPUT MUX
  pcinput_mux_in_0     <= std_logic_vector(unsigned(pc_out_fetch) + 4);
  pcinput_mux_in_1_tmp <= std_logic_vector(signed(pc_out_execute) + shift_left(signed(immediate_gen_out_execute), 1));
  pcinput_mux_in_1     <= pcinput_mux_in_1_tmp(31 downto 0);

  -- ALU B mux
  alu_b_mux : mux_2to1
    port map (
      in_mux_0 => reg_file_read_data_2,
      in_mux_1 => immediate(31 downto 0),
      sel      => ALUSrc,
      out_mux  => alu_in_B);

  -- Data Memory mux
  data_mem_mux : mux_2to1
    port map (
      in_mux_0 => data_in,
      in_mux_1 => alu_result,
      sel      => MemtoReg,
      out_mux  => data_mem_mux_out);

  -- instance "immediate_generator"
  immediate_generator_1 : immediate_generator
    port map (
      instruction => instruction,
      immediate   => immediate);

  -- instance "alu-1"
  alu_1 : alu
    port map (
      A      => alu_in_A,
      B      => alu_in_B,
      result => alu_result);

  -- Memory output
  instruction_adr <= PC_out;
  data_adr        <= alu_result;
  data_out        <= reg_file_read_data_2;

  --Pipe Processes
  fetch2decode : process (clock, reset) is
  begin  -- process fetch2decode
    if reset = '0' then                     -- asynchronous reset (active low)
    elsif clock'event and clock = '1' then  -- rising clock edge
      instruction_decode <= instruction_fetch;
      pc_out_fetch       <= pc_out_decode;
    end if;
  end process fetch2decode;

  decode2execute : process (clock, reset) is
  begin  -- process decode2execute
    if reset = '0' then                 -- asynchronous reset (active low)

    elsif clock'event and clock = '1' then  -- rising clock edge

    end if;
  end process decode2execute;

  execute2mem : process (clock, reset) is
  begin  -- process execute2mem
    if reset = '0' then                 -- asynchronous reset (active low)

    elsif clock'event and clock = '1' then  -- rising clock edge

    end if;
  end process execute2mem;
end architecture str;

-------------------------------------------------------------------------------
