source /software/scripts/init_msim6.2g
cd modelsim/
rm -r work
vlib work
vsim -c -do "do scripts/run_postsynth_cmd.do RV32I_postsynth"
