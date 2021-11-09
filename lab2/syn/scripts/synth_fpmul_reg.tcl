proc elab {} {
source .synopsys_dc.setup
#adding elemts
analyze -f vhdl -lib WORK ../hdl/src/fpmul_stage2_struct.vhd
analyze -f vhdl -lib WORK ../hdl/src/packfp.vhd
analyze -f vhdl -lib WORK ../hdl/src/fpmul_stage3_struct.vhd
analyze -f vhdl -lib WORK ../hdl/src/reg.vhd
analyze -f vhdl -lib WORK ../hdl/src/fpmul_pipeline_reg.vhd
analyze -f vhdl -lib WORK ../hdl/src/fpmul_stage4_struct.vhd
analyze -f vhdl -lib WORK ../hdl/src/unpackfp_unpackfp.vhd
analyze -f vhdl -lib WORK ../hdl/src/FPmul_tb.vhd                    
analyze -f vhdl -lib WORK ../hdl/src/fpnormalize_fpnormalize.vhd
analyze -f vhdl -lib WORK ../hdl/src/fpmul_stage1_struct.vhd  
analyze -f vhdl -lib WORK ../hdl/src/fpround_fpround.vhd
set power_preserve_rtl_hier_names true
elaborate FPmul -arch pipeline -lib WORK > ./reports_point1/elaborate.txt
#filter contains multiple instances of reg, need to uniquify
uniquify 
link
}

proc synth {clk_var} {
#set clock @argv1+-0.07ns
create_clock -name MY_CLK -period $clk_var clock
set_dont_touch_network MY_CLK
set_clock_uncertainty 0.07 [get_clock MY_CLK]
set_input_delay 0.5 -max -clock MY_CLK [remove_from_collection [all_inputs] clock]
set_output_delay 0.5 -max -clock MY_CLK [all_outputs]
set OLOAD [load_of NangateOpenCellLibrary/BUF_X4/A]
set_load $OLOAD [all_outputs]
compile
report_timing > reports_point1/report_timing_${clk_var}_ns.txt
report_area > reports_point1/report_area_clk_${clk_var}_ns.txt
ungroup -all -flatten
#quit
}


elab
#synth 0
