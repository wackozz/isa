-------------------------------------------------------------------------------
-- Title      : RV32I_control
-- Project    : 
-------------------------------------------------------------------------------
-- File       : RV32I_control.vhd
-- Author     : stefano  <stefano@stefano-N56JK>
-- Company    : 
-- Created    : 2022-01-10
-- Last update: 2022-01-31
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

-------------------------------------------------------------------------------

entity RV32I_control is

  port (

    -- global ports
    clock : in std_logic;
    reset : in std_logic;

    -- ports to "decode_stage_control_1"
    instruction_decode : in  std_logic_vector(31 downto 0);
    Rs1_decode         : in  std_logic_vector(4 downto 0);
    Rs2_decode         : in  std_logic_vector(4 downto 0);
    Rd_execute         : in  std_logic_vector(4 downto 0);
    PcWrite            : out std_logic;
    FetchPipeWrite     : out std_logic;

    ALUSrc : out std_logic;
    PCSel  : out std_logic;

    -- ports to "execute_stage_control_1"
    alu_ctrl_execute : in  std_logic_vector(3 downto 0);
    Zero_execute     : in  std_logic;
    MemWrite         : out std_logic;
    MemRead          : out std_logic;
    ALUCtrl          : out std_logic_vector(3 downto 0);
    Rs1_execute      : in  std_logic_vector(4 downto 0);
    Rs2_execute      : in  std_logic_vector(4 downto 0);
    Rd_mem           : in  std_logic_vector(4 downto 0);
    Rd_wb            : in  std_logic_vector(4 downto 0);
    forward_A        : out std_logic_vector(1 downto 0);
    forward_B        : out std_logic_vector(1 downto 0);

    -- ports to "mem_stage_control_1"
    PCSrc    : out std_logic;
    RegWrite : out std_logic;
    MemToReg : out std_logic_vector(1 downto 0));

end entity RV32I_control;

-------------------------------------------------------------------------------

architecture str of RV32I_control is

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------

  -- outputs of "decode_stage_control_1"
  signal ALUOp_execute    : std_logic_vector(1 downto 0);
  signal Branch_execute   : std_logic;
  signal Jump_execute     : std_logic;
  signal MemWrite_execute : std_logic;
  signal MemRead_execute  : std_logic;
  signal RegWrite_execute : std_logic;
  signal opcode_execute   : std_logic_vector(6 downto 0);
  signal MemToReg_execute : std_logic_vector(1 downto 0);

  -- outputs of "execute_stage_control_1"
  signal Zero         : std_logic;
  signal Branch       : std_logic;
  signal Jump         : std_logic;
  signal MemToReg_mem : std_logic_vector(1 downto 0);
  signal RegWrite_mem : std_logic;

  signal RegWrite_int : std_logic;

begin  -- architecture str

  -----------------------------------------------------------------------------
  -- Component instantiations
  -----------------------------------------------------------------------------

  RegWrite <= RegWrite_int;

  -- instance "decode_stage_control_1"
  decode_stage_control_1 : entity work.decode_stage_control
    port map (
      clock              => clock,
      reset              => reset,
      instruction_decode => instruction_decode,
      Rs1_decode         => Rs1_decode,
      Rs2_decode         => Rs2_decode,
      Rd_execute         => Rd_execute,
      ALUSrc             => ALUSrc,
      PCSel              => PCSel,
      ALUOp_execute      => ALUOp_execute,
      Branch_execute     => Branch_execute,
      Jump_execute       => Jump_execute,
      MemWrite_execute   => MemWrite_execute,
      MemRead_execute    => MemRead_execute,
      RegWrite_execute   => RegWrite_execute,
      opcode_execute     => opcode_execute,
      PcWrite            => PcWrite,
      FetchPipeWrite     => FetchPipeWrite,
      MemToReg_execute   => MemToReg_execute);

  -- instance "execute_stage_control_1"
  execute_stage_control_1 : entity work.execute_stage_control
    port map (
      clock            => clock,
      reset            => reset,
      alu_ctrl_execute => alu_ctrl_execute,
      Branch_execute   => Branch_execute,
      Jump_execute     => Jump_execute,
      MemRead_execute  => MemRead_execute,
      ALUOp_execute    => ALUOp_execute,
      MemToReg_execute => MemToReg_execute,
      MemWrite_execute => MemWrite_execute,
      RegWrite_execute => RegWrite_execute,
      Zero_execute     => Zero_execute,
      opcode_execute   => opcode_execute,
      Zero             => Zero,
      Branch           => Branch,
      Jump             => Jump,
      MemWrite         => MemWrite,
      MemRead          => MemRead,
      MemToReg_mem     => MemToReg_mem,
      RegWrite_mem     => RegWrite_mem,
      ALUCtrl          => ALUCtrl,
      Rs1_execute      => Rs1_execute,
      Rs2_execute      => Rs2_execute,
      Rd_mem           => Rd_mem,
      Rd_wb            => Rd_wb,
      RegWrite         => RegWrite_int,
      forward_A        => forward_A,
      forward_B        => forward_B);

  -- instance "mem_stage_control_1"
  mem_stage_control_1 : entity work.mem_stage_control
    port map (
      clock        => clock,
      reset        => reset,
      Branch       => Branch,
      Jump         => Jump,
      Zero         => Zero,
      MemToReg_mem => MemToReg_mem,
      RegWrite_mem => RegWrite_mem,
      PCSrc        => PCSrc,
      RegWrite     => RegWrite_int,
      MemToReg     => MemToReg);

end architecture str;

-------------------------------------------------------------------------------
