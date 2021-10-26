source .synopsys_dc.setup

analyze -f vhdl -lib WORK ../hdl/src/iir_filter.vhd
analyze -f vhdl -lib WORK ../hdl/src/reg.vhd
analyze -f vhdl -lib WORK ../hdl/src/ff.vhd
set power_preserve_rtl_hier_names true
elaborate IIR_FILTER -arch ARCH -lib WORK > ./elaborate.txt
uniquify
link

