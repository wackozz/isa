###################################################################

# Created by write_sdc on Fri Nov 12 16:56:33 2021

###################################################################
set sdc_version 2.1

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current mA
set_load -pin_load 3.40189 [get_ports {dout[8]}]
set_load -pin_load 3.40189 [get_ports {dout[7]}]
set_load -pin_load 3.40189 [get_ports {dout[6]}]
set_load -pin_load 3.40189 [get_ports {dout[5]}]
set_load -pin_load 3.40189 [get_ports {dout[4]}]
set_load -pin_load 3.40189 [get_ports {dout[3]}]
set_load -pin_load 3.40189 [get_ports {dout[2]}]
set_load -pin_load 3.40189 [get_ports {dout[1]}]
set_load -pin_load 3.40189 [get_ports {dout[0]}]
set_load -pin_load 3.40189 [get_ports vout]
create_clock [get_ports clock]  -name MY_CLK  -period 11.6  -waveform {0 5.8}
set_clock_uncertainty 0.07  [get_clocks MY_CLK]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports rst_n]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din[8]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din[7]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din[6]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din[5]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din[4]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din[3]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din[2]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din[1]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din[0]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {a1[8]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {a1[7]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {a1[6]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {a1[5]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {a1[4]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {a1[3]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {a1[2]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {a1[1]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {a1[0]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {c2[8]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {c2[7]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {c2[6]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {c2[5]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {c2[4]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {c2[3]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {c2[2]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {c2[1]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {c2[0]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {c3[8]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {c3[7]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {c3[6]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {c3[5]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {c3[4]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {c3[3]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {c3[2]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {c3[1]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {c3[0]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b0[8]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b0[7]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b0[6]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b0[5]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b0[4]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b0[3]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b0[2]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b0[1]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b0[0]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b1[8]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b1[7]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b1[6]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b1[5]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b1[4]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b1[3]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b1[2]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b1[1]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b1[0]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b2[8]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b2[7]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b2[6]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b2[5]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b2[4]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b2[3]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b2[2]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b2[1]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {b2[0]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports vin]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout[8]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout[7]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout[6]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout[5]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout[4]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout[3]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout[2]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout[1]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout[0]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports vout]