-------------------------------------------------------------------------------
-- Title      : decode_stage_control
-- Project    : 
-------------------------------------------------------------------------------
-- File       : decode_stage_control.vhd
-- Author     : GR17 (F.Bongo, S.Rizzello, F.Vacca)
-- Company    : 
-- Created    : 2022-01-08
-- Last update: 2022-02-01
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2022 
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------

entity decode_stage_control is

  port (
    clock              : in  std_logic;
    reset              : in  std_logic;
    instruction_decode : in  std_logic_vector(31 downto 0);
    Rs1_decode         : in  std_logic_vector(4 downto 0);
    Rs2_decode         : in  std_logic_vector(4 downto 0);
    Rd_execute         : in  std_logic_vector(4 downto 0);
    ALUSrc             : out std_logic;
    PCSel              : out std_logic;
    ALUOp_execute      : out std_logic_vector(1 downto 0);
    Branch_execute     : out std_logic;
    Jump_execute       : out std_logic;
    MemWrite_execute   : out std_logic;
    MemRead_execute    : out std_logic;
    RegWrite_execute   : out std_logic;
    opcode_execute     : out std_logic_vector(6 downto 0);
    PcWrite            : out std_logic;
    FetchPipeWrite     : out std_logic;
    MemToReg_execute   : out std_logic_vector(1 downto 0));

end entity decode_stage_control;

-------------------------------------------------------------------------------

architecture str of decode_stage_control is

  component control is
    port (
      instruction : in  std_logic_vector(31 downto 0);
      ALUSrc      : out std_logic;
      PCSel       : out std_logic;
      MemToReg    : out std_logic_vector(1 downto 0);
      RegWrite    : out std_logic;
      MemRead     : out std_logic;
      MemWrite    : out std_logic;
      Branch      : out std_logic;
      Jump        : out std_logic;
      ALUOp       : out std_logic_vector(1 downto 0));
  end component control;

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------

  signal ALUSrc_int   : std_logic;
  signal PCSel_int    : std_logic;
  signal MemToReg_int : std_logic_vector(1 downto 0);
  signal RegWrite_int : std_logic;
  signal MemRead_int  : std_logic;
  signal MemWrite_int : std_logic;
  signal Branch_int   : std_logic;
  signal Jump_int     : std_logic;
  signal ALUOp_int    : std_logic_vector(1 downto 0);

  signal ALUSrc_noStall   : std_logic;
  signal PCSel_noStall    : std_logic;
  signal MemToReg_noStall : std_logic_vector(1 downto 0);
  signal RegWrite_noStall : std_logic;
  signal MemRead_noStall  : std_logic;
  signal MemWrite_noStall : std_logic;
  signal Branch_noStall   : std_logic;
  signal Jump_noStall     : std_logic;
  signal ALUOp_noStall    : std_logic_vector(1 downto 0);

  signal MemRead_execute_int : std_logic;

  signal ctrl_no_stall : std_logic_vector(10 downto 0);
  signal controls      : std_logic_vector(10 downto 0);
  signal StallSrc      : std_logic;

begin  -- architecture str

  -----------------------------------------------------------------------------
  -- Component instantiations
  -----------------------------------------------------------------------------

  control_1 : entity work.control
    port map (
      instruction => instruction_decode,
      ALUSrc      => ALUSrc_noStall,
      PCSel       => PCSel_noStall,
      MemToReg    => MemToReg_noStall,
      RegWrite    => RegWrite_noStall,
      MemRead     => MemRead_noStall,
      MemWrite    => MemWrite_noStall,
      Branch      => Branch_noStall,
      Jump        => Jump_noStall,
      ALUOp       => ALUOp_noStall);

  pipe : process (clock, reset) is
  begin  -- process pipe
    if reset = '0' then                     -- asynchronous reset (active low)
      ALUSrc              <= '0';
      PCSel               <= '0';
      ALUOp_execute       <= (others => '0');
      Branch_execute      <= '0';
      Jump_execute        <= '0';
      MemWrite_execute    <= '0';
      MemRead_execute_int <= '0';
      MemToReg_execute    <= "00";
      RegWrite_execute    <= '0';
      opcode_execute      <= "0000000";
    elsif clock'event and clock = '1' then  -- rising clock edge
      ALUSrc              <= ALUSrc_int;
      PCSel               <= PCSel_int;
      ALUOp_execute       <= ALUOp_int;
      Branch_execute      <= Branch_int;
      Jump_execute        <= Jump_int;
      MemWrite_execute    <= MemWrite_int;
      MemRead_execute_int <= MemRead_int;
      MemToReg_execute    <= MemToReg_int;
      RegWrite_execute    <= RegWrite_int;
      opcode_execute      <= instruction_decode(6 downto 0);
    end if;
  end process pipe;

  -- instance "hazard_unit_1"
  hazard_unit_1 : entity work.hazard_unit
    port map (
      MemRead_execute => MemRead_execute_int,
      Rs1_decode      => Rs1_decode,
      Rs2_decode      => Rs2_decode,
      Rd_execute      => Rd_execute,
      PcWrite         => PcWrite,
      FetchPipeWrite  => FetchPipeWrite,
      StallSrc        => StallSrc);

  MemRead_execute <= MemRead_execute_int;

  -- instance "mux_2to1_stall_1"
  mux_2to1_stall_1 : entity work.mux_2to1_stall
    port map (
      in_mux_0 => "00000000000",
      in_mux_1 => ctrl_no_stall,
      sel      => StallSrc,
      out_mux  => controls);

  ctrl_no_stall <= ALUSrc_noStall & PCSel_noStall & MemToReg_noStall & RegWrite_noStall & MemRead_noStall & MemWrite_noStall & Branch_noStall & Jump_noStall & ALUOp_noStall;


  ALUSrc_int   <= controls(10);
  PCSel_int    <= controls(9);
  MemToReg_int <= controls(8 downto 7);
  RegWrite_int <= controls(6);
  MemRead_int  <= controls(5);
  MemWrite_int <= controls(4);
  Branch_int   <= controls(3);
  Jump_int     <= controls(2);
  ALUOp_int    <= controls(1 downto 0);

end architecture str;

-------------------------------------------------------------------------------
