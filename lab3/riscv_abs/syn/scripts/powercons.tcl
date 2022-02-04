read_verilog -netlist ../netlist/riscv.v
read_saif -input ../saif/riscv.saif -instance tb_iir/UUT -unit ns -scale 1
create_clock -name MY_CLK clock
report_power > reports/power_report.txt
quit
