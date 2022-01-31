onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Datapath
add wave -noupdate /rv32i_tb/clock
add wave -noupdate /rv32i_tb/reset
add wave -noupdate /rv32i_tb/inst_adr
add wave -noupdate /rv32i_tb/data_adr
add wave -noupdate /rv32i_tb/write_data_mem
add wave -noupdate /rv32i_tb/data_mem_adr
add wave -noupdate /rv32i_tb/MemWrite
add wave -noupdate /rv32i_tb/read_data_mem
add wave -noupdate -radix unsigned /rv32i_tb/instruction_mem_adr
add wave -noupdate -color Cyan /rv32i_tb/instruction_fetch
add wave -noupdate -color Cyan /rv32i_tb/current_instruction
add wave -noupdate -color Cyan -radix unsigned /rv32i_tb/rs1
add wave -noupdate -color Cyan -radix unsigned /rv32i_tb/rs2
add wave -noupdate -color Cyan -radix unsigned /rv32i_tb/rd
add wave -noupdate -color Cyan -radix decimal /rv32i_tb/immediate
add wave -noupdate /rv32i_tb/MemRead
add wave -noupdate -divider ALU
add wave -noupdate -radix unsigned /rv32i_tb/processor/execute_stage_1/alu_inst/A
add wave -noupdate -radix unsigned /rv32i_tb/processor/execute_stage_1/alu_inst/B
add wave -noupdate /rv32i_tb/processor/execute_stage_1/alu_inst/ALUCtrl
add wave -noupdate -radix unsigned /rv32i_tb/processor/execute_stage_1/alu_inst/result
add wave -noupdate /rv32i_tb/processor/execute_stage_1/alu_inst/zero
add wave -noupdate /rv32i_tb/processor/execute_stage_1/alu_inst/comp
add wave -noupdate /rv32i_tb/processor/execute_stage_1/alu_inst/sum_int
add wave -noupdate /rv32i_tb/processor/execute_stage_1/alu_inst/xor_result
add wave -noupdate /rv32i_tb/processor/execute_stage_1/alu_inst/and_result
add wave -noupdate /rv32i_tb/processor/execute_stage_1/alu_inst/shamt
add wave -noupdate /rv32i_tb/processor/execute_stage_1/alu_inst/shift_result
add wave -noupdate -color Cyan -radix decimal /rv32i_tb/processor/execute_stage_1/read_data1_execute
add wave -noupdate -color Cyan -radix decimal /rv32i_tb/processor/execute_stage_1/read_data2_execute
add wave -noupdate -color Cyan -radix decimal /rv32i_tb/processor/execute_stage_1/data_mem_adr
add wave -noupdate -color Cyan -radix decimal /rv32i_tb/processor/execute_stage_1/write_data_decode
add wave -noupdate -color Cyan -radix decimal /rv32i_tb/processor/execute_stage_1/out_mux_forward_A
add wave -noupdate -color Cyan -radix decimal /rv32i_tb/processor/execute_stage_1/out_mux_forward_B
add wave -noupdate -divider mux_reg_file_1
add wave -noupdate -color {Slate Blue} -radix decimal -childformat {{/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(0) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(1) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(2) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(3) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(4) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(5) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(6) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(7) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(8) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(9) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(10) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(11) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(12) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(13) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(14) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(15) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(16) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(17) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(18) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(19) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(20) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(21) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(22) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(23) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(24) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(25) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(26) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(27) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(28) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(29) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(30) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(31) -radix decimal}} -subitemconfig {/rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(0) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(1) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(2) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(3) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(4) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(5) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(6) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(7) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(8) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(9) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(10) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(11) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(12) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(13) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(14) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(15) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(16) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(17) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(18) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(19) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(20) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(21) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(22) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(23) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(24) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(25) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(26) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(27) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(28) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(29) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(30) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux(31) {-color {Slate Blue} -radix decimal}} /rv32i_tb/processor/decode_stage_1/register_file/mux1/in_mux
add wave -noupdate -color {Slate Blue} -radix decimal -childformat {{/rv32i_tb/processor/decode_stage_1/register_file/mux1/sel(4) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/sel(3) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/sel(2) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/sel(1) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux1/sel(0) -radix decimal}} -subitemconfig {/rv32i_tb/processor/decode_stage_1/register_file/mux1/sel(4) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/sel(3) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/sel(2) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/sel(1) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux1/sel(0) {-color {Slate Blue} -radix decimal}} /rv32i_tb/processor/decode_stage_1/register_file/mux1/sel
add wave -noupdate -color {Slate Blue} -radix decimal /rv32i_tb/processor/decode_stage_1/register_file/mux1/out_mux
add wave -noupdate -divider mux_reg_file_2
add wave -noupdate -color {Slate Blue} -radix decimal -childformat {{/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(0) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(1) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(2) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(3) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(4) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(5) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(6) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(7) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(8) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(9) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(10) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(11) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(12) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(13) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(14) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(15) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(16) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(17) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(18) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(19) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(20) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(21) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(22) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(23) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(24) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(25) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(26) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(27) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(28) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(29) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(30) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(31) -radix decimal}} -subitemconfig {/rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(0) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(1) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(2) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(3) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(4) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(5) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(6) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(7) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(8) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(9) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(10) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(11) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(12) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(13) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(14) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(15) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(16) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(17) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(18) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(19) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(20) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(21) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(22) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(23) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(24) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(25) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(26) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(27) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(28) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(29) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(30) {-color {Slate Blue} -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux(31) {-color {Slate Blue} -radix decimal}} /rv32i_tb/processor/decode_stage_1/register_file/mux2/in_mux
add wave -noupdate -color {Slate Blue} -radix decimal /rv32i_tb/processor/decode_stage_1/register_file/mux2/sel
add wave -noupdate -color {Slate Blue} -radix decimal /rv32i_tb/processor/decode_stage_1/register_file/mux2/out_mux
add wave -noupdate -divider Reg_file
add wave -noupdate -radix unsigned /rv32i_tb/processor/decode_stage_1/register_file/read_reg1
add wave -noupdate -radix unsigned -childformat {{/rv32i_tb/processor/decode_stage_1/register_file/read_reg2(4) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/read_reg2(3) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/read_reg2(2) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/read_reg2(1) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/read_reg2(0) -radix unsigned}} -subitemconfig {/rv32i_tb/processor/decode_stage_1/register_file/read_reg2(4) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/read_reg2(3) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/read_reg2(2) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/read_reg2(1) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/read_reg2(0) {-height 21 -radix unsigned}} /rv32i_tb/processor/decode_stage_1/register_file/read_reg2
add wave -noupdate -radix unsigned /rv32i_tb/processor/decode_stage_1/register_file/write_reg
add wave -noupdate -radix unsigned /rv32i_tb/processor/decode_stage_1/register_file/write_data
add wave -noupdate /rv32i_tb/processor/decode_stage_1/register_file/write_en
add wave -noupdate -radix unsigned /rv32i_tb/processor/decode_stage_1/register_file/read_data1
add wave -noupdate -radix unsigned /rv32i_tb/processor/decode_stage_1/register_file/read_data2
add wave -noupdate -radix decimal -childformat {{/rv32i_tb/processor/decode_stage_1/register_file/q_array(0) -radix decimal -childformat {{/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(31) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(30) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(29) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(28) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(27) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(26) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(25) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(24) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(23) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(22) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(21) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(20) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(19) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(18) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(17) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(16) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(15) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(14) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(13) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(12) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(11) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(10) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(9) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(8) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(7) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(6) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(5) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(4) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(3) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(2) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(1) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(0) -radix unsigned}}} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(1) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(2) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(3) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(4) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(5) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(6) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(7) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(8) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(9) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(10) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(11) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(12) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(13) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(14) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(15) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(16) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(17) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(18) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(19) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(20) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(21) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(22) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(23) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(24) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(25) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(26) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(27) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(28) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(29) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(30) -radix decimal} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(31) -radix decimal}} -subitemconfig {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0) {-height 21 -radix decimal -childformat {{/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(31) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(30) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(29) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(28) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(27) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(26) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(25) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(24) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(23) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(22) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(21) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(20) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(19) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(18) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(17) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(16) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(15) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(14) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(13) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(12) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(11) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(10) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(9) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(8) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(7) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(6) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(5) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(4) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(3) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(2) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(1) -radix unsigned} {/rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(0) -radix unsigned}}} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(31) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(30) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(29) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(28) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(27) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(26) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(25) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(24) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(23) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(22) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(21) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(20) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(19) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(18) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(17) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(16) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(15) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(14) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(13) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(12) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(11) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(10) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(9) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(8) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(7) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(6) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(5) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(4) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(3) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(2) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(1) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(0)(0) {-height 21 -radix unsigned} /rv32i_tb/processor/decode_stage_1/register_file/q_array(1) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(2) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(3) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(4) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(5) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(6) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(7) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(8) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(9) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(10) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(11) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(12) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(13) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(14) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(15) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(16) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(17) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(18) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(19) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(20) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(21) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(22) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(23) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(24) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(25) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(26) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(27) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(28) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(29) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(30) {-height 21 -radix decimal} /rv32i_tb/processor/decode_stage_1/register_file/q_array(31) {-height 21 -radix decimal}} /rv32i_tb/processor/decode_stage_1/register_file/q_array
add wave -noupdate /rv32i_tb/processor/decode_stage_1/register_file/out_dec_s
add wave -noupdate /rv32i_tb/processor/decode_stage_1/register_file/en_reg
add wave -noupdate -divider Control
add wave -noupdate /rv32i_tb/processor/RV32I_control_1/instruction_decode
add wave -noupdate /rv32i_tb/processor/RV32I_control_1/ALUSrc
add wave -noupdate /rv32i_tb/processor/RV32I_control_1/alu_ctrl_execute
add wave -noupdate /rv32i_tb/processor/RV32I_control_1/Zero_execute
add wave -noupdate /rv32i_tb/processor/RV32I_control_1/MemWrite
add wave -noupdate /rv32i_tb/processor/RV32I_control_1/MemRead
add wave -noupdate /rv32i_tb/processor/RV32I_control_1/ALUCtrl
add wave -noupdate /rv32i_tb/processor/RV32I_control_1/PCSrc
add wave -noupdate /rv32i_tb/processor/RV32I_control_1/RegWrite
add wave -noupdate /rv32i_tb/processor/RV32I_control_1/MemToReg
add wave -noupdate /rv32i_tb/processor/RV32I_control_1/ALUOp_execute
add wave -noupdate /rv32i_tb/processor/RV32I_control_1/Branch_execute
add wave -noupdate /rv32i_tb/processor/RV32I_control_1/MemWrite_execute
add wave -noupdate /rv32i_tb/processor/RV32I_control_1/MemRead_execute
add wave -noupdate /rv32i_tb/processor/RV32I_control_1/RegWrite_execute
add wave -noupdate /rv32i_tb/processor/RV32I_control_1/MemToReg_execute
add wave -noupdate /rv32i_tb/processor/RV32I_control_1/Zero
add wave -noupdate /rv32i_tb/processor/RV32I_control_1/Branch
add wave -noupdate /rv32i_tb/processor/RV32I_control_1/MemToReg_mem
add wave -noupdate /rv32i_tb/processor/RV32I_control_1/RegWrite_mem
add wave -noupdate -divider Forwarding
add wave -noupdate -color Cyan -radix decimal /rv32i_tb/processor/RV32I_control_1/execute_stage_control_1/forwarding_unit_1/Rs1
add wave -noupdate -color Cyan -radix decimal /rv32i_tb/processor/RV32I_control_1/execute_stage_control_1/forwarding_unit_1/Rs2
add wave -noupdate -color Cyan -radix decimal /rv32i_tb/processor/RV32I_control_1/execute_stage_control_1/forwarding_unit_1/Rd_mem
add wave -noupdate -color Cyan -radix decimal /rv32i_tb/processor/RV32I_control_1/execute_stage_control_1/forwarding_unit_1/Rd_wb
add wave -noupdate -color Cyan -radix decimal /rv32i_tb/processor/RV32I_control_1/execute_stage_control_1/forwarding_unit_1/RegWrite_mem
add wave -noupdate -color Cyan -radix decimal /rv32i_tb/processor/RV32I_control_1/execute_stage_control_1/forwarding_unit_1/RegWrite
add wave -noupdate -color Cyan /rv32i_tb/processor/RV32I_control_1/execute_stage_control_1/forwarding_unit_1/forward_A
add wave -noupdate -color Cyan /rv32i_tb/processor/RV32I_control_1/execute_stage_control_1/forwarding_unit_1/forward_B
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {70 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 178
configure wave -valuecolwidth 169
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1050 ns}
