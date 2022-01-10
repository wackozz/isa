-------------------------------------------------------------------------------
-- Title      : decode_stage_control
-- Project    : 
-------------------------------------------------------------------------------
-- File       : decode_stage_control.vhd
-- Author     : stefano  <stefano@stefano-N56JK>
-- Company    : 
-- Created    : 2022-01-08
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
-- 2022-01-08  1.0      stefano Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity decode_stage_control is

  port (
    clock              : in  std_logic;
    reset              : in  std_logic;
    instruction_decode : in  std_logic_vector(31 downto 0);
    ALUSrc_execute     : out std_logic;
    ALUOp_execute      : out std_logic_vector(1 downto 0);
    Branch_execute     : out std_logic;
    MemWrite_execute   : out std_logic;
    MemRead_execute    : out std_logic;
    MemToReg_execute   : out std_logic);

end entity decode_stage_control;

-------------------------------------------------------------------------------

architecture str of decode_stage_control is

  component control is
    port (
      instruction : in  std_logic_vector(31 downto 0);
      ALUSrc      : out std_logic;
      MemToReg    : out std_logic;
      RegWrite    : out std_logic;
      MemRead     : out std_logic;
      MemWrite    : out std_logic;
      Branch      : out std_logic;
      ALUOp       : out std_logic_vector(1 downto 0));
  end component control;

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------

  signal ALUSrc_int   : std_logic;
  signal MemToReg_int : std_logic;
  signal RegWrite_int : std_logic;
  signal MemRead_int  : std_logic;
  signal MemWrite_int : std_logic;
  signal Branch_int   : std_logic;
  signal ALUOp_int    : std_logic_vector(1 downto 0);

begin  -- architecture str

  -----------------------------------------------------------------------------
  -- Component instantiations
  -----------------------------------------------------------------------------

  control_1 : entity work.control
    port map (
      instruction => instruction_decode,
      ALUSrc      => ALUSrc_int,
      MemToReg    => MemToReg_int,
      RegWrite    => RegWrite_int,
      MemRead     => MemRead_int,
      MemWrite    => MemWrite_int,
      Branch      => Branch_int,
      ALUOp       => ALUOp_int;

  pipe : process (clock, reset) is
  begin  -- process pipe
    if reset = '0' then                     -- asynchronous reset (active low)
      ALUSrc_execute   <= '0';
      ALUOp_execute    <= (others => "00");
      Branch_execute   <= '0';
      MemWrite_execute <= '0';
      MemRead_execute  <= '0';
      MemToReg_execute <= '0';
    elsif clock'event and clock = '1' then  -- rising clock edge
      ALUSrc_execute   <= ALUSrc_int;
      ALUOp_execute    <= ALUOp_int;
      Branch_execute   <= Branch_int;
      MemWrite_execute <= MemWrite_int;
      MemRead_execute  <= MemRead_int;
      MemToReg_execute <= MemToReg_int;
    end if;
  end process pipe;

end architecture str;

-------------------------------------------------------------------------------
