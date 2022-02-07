-------------------------------------------------------------------------------
-- Title      : hazard_unit
-- Project    : 
-------------------------------------------------------------------------------
-- File       : hazard_unit.vhd
-- Author     : GR17 (F.Bongo, S.Rizzello, F.Vacca)
-- Company    : 
-- Created    : 2022-01-31
-- Last update: 2022-02-07
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
    branch          : in  std_logic;
    opcode_fetch    : in  std_logic_vector(6 downto 0);
    opcode_decode   : in  std_logic_vector(6 downto 0);
    Rs1_decode      : in  std_logic_vector(4 downto 0);
    Rs2_decode      : in  std_logic_vector(4 downto 0);
    Rs1_fetch       : in  std_logic_vector(4 downto 0);
    Rs2_fetch       : in  std_logic_vector(4 downto 0);
    Rd_execute      : in  std_logic_vector(4 downto 0);
    Rd_decode       : in  std_logic_vector(4 downto 0);
    PcWrite         : out std_logic;
    Flush           : out std_logic;
    FetchPipeWrite  : out std_logic;
    StallSrc        : out std_logic);

end entity hazard_unit;
-------------------------------------------------------------------------------

architecture str of hazard_unit is
  type states is (idle, stall, stall_twice1, stall_twice2, idle2, idle3, flush_state, nop);
  signal current_state, next_state : states;
-----------------------------------------------------------------------------
-- Internal signal declarations
-----------------------------------------------------------------------------
begin  -- architecture str

  fsm : process (clock, reset) is
  begin  -- process fsm
    if reset = '0' then                     -- asynchronous reset (active low)
      current_state <= idle;
    elsif clock'event and clock = '0' then  -- rising clock edge
      current_state <= next_state;
    end if;
  end process fsm;

  state_ev : process(current_state, branch, opcode_fetch, opcode_decode, rs1_fetch, rs2_fetch, rd_decode) is
  begin  -- process state_ev
    case current_state is
      when idle =>
        if ((opcode_fetch = "1100011") and (opcode_decode = "0000011")
            and((rs1_fetch = rd_decode) or (rs2_fetch = rd_decode))) then
          next_state <= stall_twice1;   --stall twice if decode inst is LW
        elsif ((opcode_fetch = "1100011") and (opcode_decode /= "1100011"
                                               or opcode_decode /= "0100011")
               and((rs1_fetch = rd_decode) or (rs2_fetch = rd_decode))) then
          next_state <= stall;          -- stall once for other inst
        elsif (MemRead_execute = '1' and ((Rd_execute = Rs1_decode) or (Rd_execute = Rs2_decode))) then
          next_state <= nop;
        else
          next_state <= idle;
        end if;

      when stall =>
        if branch = '1' then
          next_state <= idle;
        else
          next_state <= idle2;
        end if;

      when stall_twice1 =>
        next_state <= stall_twice2;

      when stall_twice2 =>
        if branch = '1' then
          next_state <= idle;
        else
          next_state <= idle2;
        end if;

      when idle2 =>
        next_state <= idle3;
      when idle3 =>
        next_state <= flush_state;
      when flush_state =>
        next_state <= idle;
      when nop =>
        next_state <= idle;
      when others => null;
    end case;
  end process state_ev;

  state_as : process (current_state, opcode_fetch, opcode_decode, rs1_fetch, rs2_fetch, rd_decode) is
  begin  -- process state_as
    case current_state is
      when idle =>
        PcWrite        <= '1';
        FetchPipeWrite <= '1';
        StallSrc       <= '1';
        Flush          <= '0';
      when idle2 =>
        PcWrite        <= '1';
        FetchPipeWrite <= '1';
        StallSrc       <= '1';
        Flush          <= '0';
      when idle3 =>
        PcWrite        <= '1';
        FetchPipeWrite <= '1';
        StallSrc       <= '1';
        Flush          <= '0';
      when stall =>
        PcWrite        <= '0';
        FetchPipeWrite <= '0';
        StallSrc       <= '1';
        Flush          <= '0';
      when stall_twice1 =>
        PcWrite        <= '0';
        FetchPipeWrite <= '1';
        StallSrc       <= '1';
        Flush          <= '0';
      when stall_twice2 =>
        PcWrite        <= '0';
        FetchPipeWrite <= '0';
        StallSrc       <= '1';
        Flush          <= '0';
      when nop =>
        PcWrite        <= '0';
        FetchPipeWrite <= '0';
        StallSrc       <= '0';
        Flush          <= '0';
      when flush_state =>
        PcWrite        <= '1';
        FetchPipeWrite <= '1';
        StallSrc       <= '0';
        Flush          <= '1';

      when others => null;
    end case;
  end process state_as;

-----------------------------------------------------------------------------
-- Component instantiations
-----------------------------------------------------------------------------

end architecture str;

-------------------------------------------------------------------------------
