-------------------------------------------------------------------------------
-- Title      : RV32I fetch stage
-- Project    : 
-------------------------------------------------------------------------------
-- File       : fetch_stage.vhd
-- Author     : wackoz  <wackoz@wT14>
-- Company    : 
-- Created    : 2022-01-03
-- Last update: 2022-01-04
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Fetch stage for RV32I
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


-------------------------------------------------------------------------------

entity fetch_stage is

  port (
    clock               : in  std_logic;
    reset               : in  std_logic;
    target_address      : in  std_logic_vector(31 downto 0);
    instruction_mem_adr : out std_logic_vector(31 downto 0);
    pc_out              : out std_logic_vector(31 downto 0);
    instruction_in      : in  std_logic_vector(31 downto 0);
    instruction_out     : out std_logic_vector(31 downto 0));
end entity fetch_stage;

-------------------------------------------------------------------------------
architecture str of fetch_stage is

  -----------------------------------------------------------------------------
  -- Component declarations
  -----------------------------------------------------------------------------
  component mux_2to1 is
    port (
      in_mux_0 : in  std_logic_vector(31 downto 0);
      in_mux_1 : in  std_logic_vector(31 downto 0);
      sel      : in  std_logic;
      out_mux  : out std_logic_vector (31 downto 0));
  end component mux_2to1;

  component reg is
    port (
      D                    : in  std_logic_vector (31 downto 0);
      clock, reset, enable : in  std_logic;
      Q                    : out std_logic_vector (31 downto 0));
  end component reg;

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------
  signal pc_in, pc_out_int                  : std_logic_vector(31 downto 0);
  signal pcinput_in_mux_0, pcinput_in_mux_1 : std_logic_vector(31 downto 0);

  --controls (to delete)
  signal PCSrc : std_logic;

begin  -- architecture str

  -----------------------------------------------------------------------------
  -- Component instantiations
  -----------------------------------------------------------------------------

  -- Program Counter (PC)
  PC : reg
    port map (
      D      => pc_in,
      clock  => clock,
      reset  => reset,
      enable => '1',
      Q      => pc_out_int);

  -- instance "PCinputmux"
  pcinputmux : mux_2to1
    port map (
      in_mux_0 => pcinput_in_mux_0,
      in_mux_1 => pcinput_in_mux_1,
      sel      => PCSrc,
      out_mux  => pc_in);

  -- mux signals assignment
  pcinput_in_mux_0 <= std_logic_vector(unsigned(pc_out_int) + 4);
  pcinput_in_mux_1 <= target_address;

  --output assignment
  instruction_mem_adr <= pc_out_int;
  pipe : process (clock, reset) is
  begin  -- process pipe
    if reset = '0' then -- asynchronous reset (active low)
      instruction_out <= (others => '0');
      pc_out <= (others => '0');
    elsif clock'event and clock = '1' then  -- rising clock edge
      instruction_out <= instruction_in;
      pc_out          <= pc_out_int;
    end if;
  end process pipe;


end architecture str;

-------------------------------------------------------------------------------