gui_start

source .synopsys_dc.setup

analyze -f vhdl -lib WORK ../hdl/src/iir_filter.vhd
analyze -f vhdl -lib WORK ../hdl/src/reg.vhd
set power_preserve_rtl_hier_names true
elaborate IIR_FILTER -arch ARCH -lib WORK > ./elaborate.txt
uniquify
link

create_clock -name MY_CLK -period 10.0 clock
set_dont_touch_network MY_CLK
set_clock_uncertainty 0.07 [get_clock MY_CLK]
set_input_delay 0.5 -max -clock MY_CLK [remove_from_collection [all_inputs] clock]
set_output_delay 0.5 -max -clock MY_CLK [all_outputs]
set OLOAD [load_of NangateOpenCellLibrary/BUF_X4/A]
set_load $OLOAD [all_outputs]

compile

report_timing > report/report_timing.txt
report_area > report/report_area.txt

ungroup -all -flatten
change_names -hierarchy -rules verilog
write_sdf ../netlist/iir_filter.sdf
write -f verilog -hierarchy -output ../netlist/iir_filter.v
write_sdc ../netlist/iir_filter.sdc
quit
