-------------------------------------------------------------------------------
-- Title      : RV32I decode stage
-- Project    : 
-------------------------------------------------------------------------------
-- File       : decode_stage.vhd
-- Author     : wackoz  <wackoz@wT14>
-- Company    : 
-- Created    : 2022-01-03
-- Last update: 2022-01-04
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

entity decode_stage is

  port (
    clock          : in  std_logic;
    reset          : in  std_logic;
    instruction    : in  std_logic_vector(31 downto 0);
    pc_in          : in  std_logic_vector(31 downto 0);
    write_en       : in  std_logic;
    write_reg_in   : in  std_logic_vector(5 downto 0);
    write_data_in  : in  std_logic_vector(31 downto 0);
    write_reg_out  : out std_logic_vector(5 downto 0);
    write_data_out : out std_logic_vector(31 downto 0);
    read_data1_out : out std_logic_vector(31 downto 0);
    read_data2_out : out std_logic_vector(31 downto 0));

end entity decode_stage;

-------------------------------------------------------------------------------

architecture str of decode_stage is

  component reg_file is
    port (
      read_reg1, read_reg2   : in  std_logic_vector (n_min-1 downto 0);
      write_reg              : in  std_logic_vector (n_min-1 downto 0);
      clock, reset, enable   : in  std_logic;
      write_data             : in  std_logic_vector (N-1 downto 0);
      write_en               : in  std_logic;
      read_data1, read_data2 : out std_logic_vector (N-1 downto 0));
  end component reg_file;

  component immediate_generator is
    port (
      instruction : in  std_logic_vector(31 downto 0);
      immediate   : out std_logic_vector(63 downto 0));
  end component immediate_generator;

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------
  signal read_data1_int, read_data2_int : std_logic_vector(31 downto 0);
begin  -- architecture str

  -----------------------------------------------------------------------------
  -- Component instantiations
  -----------------------------------------------------------------------------

  -- instance "register_file"
  register_file : reg_file
    port map (
      read_reg1  => instruction(19 downto 15),
      read_reg2  => instruction(24 downto 20),
      write_reg  => write_reg_in,
      clock      => clock,
      reset      => reset,
      enable     => '1',
      write_data => write_data_in,
      write_en   => write_en,
      read_data1 => read_data1_int,
      read_data2 => read_data2_int);



  pipe : process (clock, reset) is
  begin  -- process pipe
    if reset = '0' then                     -- asynchronous reset (active low)
      imm_gen_out    <= (others => '0');
      read_data1_out <= (others => '0');
      read_data2_out <= (others => '0');
    elsif clock'event and clock = '1' then  -- rising clock edge
      imm_gen_out    <= imm_gen_out_int;
      read_data1_out <= read_data1_int;
      read_data2_out <= read_data2_int;
    end if;
  end process pipe;

  -- instance "immediate_generator_1"
  immediate_generator_1 : entity work.immediate_generator
    port map (
      instruction => instruction,
      immediate   => imm_gen_out_int);

end architecture str;

-------------------------------------------------------------------------------
