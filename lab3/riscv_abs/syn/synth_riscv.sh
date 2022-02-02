source /software/scripts/init_synopsys_64.18
cd syn/
mkdir work
mkdir reports_synth_riscv
dc_shell-xg-t -f scripts/synth_riscv.tcl
