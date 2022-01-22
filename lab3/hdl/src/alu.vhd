-------------------------------------------------------------------------------
-- Title      : alu
-- Project    : riscv-local
-------------------------------------------------------------------------------
-- File       : alu.vhd
-- Author     : stefano  <stefano@stefano-N56JK>
-- Company    : 
-- Created    : 2022-01-18
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
    shamt   : in  std_logic_vector(4 downto 0);
    result  : out std_logic_vector(31 downto 0);
    zero    : out std_logic);

end entity alu;

-------------------------------------------------------------------------------

architecture str of alu is

  component unary_AND is
    port (
      inp  : in  std_logic_vector(31 downto 0);
      outp : out std_logic);
  end component unary_AND;

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------

  signal comp         : std_logic_vector(31 downto 0);
  signal sum_int      : std_logic_vector(31 downto 0);
  signal xor_result   : std_logic_vector(31 downto 0);
  signal and_result   : std_logic_vector(31 downto 0);
  signal lui_result   : std_logic_vector(31 downto 0);
  signal shift_result : std_logic_vector(31 downto 0);
  signal zero_sig     : std_logic_vector(31 downto 0);


begin  -- architecture str

  --sum/auipc
  result <= sum_int when ALUCtrl = "0010" else
            --xor
            xor_result                                    when ALUCtrl = "0111" else
            --and
            and_result                                    when ALUCtrl = "0011" else
            --slt
            "0000000000000000000000000000000"&sum_int(31) when ALUCtrl = "0100" else
            --lui
            lui_result                                    when ALUCtrl = "0010" else
            --srai
            shift_result                                  when ALUCtrl = "0101" else
            (others => '0');

  comp       <= A xnor B;
  xor_result <= A xor B;
  and_result <= A and B;
  lui_result <= B;

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

  -- instance "barrel_shifter_1"
  barrel_shifter_1 : entity work.barrel_shifter
    port map (
      x  => A,
      sh => shamt,
      y  => shift_result);

  un_and : unary_AND port map (
    inp  => comp,
    outp => zero);

end architecture str;

-------------------------------------------------------------------------------
