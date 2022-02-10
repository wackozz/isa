project new . $1.mpf
project addfile ../hdl/tb/RV32I_tb.vhd
project addfile ../netlist/riscv.v
project compileall
vsim -L /software/dk/nangate45/verilog/msim6.2g -sdftyp /rv32i_tb/UUT=../netlist/iir_filter.sdf work.rv32i_tb
vcd file ../vcd/riscv.vcd
vcd add /rv32i_tb/UUT/*
run 2 us
quit -sim
project close
quit
