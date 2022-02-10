project new . $1.mpf
project addfile ../hdl/src/ram.vhd
project addfile ../hdl/tb/RV32I_tb.vhd
project addfile ../netlist/riscv.v
project compileall
vsim -L /software/dk/nangate45/verilog/msim6.2g -sdftyp /rv32i_tb/processor=../netlist/riscv.sdf work.rv32i_tb
vcd file ../vcd/riscv.vcd
vcd add /rv32i_tb/*
run 2 us
quit -sim
project close
quit