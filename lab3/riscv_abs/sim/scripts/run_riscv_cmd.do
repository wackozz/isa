project new . $1.mpf
vcom -93 -work ./work ../hdl/src/absolute_value.vhd
vcom -93 -work ./work ../hdl/src/add_sub.vhd
vcom -93 -work ./work ../hdl/src/alu.vhd
vcom -93 -work ./work ../hdl/src/alu_control.vhd
vcom -93 -work ./work ../hdl/src/barrel_shifter.vhd
vcom -93 -work ./work ../hdl/src/control.vhd
vcom -93 -work ./work ../hdl/src/dec_5to32.vhd
vcom -93 -work ./work ../hdl/src/decode_stage.vhd
vcom -93 -work ./work ../hdl/src/decode_stage_control.vhd
vcom -93 -work ./work ../hdl/src/execute_stage.vhd
vcom -93 -work ./work ../hdl/src/execute_stage_control.vhd
vcom -93 -work ./work ../hdl/src/fetch_stage.vhd
vcom -93 -work ./work ../hdl/src/forwarding_unit.vhd
vcom -93 -work ./work ../hdl/src/hazard_unit.vhd
vcom -93 -work ./work ../hdl/src/immediate_generator.vhd
vcom -93 -work ./work ../hdl/src/mem_stage.vhd
vcom -93 -work ./work ../hdl/src/mem_stage_control.vhd
vcom -93 -work ./work ../hdl/src/mux_2to1.vhd
vcom -93 -work ./work ../hdl/src/mux_2to1_bit.vhd
vcom -93 -work ./work ../hdl/src/mux_2to1_stall.vhd
vcom -93 -work ./work ../hdl/src/mux_4to1.vhd
vcom -93 -work ./work ../hdl/src/mux_32to1.vhd
vcom -93 -work ./work ../hdl/src/param_pkg.vhd
vcom -93 -work ./work ../hdl/src/ram.vhd
vcom -93 -work ./work ../hdl/src/reg.vhd
vcom -93 -work ./work ../hdl/src/reg_file.vhd
vcom -93 -work ./work ../hdl/src/RV32I.vhd
vcom -93 -work ./work ../hdl/src/RV32I_control.vhd
vcom -93 -work ./work ../hdl/src/unary_AND.vhd
vcom -93 -work ./work ../hdl/src/wb_stage.vhd
vcom -93 -work ./work ../hdl/tb/RV32I_tb.vhd
vsim work.rv32i_tb
run 1 us
quit -sim
project close
quit
