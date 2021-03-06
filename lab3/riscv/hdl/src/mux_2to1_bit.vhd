-------------------------------------------------------------------------------
-- Title      : mux_2to1_bit
-- Project    : barrel_shifter
-------------------------------------------------------------------------------
-- File       : mux_2to1_bit.vhd
-- Author     : stefano  <stefano@stefano-N56JK>
-- Company    : 
-- Created    : 2022-01-22
-- Last update: 2022-01-22
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2022 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2022-01-22  1.0      stefano Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------

entity mux_2to1_bit is

  port (
    in_mux_0 : in  std_logic;
    in_mux_1 : in  std_logic;
    sel      : in  std_logic;
    out_mux  : out std_logic);

end entity mux_2to1_bit;

-------------------------------------------------------------------------------

architecture str of mux_2to1_bit is

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------

begin  -- architecture str

  out_mux <= in_mux_0 when sel = '0' else
             in_mux_1;

  -----------------------------------------------------------------------------
  -- Component instantiations
  -----------------------------------------------------------------------------

end architecture str;

-------------------------------------------------------------------------------
