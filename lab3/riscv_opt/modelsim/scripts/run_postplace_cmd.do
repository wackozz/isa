project new . $1.mpf
project addfile ../hdl/src/ram.vhd
project addfile ../hdl/tb/RV32I_tb.vhd
project addfile ../innovus/RV32I.v
project compileall
vsim -L /software/dk/nangate45/verilog/msim6.2g -sdftyp /riscv_tb/processor=../innovus/RV32I.sdf work.riscv_tb
vcd file ../vcd/RV32I_postplace.vcd
vcd add /riscv_tb/processor/*
run 2 us
quit -sim
project close
quit
