source /software/scripts/init_synopsys_64.18
cd syn/
rm -r work
rm -r reports
mkdir work
mkdir reports
dc_shell-xg-t -f scripts/synth_riscv.tcl
