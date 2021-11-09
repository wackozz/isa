onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -height 40 /tb_iir/CLK_i
add wave -noupdate -height 40 /tb_iir/RST_n_i
add wave -noupdate -height 40 /tb_iir/VIN_i
add wave -noupdate -height 40 -radix decimal /tb_iir/DIN_i
add wave -noupdate -height 40 -radix decimal /tb_iir/a1_i
add wave -noupdate -height 40 -radix decimal /tb_iir/a2_i
add wave -noupdate -height 40 -radix decimal /tb_iir/b0_i
add wave -noupdate -height 40 -radix decimal /tb_iir/b1_i
add wave -noupdate -height 40 -radix decimal /tb_iir/b2_i
add wave -noupdate -height 40 -radix decimal /tb_iir/DOUT_i
add wave -noupdate -height 40 /tb_iir/VOUT_i
add wave -noupdate -height 40 /tb_iir/END_SIM_i
add wave -noupdate -height 40 -radix decimal /tb_iir/UUT/q_reg1
add wave -noupdate -height 40 -radix decimal /tb_iir/UUT/q_reg2
add wave -noupdate -height 40 /tb_iir/UUT/tmp_a_slv
add wave -noupdate -height 40 /tb_iir/UUT/tmp_b_slv
add wave -noupdate -height 40 /tb_iir/UUT/q_reg1
add wave -noupdate -height 40 /tb_iir/UUT/q_reg2
add wave -noupdate -height 40 /tb_iir/UUT/din_s
add wave -noupdate -height 40 /tb_iir/UUT/a1_s
add wave -noupdate -height 40 /tb_iir/UUT/a2_s
add wave -noupdate -height 40 /tb_iir/UUT/b0_s
add wave -noupdate -height 40 /tb_iir/UUT/b1_s
add wave -noupdate -height 40 /tb_iir/UUT/b2_s
add wave -noupdate -height 40 /tb_iir/UUT/TMPq1_a1
add wave -noupdate -height 40 /tb_iir/UUT/TMPq2_a2
add wave -noupdate -height 40 /tb_iir/UUT/TMPtmpa_b0
add wave -noupdate -height 40 /tb_iir/UUT/TMPq1_b1
add wave -noupdate -height 40 /tb_iir/UUT/TMPq2_b2
add wave -noupdate -height 40 /tb_iir/UUT/TMPa
add wave -noupdate -height 40 /tb_iir/UUT/TMPb
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 295
configure wave -valuecolwidth 213
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
configure wave -timelineunits ns
update
WaveRestoreZoom {24 ns} {114 ns}
