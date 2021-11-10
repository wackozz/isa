onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic -height 40 /tb_iir/CLK_i
add wave -noupdate -format Logic -height 40 /tb_iir/RST_n_i
add wave -noupdate -format Logic -height 40 /tb_iir/VIN_i
add wave -noupdate -format Literal -height 40 -radix decimal /tb_iir/DIN_i
add wave -noupdate -format Literal -height 40 -radix decimal /tb_iir/a1_i
add wave -noupdate -format Literal -height 40 -radix decimal /tb_iir/a2_i
add wave -noupdate -format Literal -height 40 -radix decimal /tb_iir/b0_i
add wave -noupdate -format Literal -height 40 -radix decimal /tb_iir/b1_i
add wave -noupdate -format Literal -height 40 -radix decimal /tb_iir/b2_i
add wave -noupdate -format Literal -height 40 -radix decimal /tb_iir/DOUT_i
add wave -noupdate -format Logic -height 40 /tb_iir/VOUT_i
add wave -noupdate -format Logic -height 40 /tb_iir/END_SIM_i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {850 ns} 0}
configure wave -namecolwidth 295
configure wave -valuecolwidth 83
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
update
WaveRestoreZoom {0 ns} {3574 ns}
