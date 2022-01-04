-------------------------------------------------------------------------------
-- Title      : immediate generator
-- Project    : 
-------------------------------------------------------------------------------
-- File       : immediate_generator.vhd
-- Author     : wackoz  <wackoz@wT14>
-- Company    : 
-- Created    : 2021-12-22
-- Last update: 2021-12-22
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2021 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2021-12-22  1.0      wackoz  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------

entity immediate_generator is

  port (
    instruction : in  std_logic_vector(31 downto 0);
    immediate   : out std_logic_vector(63 downto 0)
    );

end entity immediate_generator;

-------------------------------------------------------------------------------

architecture str of immediate_generator is

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------
  signal sel : std_logic_vector(4 downto 0);

begin  -- architecture str
  with sel select immediate <=
    -- U type
    std_logic_vector(resize(signed(instruction(31 downto 12)), immediate'length))                                                           when "01101" | "00101",
    -- J type
    std_logic_vector(resize(signed(instruction(31)&instruction(19 downto 12)&instruction(20)&instruction(30 downto 21)), immediate'length)) when "11011",
    -- B type
    std_logic_vector(resize(signed(instruction(31)&instruction(7)&instruction(30 downto 25)&instruction(11 downto 8)), immediate'length))   when "11000" | "01000",
    -- I type
    std_logic_vector(resize(signed(instruction(31)&instruction(7)&instruction(30 downto 25)&instruction(11 downto 8)), immediate'length))   when "00000" | "00100",
    -- other
    (others => '0')                                                                                                                         when others;

  sel <= instruction(6 downto 2);
end architecture str;

-------------------------------------------------------------------------------