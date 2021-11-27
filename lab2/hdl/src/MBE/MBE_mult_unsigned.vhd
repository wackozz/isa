-------------------------------------------------------------------------------
-- Title      : MBE multiplier unsigned
-- Project    : 
-------------------------------------------------------------------------------
-- File       : MBE_mult_unsigned.vhd
-- Author     : wackoz  <wackoz@wT14>
-- Company    : 
-- Created    : 2021-11-25
-- Last update: 2021-11-25
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2021-11-25  1.0      wackoz  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity MBE_mult_unsigned is

  port (
    FP_A : in  std_logic_vector(31 downto 0);   -- A input
    FP_B : in  std_logic_vector(31 downto 0);   -- B input
    clk  : in  std_logic;                       -- clock
    FP_Z : out std_logic_vector(31 downto 0));  -- Z output  

end entity MBE_mult_unsigned;

-------------------------------------------------------------------------------

architecture str of MBE_mult_unsigned is

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------

begin  -- architecture str

  -----------------------------------------------------------------------------
  -- Component instantiations
  -----------------------------------------------------------------------------

end architecture str;

-------------------------------------------------------------------------------
