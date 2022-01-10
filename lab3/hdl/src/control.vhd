-------------------------------------------------------------------------------
-- Title      : control
-- Project    : 
-------------------------------------------------------------------------------
-- File       : control.vhd
-- Author     : stefano  <stefano@stefano-N56JK>
-- Company    : 
-- Created    : 2022-01-08
-- Last update: 2022-01-10
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2022 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2022-01-08  1.0      stefano Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity control is

  port (
    instruction : in  std_logic_vector(31 downto 0);
    ALUSrc      : out std_logic;
    MemToReg    : out std_logic;
    RegWrite    : out std_logic;
    MemRead     : out std_logic;
    MemWrite    : out std_logic;
    Branch      : out std_logic;
    ALUOp       : out std_logic_vector(1 downto 0));
end entity control;

-------------------------------------------------------------------------------

architecture str of control is

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------

  signal opcode : std_logic_vector(6 downto 0);

begin  -- architecture str

  -----------------------------------------------------------------------------
  -- Component instantiations
  -----------------------------------------------------------------------------

  ctrl_proc : process (opcode) is
  begin  -- process ctrl_proc
    ALUSrc   <= '0';
    MemToReg <= '0';
    RegWrite <= '0';
    MemRead  <= '0';
    MemWrite <= '0';
    Branch   <= '0';
    ALUOp    <= "00";
    case opcode is
      when "0110011" => ALUSrc <= '0';  -- R-type
                        MemToReg <= '0';
                        RegWrite <= '1';
                        MemRead  <= '0';
                        MemWrite <= '0';
                        Branch   <= '0';
                        ALUOp    <= "10";

      when "0010011" => ALUSrc <= '1';  -- SRAI/I-type
                        MemToReg <= '0';
                        RegWrite <= '1';
                        MemRead  <= '0';
                        MemWrite <= '0';
                        Branch   <= '0';
                        ALUOp    <= "10";

      when "0000011" => ALUSrc <= '1';  -- LW
                        MemToReg <= '1';
                        RegWrite <= '1';
                        MemRead  <= '1';
                        MemWrite <= '0';
                        Branch   <= '0';
                        ALUOp    <= "00";

      when "0100011" => ALUSrc <= '1';  -- SW
                        MemToReg <= '0';
                        RegWrite <= '0';
                        MemRead  <= '0';
                        MemWrite <= '1';
                        Branch   <= '0';
                        ALUOp    <= "00";

      when "1100011" => ALUSrc <= '1';  -- BEQ
                        MemToReg <= '0';
                        RegWrite <= '0';
                        MemRead  <= '0';
                        MemWrite <= '0';
                        Branch   <= '1';
                        ALUOp    <= "01";

      when "0110111" => ALUSrc <= '1';  -- LUI
                        MemToReg <= '0';
                        RegWrite <= '1';
                        MemRead  <= '0';
                        MemWrite <= '0';
                        Branch   <= '0';
                        ALUOp    <= "00";

      when "0010111" => ALUSrc <= '1';  -- AUIPC
                        MemToReg <= '0';
                        RegWrite <= '1';
                        MemRead  <= '0';
                        MemWrite <= '0';
                        Branch   <= '0';
                        ALUOp    <= "11";

      when "1101111" => ALUSrc <= '1';  -- J-type
                        MemToReg <= '0';
                        RegWrite <= '1';
                        MemRead  <= '0';
                        MemWrite <= '0';
                        Branch   <= '0';
                        ALUOp    <= "11";
      when others => null;
    end case;
  end process ctrl_proc;

  opcode <= instruction(6 downto 0);

end architecture str;

-------------------------------------------------------------------------------
