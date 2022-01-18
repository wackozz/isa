-------------------------------------------------------------------------------
-- Title      : Testbench for design "fetch_stage"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : fetch_stage_tb.vhd
-- Author     : wackoz  <wackoz@wT14>
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
-- 2022-01-18  1.0      wackoz  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity fetch_stage_tb is

end entity fetch_stage_tb;

-------------------------------------------------------------------------------

architecture arch of fetch_stage_tb is

  -- component ports
  signal reset                : std_logic                     := '0';
  signal PCSrc                : std_logic                     := '0';
  signal target_address_fetch : std_logic_vector(31 downto 0) := x"00001010";
  signal instruction_mem_adr  : std_logic_vector(31 downto 0) ;
  signal pc_decode            : std_logic_vector(31 downto 0) ;
  signal instruction_fetch    : std_logic_vector(31 downto 0) ;
  signal instruction_decode   : std_logic_vector(31 downto 0) ;

  -- clock
  signal clock : std_logic := '1';

begin  -- architecture arch

  -- component instantiation
  DUT : entity work.fetch_stage
    port map (
      clock                => clock,
      reset                => reset,
      PCSrc                => PCSrc,
      target_address_fetch => target_address_fetch,
      instruction_mem_adr  => instruction_mem_adr,
      pc_decode            => pc_decode,
      instruction_fetch    => instruction_fetch,
      instruction_decode   => instruction_decode);

  -- clock generation
  clock <= not clock after 1 ns;

  -- waveform generation
  WaveGen_Proc : process
  begin
    wait for 3 ns;
    reset <= '1';


    wait;
  end process WaveGen_Proc;



end architecture arch;

-------------------------------------------------------------------------------

configuration fetch_stage_tb_arch_cfg of fetch_stage_tb is
  for arch
  end for;
end fetch_stage_tb_arch_cfg;

-------------------------------------------------------------------------------
