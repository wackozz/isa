-------------------------------------------------------------------------------
-- Title      : hazard_unit
-- Project    : 
-------------------------------------------------------------------------------
-- File       : hazard_unit.vhd
-- Author     : GR17 (F.Bongo, S.Rizzello, F.Vacca)
-- Company    : 
-- Created    : 2022-01-31
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

entity hazard_unit is

  port (
    clock           : in  std_logic;
    reset           : in  std_logic;
    MemRead_execute : in  std_logic;
    opcode_fetch    : in  std_logic_vector(6 downto 0);
    opcode_decode   : in  std_logic_vector(6 downto 0);
    Rs1_decode      : in  std_logic_vector(4 downto 0);
    Rs2_decode      : in  std_logic_vector(4 downto 0);
    Rd_execute      : in  std_logic_vector(4 downto 0);
    PcWrite         : out std_logic;
    FetchPipeWrite  : out std_logic;
    StallSrc        : out std_logic);

end entity hazard_unit;
-------------------------------------------------------------------------------

architecture str of hazard_unit is

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------

  signal Rs1_decode_int                           : std_logic_vector(4 downto 0);
  signal Rs2_decode_int                           : std_logic_vector(4 downto 0);
  signal Rd_execute_int                           : std_logic_vector(4 downto 0);
  signal StallJmp                                 : std_logic;
  signal StallJmpDel1, StallJmpDel2, StallJmpDel3 : std_logic;

begin  -- architecture str

  hazard_proc : process (MemRead_execute, Rs1_decode_int, Rs2_decode_int, Rd_execute_int, StallJmp, StallJmpDel1, StallJmpDel2) is
  begin  -- process hazard_proc
    if ((MemRead_execute = '1') and ((Rd_execute_int = Rs1_decode_int) or (Rd_execute_int = Rs2_decode_int))) then
      PcWrite        <= '0';
      FetchPipeWrite <= '0';
      StallSrc       <= '0';
    elsif StallJmp = '1' then
      PcWrite        <= '0';
      FetchPipeWrite <= '0';
      StallSrc       <= '1';
    elsif StallJmpDel1 = '1' then
      PcWrite        <= '0';
      FetchPipeWrite <= '0';
      StallSrc       <= '1';
    elsif StallJmpDel2 = '1' then
      PcWrite        <= '0';
      FetchPipeWrite <= '0';
      StallSrc       <= '1';
    elsif StallJmpDel3 = '1' then
      PcWrite        <= '1';
      FetchPipeWrite <= '1';
      StallSrc       <= '1';
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
      StallJmpDel3 <= '0';
    elsif clock'event and clock = '1' then  -- rising clock edge
      StallJmpDel1 <= StallJmp;
      StallJmpDel2 <= StallJmpDel1;
      StallJmpDel3 <= StallJmpDel2;
    end if;
    if StallJmpDel1 = '0' and StallJmpDel2 = '0' and StallJmpDel3 = '0' then
      if opcode_fetch = "1101111" or opcode_fetch = "1100011" then
        StallJmp <= '1';
      end if;
    else
      StallJmp <= '0';
    end if;
  end process stall_proc_jmp;

-- stall_jmp_mux : process (opcode_fetch, StallJmpDel1, StallJmpDel2) is
-- begin  -- process stall_jmp_mux
--   if StallJmpDel1 = '0' and StallJmpDel2 = '0' then
--     if opcode_fetch = "1101111" or opcode_fetch = "1100011" then
--       StallJmp <= '1';
--     end if;
--   else
--     StallJmp <= '0';
--   end if;
-- end process stall_jmp_mux;

  reg_detect_proc : process (opcode_decode, Rs1_decode, Rs2_decode, Rd_execute) is
  begin  -- process reg_detect_proc
    if opcode_decode = "0110111" then     --LUI
      Rs1_decode_int <= "00000";
      Rs2_decode_int <= "00000";
      Rd_execute_int <= Rd_execute;
    elsif opcode_decode = "0010111" then  --AUIPC
      Rs1_decode_int <= "00000";
      Rs2_decode_int <= "00000";
      Rd_execute_int <= Rd_execute;
    elsif opcode_decode = "1101111" then  --JAL
      Rs1_decode_int <= "00000";
      Rs2_decode_int <= "00000";
      Rd_execute_int <= Rd_execute;
    elsif opcode_decode = "1100011" then  --BEQ
      Rs1_decode_int <= Rs1_decode;
      Rs2_decode_int <= Rs2_decode;
      Rd_execute_int <= Rd_execute;
    elsif opcode_decode = "0000011" then  --LW
      Rs1_decode_int <= Rs1_decode;
      Rs2_decode_int <= "00000";
      Rd_execute_int <= Rd_execute;
    elsif opcode_decode = "0100011" then  --SW
      Rs1_decode_int <= Rs1_decode;
      Rs2_decode_int <= Rs2_decode;
      Rd_execute_int <= Rd_execute;
    elsif opcode_decode = "0010011" then  --ADDI / ANDI
      Rs1_decode_int <= Rs1_decode;
      Rs2_decode_int <= "00000";
      Rd_execute_int <= Rd_execute;
    elsif opcode_decode = "0010011" then  -- SRAI
      Rs1_decode_int <= Rs1_decode;
      Rs2_decode_int <= "00000";
      Rd_execute_int <= Rd_execute;
    elsif opcode_decode = "0110011" then  --ADD / SLT / XOR
      Rs1_decode_int <= Rs1_decode;
      Rs2_decode_int <= Rs2_decode;
      Rd_execute_int <= Rd_execute;
    else
      Rs1_decode_int <= "00000";
      Rs2_decode_int <= "00000";
      Rd_execute_int <= "00000";
    end if;
  end process reg_detect_proc;


-----------------------------------------------------------------------------
-- Component instantiations
-----------------------------------------------------------------------------

end architecture str;

-------------------------------------------------------------------------------
