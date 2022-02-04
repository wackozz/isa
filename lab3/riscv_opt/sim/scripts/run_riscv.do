project new . $1.mpf
project addfile ../src/absolute_value.vhd
project addfile ../src/add_sub.vhd
project addfile ../src/alu.vhd
project addfile ../src/alu_control.vhd
project addfile ../src/barrel_shifter.vhd
project addfile ../src/control.vhd
project addfile ../src/dec_5to32.vhd
project addfile ../src/decode_stage.vhd
project addfile ../src/decode_stage_control.vhd
project addfile ../src/execute_stage.vhd
project addfile ../src/execute_stage_control.vhd
project addfile ../src/fetch_stage.vhd
project addfile ../src/immediate_generator.vhd
project addfile ../src/mem_stage.vhd
project addfile ../src/mem_stage_control.vhd
project addfile ../src/mux_2to1.vhd
project addfile ../src/mux_2to1_bit.vhd
project addfile ../src/mux_4to1.vhd
project addfile ../src/mux_32to1.vhd
project addfile ../src/param_pkg.vhd
project addfile ../src/ram.vhd
project addfile ../src/reg.vhd
project addfile ../src/reg_file.vhd
project addfile ../src/RV32I.vhd
project addfile ../src/RV32I_control.vhd
project addfile ../src/unary_AND.vhd
project addfile ../src/wb_stage.vhd
project addfile ../tb/RV32I_tb.vhd
vsim work.tb_fpmul -t ns
run 1 us
quit -sim
project close
quit
