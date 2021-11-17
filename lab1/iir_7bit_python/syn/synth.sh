source /software/scripts/init_synopsys_64.18
cd syn/
echo $1
dc_shell-xg-t -f scripts/synth_iir.tcl
