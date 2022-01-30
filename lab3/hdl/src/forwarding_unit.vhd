-------------------------------------------------------------------------------
-- Title      : forwarding_unit
-- Project    : 
-------------------------------------------------------------------------------
-- File       : forwarding_unit.vhd
-- Author     : stefano  <stefano@stefano-N56JK>
-- Company    : 
-- Created    : 2022-01-30
-- Last update: 2022-01-30
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2022 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2022-01-30  1.0      stefano Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;               -- purpose: 

-------------------------------------------------------------------------------

entity forwarding_unit is

  port (
    Rs1          : in  std_logic_vector(4 downto 0);
    Rs2          : in  std_logic_vector(4 downto 0);
    Rd_mem       : in  std_logic_vector(4 downto 0);
    Rd_wb        : in  std_logic_vector(4 downto 0);
    RegWrite_mem : in  std_logic;
    RegWrite     : in  std_logic;
    forward_A    : out std_logic_vector(1 downto 0);
    forward_B    : out std_logic_vector(1 downto 0));

end entity forwarding_unit;

-------------------------------------------------------------------------------

architecture str of forwarding_unit is

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------

begin  -- architecture str

  forwarding_proc : process (Rs1, Rs2, Rd_mem, Rd_wb, RegWrite_mem, RegWrite) is
  begin  -- process forwarding_proc
    -- EX Hazard
    if (RegWrite = '1' and (Rd_wb /= "00000") and not ((RegWrite_mem = '1') and (Rd_mem /= "00000")) and (Rd_mem = Rs1) and (Rd_wb = Rs1)) then
      forward_A <= "01";
    elsif (RegWrite_mem = '1' and (Rd_mem /= "00000") and (Rd_mem = Rs1)) then
      forward_A <= "10";
    else
      forward_A <= "00";
    end if;
    -- MEM Hazard
    if (RegWrite = '1' and (Rd_wb /= "00000") and not (RegWrite_mem = '1' and (Rd_mem /= "00000") and (Rd_mem = Rs2)) and (Rd_wb = Rs2)) then
      forward_B <= "01";
    elsif (RegWrite_mem = '1' and (Rd_mem /= "00000") and (Rd_mem = Rs2)) then
      forward_B <= "10";
    else
      forward_B <= "00";
    end if;
  end process forwarding_proc;

  -----------------------------------------------------------------------------
  -- Component instantiations
  -----------------------------------------------------------------------------

end architecture str;

-------------------------------------------------------------------------------
