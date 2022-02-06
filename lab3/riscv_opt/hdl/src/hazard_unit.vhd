-------------------------------------------------------------------------------
-- Title      : hazard_unit
-- Project    : 
-------------------------------------------------------------------------------
-- File       : hazard_unit.vhd
-- Author     : GR17 (F.Bongo, S.Rizzello, F.Vacca)
-- Company    : 
-- Created    : 2022-01-31
-- Last update: 2022-02-06
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
  type states is (idle, stall, stall_twice1, stall_twice2, nop);
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

  state_ev : process(current_state, opcode_fetch, opcode_decode, rs1_fetch, rs2_fetch, rd_decode) is
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
        else
          next_state <= idle;
        end if;
      when stall =>
        next_state <= nop;
      when stall_twice1 =>
        next_state <= stall_twice2;
      when stall_twice2 =>
        next_state <= nop;
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
      when stall =>
        PcWrite        <= '0';
        FetchPipeWrite <= '0';
        StallSrc       <= '1';
      when stall_twice1 =>
        PcWrite        <= '0';
        FetchPipeWrite <= '0';
        StallSrc       <= '1';
      when stall_twice2 =>
        PcWrite        <= '0';
        FetchPipeWrite <= '0';
        StallSrc       <= '1';
      when nop =>
        PcWrite        <= '1';
        FetchPipeWrite <= '1';
        StallSrc       <= '0';
      when others => null;
    end case;
  end process state_as;

-----------------------------------------------------------------------------
-- Component instantiations
-----------------------------------------------------------------------------

end architecture str;

-------------------------------------------------------------------------------
