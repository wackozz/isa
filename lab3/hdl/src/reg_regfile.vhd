-------------------------------------------------------------------------------
-- Title      : reg_regfile
-- Project    : 
-------------------------------------------------------------------------------
-- File       : reg_regfile.vhd
-- Author     : stefano  <stefano@stefano-N56JK>
-- Company    : 
-- Created    : 2022-02-01
-- Last update: 2022-02-01
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2022 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2022-02-01  1.0      stefano Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity reg_regfile is

  port(
    D                    : in  std_logic_vector (31 downto 0);
    clock, reset, enable : in  std_logic;
    Q                    : out std_logic_vector (31 downto 0));

end entity reg_regfile;

-------------------------------------------------------------------------------

architecture str of reg_regfile is

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------

begin  -- architecture str

  register_proc : process (clock, reset) is
  begin

    if reset = '0' then
      Q <= (others => '0');
    elsif clock'event and clock = '1' then
      if enable = '1' then
        Q <= D;
      elsif clock'event and clock = '0' then
        Q <= D;
      end if;
    end if;
  end process;
  
  -----------------------------------------------------------------------------
  -- Component instantiations
  -----------------------------------------------------------------------------

end architecture str;

-------------------------------------------------------------------------------
