-------------------------------------------------------------------------------
-- Title      : hazard_unit
-- Project    : 
-------------------------------------------------------------------------------
-- File       : hazard_unit.vhd
-- Author     : stefano  <stefano@stefano-N56JK>
-- Company    : 
-- Created    : 2022-01-31
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
-- 2022-01-31  1.0      stefano Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity hazard_unit is

  port (
    MemRead_execute : in  std_logic;
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

begin  -- architecture str

  hazard_proc : process (MemRead_execute, Rs1_decode, Rs2_decode, Rd_execute) is
  begin  -- process hazard_proc
    if ((MemRead_execute = '1') and ((Rd_execute = Rs1_decode) or (Rd_execute = Rs2_decode))) then
      PcWrite        <= '0';
      FetchPipeWrite <= '0';
      StallSrc       <= '0';
    else
      PcWrite        <= '1';
      FetchPipeWrite <= '1';
      StallSrc       <= '1';
    end if;
  end process hazard_proc;

  -----------------------------------------------------------------------------
  -- Component instantiations
  -----------------------------------------------------------------------------

end architecture str;

-------------------------------------------------------------------------------
