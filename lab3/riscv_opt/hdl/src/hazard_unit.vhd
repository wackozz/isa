-------------------------------------------------------------------------------
-- Title      : hazard_unit
-- Project    : 
-------------------------------------------------------------------------------
-- File       : hazard_unit.vhd
-- Author     : GR17 (F.Bongo, S.Rizzello, F.Vacca)
-- Company    : 
-- Created    : 2022-01-31
-- Last update: 2022-02-04
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

entity hazard_unit is

  port (
    clock           : in  std_logic;
    reset           : in  std_logic;
    MemRead_execute : in  std_logic;
    MemWrite_decode : in  std_logic;
    opcode_fetch    : in  std_logic_vector(6 downto 0);
    opcode_decode   : in  std_logic_vector(6 downto 0);
    Rs1_decode      : in  std_logic_vector(4 downto 0);
    Rs2_decode      : in  std_logic_vector(4 downto 0);
    Rs1_fetch       : in  std_logic_vector(4 downto 0);
    Rs2_fetch       : in  std_logic_vector(4 downto 0);
    Rd_execute      : in  std_logic_vector(4 downto 0);
    Rd_decode       : in  std_logic_vector(4 downto 0);
    PcWrite         : out std_logic;
    FetchPipeWrite  : out std_logic;
    StallSrc        : out std_logic);

end entity hazard_unit;
-------------------------------------------------------------------------------

architecture str of hazard_unit is

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------

  signal StallJmp                   : std_logic;
  signal StallJmpDel1, StallJmpDel2 : std_logic;

begin  -- architecture str

  hazard_proc : process (MemRead_execute, Rs1_decode, Rs2_decode, Rd_execute, StallJmp, StallJmpDel1, StallJmpDel2) is
  begin  -- process hazard_proc
    if ((MemRead_execute = '1') and ((Rd_execute = Rs1_decode) or (Rd_execute = Rs2_decode))) then
      PcWrite        <= '0';
      FetchPipeWrite <= '0';
      StallSrc       <= '0';
    elsif (opcode_fetch = "1100011") and (opcode_decode = "0110011" or opcode_decode = "0010011" or opcode_decode = "0110111" or opcode_decode = "0010111") then  --
      --beq and r-type or i-type or lui or auipc
      if ((MemWrite_decode = '1') and ((Rd_decode = Rs1_fetch) or (Rd_decode = Rs2_fetch))) then
        PcWrite        <= '0';
        FetchPipeWrite <= '0';
        StallSrc       <= '0';
      else
        PcWrite        <= '1';
        FetchPipeWrite <= '1';
        StallSrc       <= '1';
      end if;
    elsif (opcode_fetch = "1100011" and opcode_decode = "0000011") then
      if StallJmp = '1' then
        PcWrite        <= '0';
        FetchPipeWrite <= '1';
        StallSrc       <= '1';
      elsif StallJmpDel1 = '1' then
        PcWrite        <= '0';
        FetchPipeWrite <= '0';
        StallSrc       <= '1';
      else
        PcWrite        <= '1';
        FetchPipeWrite <= '1';
        StallSrc       <= '1';
      end if;
    else
      PcWrite        <= '1';
      FetchPipeWrite <= '1';
      StallSrc       <= '1';
    end if;
  end process hazard_proc;

  stall_proc_jmp : process (clock, reset) is
  begin  -- process stall_proc
    if reset = '0' then                     -- asynchronous reset (active low)
      StallJmpDel1 <= '0';
      StallJmpDel2 <= '0';
    elsif clock'event and clock = '1' then  -- rising clock edge
      StallJmpDel1 <= StallJmp;
      StallJmpDel2 <= StallJmpDel1;
    end if;
    if StallJmpDel1 = '0' and StallJmpDel2 = '0' then
      if (opcode_fetch = "1100011") and (opcode_decode = "0110011" or opcode_decode = "0010011" or opcode_decode = "0110111" or opcode_decode = "0010111") then
        StallJmp <= '1';
      else
        StallJmp <= '0';
      end if;
    else
      StallJmp <= '0';
    end if;
  end process stall_proc_jmp;

-----------------------------------------------------------------------------
-- Component instantiations
-----------------------------------------------------------------------------

end architecture str;

-------------------------------------------------------------------------------
