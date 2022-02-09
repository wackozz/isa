project new . $1.mpf
project addfile ../hdl/tb/RV32I_tb.vhd
project addfile ../innovus/riscv.v
project compileall
vsim -L /software/dk/nangate45/verilog/msim6.2g -sdftyp /tb_iir/UUT=../innovus/iir_filter.sdf work.tb_iir
vcd file ../vcd/iir_filter_postplace.vcd
vcd add /tb_iir/UUT/*
run 2 us
quit -sim
project close
quit
