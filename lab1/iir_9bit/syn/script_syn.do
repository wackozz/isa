gui_start
analyze -f vhdl -lib WORK ../hdl/src/iir_filter.vhd
set power_preserve_rtl_hier_names true
elaborate IIR_FILTER -arch ARCH -lib WORK > ./elaborate.txt
create_clock -name MY_CLK -period 10.0 CLK
set_dont_touch_network MY_CLK
set_clock_uncertainty 0.07 [get_clock MY_CLK]
set_input_delay
set_input_delay 0.5 -max -clock MY_CLK [remove_from_collection [all_inputs] CLK]
set_output_delay 0.5 -max -clock MY_CLK [all_outputs]
set OLOAD [load_of NangateOpenCellLibrary/BUF_X4/A]
set_load $OLOAD [all_outputs]