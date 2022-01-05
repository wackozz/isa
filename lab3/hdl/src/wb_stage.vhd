-------------------------------------------------------------------------------
-- Title      : wb_stage
-- Project    : RV32I
-------------------------------------------------------------------------------
-- File       : wb_stage.vhd
-- Author     : wackoz  <wackoz@wT14>
-- Company    : 
-- Created    : 2022-01-05
-- Last update: 2022-01-05
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2022 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2022-01-05  1.0      wackoz  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.param_pkg.all;

-------------------------------------------------------------------------------

entity wb_stage is

  port (
    clock                 : in  std_logic;
    reset                 : in  std_logic;
    rd_wb                 : in  std_logic_vector(4 downto 0);
    alu_result_wb         : in  std_logic_vector(31 downto 0);
    read_data_wb          : in  std_logic_vector(31 downto 0);
    write_data_decode     : out std_logic_vector(31 downto 0);
    write_reg_decode : out std_logic_vector(4 downto 0);
    MemToReg              : in  std_logic);

end entity wb_stage;

-------------------------------------------------------------------------------

architecture str of wb_stage is

  component mux_2to1 is
    port (
      in_mux_0 : in  std_logic_vector(N-1 downto 0);
      in_mux_1 : in  std_logic_vector(N-1 downto 0);
      sel      : in  std_logic;
      out_mux  : out std_logic_vector (N-1 downto 0));
  end component mux_2to1;
  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------

begin  -- architecture str

  -----------------------------------------------------------------------------
  -- Component instantiations
  -----------------------------------------------------------------------------

  -- instance "mux_wb"
  mux_wb : mux_2to1
    port map (
      in_mux_0 => read_data_wb,
      in_mux_1 => alu_result_wb,
      sel      => MemToReg,
      out_mux  => write_data_decode);
  pipe: process (clock, reset) is
  begin  -- process pipe
    if reset = '0' then                 -- asynchronous reset (active low)
      write_reg_decode <=  (others => '0');
    elsif clock'event and clock = '1' then  -- rising clock edge
      write_reg_decode <= rd_wb;
    end if;
  end process pipe;

end architecture str;

-------------------------------------------------------------------------------
