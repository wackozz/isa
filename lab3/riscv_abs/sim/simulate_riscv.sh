source /software/scripts/init_msim6.2g
cd sim/
vlib work
vsim -c -do "do scripts/run_riscv_cmd.do riscv"
