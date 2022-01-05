-------------------------------------------------------------------------------
-- Title      : RV32I execute stage
-- Project    : 
-------------------------------------------------------------------------------
-- File       : execute_stage.vhd
-- Author     : wackoz  <wackoz@wT14>
-- Company    : 
-- Created    : 2022-01-03
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
-- 2022-01-03  1.0      wackoz  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.param_pkg.all;

-------------------------------------------------------------------------------

entity execute_stage is

  port (
    clock                : in  std_logic;
    reset                : in  std_logic;
    ALUSrc               : in  std_logic;
    alu_ctrl_execute     : in  std_logic_vector(3 downto 0);
    pc_execute           : in  std_logic_vector(31 downto 0);
    rd_execute           : in  std_logic_vector(4 downto 0);
    read_data1_execute   : in  std_logic_vector(31 downto 0);
    read_data2_execute   : in  std_logic_vector(31 downto 0);
    immediate_execute    : in  std_logic_vector(31 downto 0);
    alu_result_mem       : out std_logic_vector(31 downto 0);
    read_data2_mem       : out std_logic_vector(31 downto 0);
    target_address_fetch : out std_logic_vector(31 downto 0);
    rd_mem               : out std_logic_vector(4 downto 0));

end entity execute_stage;

-------------------------------------------------------------------------------

architecture str of execute_stage is

  component mux_2to1 is
    port (
      in_mux_0 : in  std_logic_vector(N-1 downto 0);
      in_mux_1 : in  std_logic_vector(N-1 downto 0);
      sel      : in  std_logic;
      out_mux  : out std_logic_vector (N-1 downto 0));
  end component mux_2to1;

  component alu is
    port (
      A      : in  std_logic_vector(31 downto 0);
      B      : in  std_logic_vector(31 downto 0);
      result : out std_logic_vector(31 downto 0));
  end component alu;

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------
  signal alu_B, alu_result_int : std_logic_vector(31 downto 0);

begin  -- architecture str

  -----------------------------------------------------------------------------
  -- Component instantiations
  -----------------------------------------------------------------------------

  -- instance "mux_alu_b"
  alu_b_mux : mux_2to1
    port map (
      in_mux_0 => read_data2_execute,
      in_mux_1 => immediate_execute,
      sel      => ALUSrc,
      out_mux  => alu_B);

  -- instance "alu_inst"
  alu_inst : alu
    port map (
      A      => read_data1_execute,
      B      => alu_B,
      result => alu_result_int);

  pipe : process (clock, reset) is
  begin  -- process pipe
    if reset = '0' then                     -- asynchronous reset (active low)
      alu_result_mem <= (others => '0');
      rd_mem         <= (others => '0');
      read_data2_mem         <= (others => '0');
    elsif clock'event and clock = '1' then  -- rising clock edge
      alu_result_mem <= alu_result_int;
      rd_mem         <= rd_execute;
      read_data2_mem <= read_data2_execute;
    end if;
  end process pipe;

  --target address
  target_address_fetch <= std_logic_vector(signed(pc_execute) + (signed(immediate_execute(30 downto 0)&'0')));
end architecture str;   

-------------------------------------------------------------------------------
