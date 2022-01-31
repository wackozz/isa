-------------------------------------------------------------------------------
-- Title      : mux_2to1_stall
-- Project    : 
-------------------------------------------------------------------------------
-- File       : mux_2to1_stall.vhd
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
use ieee.numeric_std.all;
-------------------------------------------------------------------------------

entity mux_2to1_stall is

  port(
    in_mux_0 : in  std_logic_vector(10 downto 0);
    in_mux_1 : in  std_logic_vector(10 downto 0);
    sel      : in  std_logic;
    out_mux  : out std_logic_vector (10 downto 0));

end entity mux_2to1_stall;

-------------------------------------------------------------------------------

architecture str of mux_2to1_stall is

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------

begin  -- architecture str

  out_mux <= in_mux_0 when sel = '0' else
             in_mux_1 when sel = '1' else in_mux_0;
  -----------------------------------------------------------------------------
  -- Component instantiations
  -----------------------------------------------------------------------------

end architecture str;

-------------------------------------------------------------------------------
