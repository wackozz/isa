-------------------------------------------------------------------------------
-- Title      : add_sub
-- Project    : riscv-local
-------------------------------------------------------------------------------
-- File       : add_sub.vhd
-- Author     : stefano  <stefano@stefano-N56JK>
-- Company    : 
-- Created    : 2022-01-18
-- Last update: 2022-01-18
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2022 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2022-01-18  1.0      stefano Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------

entity add_sub is

  port (
    A   : in  std_logic_vector(31 downto 0);
    B   : in  std_logic_vector(31 downto 0);
    sel : in  std_logic;
    sum : out std_logic_vector(31 downto 0));

end entity add_sub;

-------------------------------------------------------------------------------

architecture str of add_sub is

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------

begin  -- architecture str

  sum <= std_logic_vector(signed(A) + signed(B)) when sel = '0' else
         std_logic_vector(signed(A) - signed(B)) when sel = '1' else
         (others => '0');

  -----------------------------------------------------------------------------
  -- Component instantiations
  -----------------------------------------------------------------------------

end architecture str;

-------------------------------------------------------------------------------
