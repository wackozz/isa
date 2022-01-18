-------------------------------------------------------------------------------
-- Title      : alu
-- Project    : riscv-local
-------------------------------------------------------------------------------
-- File       : alu.vhd
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

entity alu is

  port (
    A       : in  std_logic_vector(31 downto 0);
    B       : in  std_logic_vector(31 downto 0);
    ALUCtrl : in  std_logic_vector(3 downto 0);
    result  : out std_logic_vector(31 downto 0);
    zero    : out std_logic);

end entity alu;

-------------------------------------------------------------------------------

architecture str of alu is

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------

  signal comp       : std_logic_vector(31 downto 0);
  signal sum_int    : std_logic_vector(31 downto 0);
  signal xor_result : std_logic_vector(31 downto 0);
  signal and_result : std_logic_vector(31 downto 0);

begin  -- architecture str

  result <= sum_int when ALUCtrl = "0010" else
            xor_result when ALUCtrl = "0111" else
            and_result when ALUCtrl = "0011" else
            (others => '0');

  zero <= '1' when comp = "11111111111111111111111111111111" else
          '0' when comp /= "11111111111111111111111111111111";

  comp       <= A xnor B;
  xor_result <= A xor B;
  and_result <= A and B;

  -----------------------------------------------------------------------------
  -- Component instantiations
  -----------------------------------------------------------------------------

  -- instance "add_sub_1"
  add_sub_1 : entity work.add_sub
    port map (
      A   => A,
      B   => B,
      sel => ALUCtrl(2),
      sum => sum_int);

end architecture str;

-------------------------------------------------------------------------------
