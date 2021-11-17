import os
def change_clock_gen(clk_value):
    file_read = open('hdl/tb/clk_gen.vhd', 'r')
    file_write = open('hdl/tb/clk_gen_tmp.vhd', 'w')
    for line in file_read:
        line2write = line
        line = line.strip()
        line = " ".join(line.split())
        if line.split(' ')[0] == "constant":
            tmp_line = "  constant Ts : time := " + str(clk_value) + " ns;\n"
            file_write.write(tmp_line)
        else:
            file_write.write(line2write)
    file_read.close()
    file_write.close()
    os.remove('hdl/tb/clk_gen.vhd')
    os.rename('hdl/tb/clk_gen_tmp.vhd' , 'clk_gen.vhd')

os.system("hdl/sim/simulate.sh")
print("END SIMULATION MODELSIM")

clk_value = 0
fine = 0
flag = 0
while fine == 0:
	file_object = open('syn/scripts/synth_iir.tcl','a')
	file_object.write('synth '+ str(clk_value))
	file_object.close()
	print("SYNTHESIS WITH " + str(clk_value) + " ns")
	os.system("syn/synth.sh")

	with open('syn/reports/report_timing_' +str(clk_value)+ '_ns.txt','r') as file:
		for line in file:
			if len(line.split(' '))>2:
				if ((line.split(' ')[2] == "slack")):
					line_to_save = line
					break
		pass

	line_to_save = line_to_save.strip()
	line_to_save = " ".join(line_to_save.split())
	line_to_save = line_to_save.split(' ')[2]
	if line_to_save == "increase":
		flag = 1
		with open('syn/reports/report_timing_' +str(clk_value)+ '_ns.txt','r') as file:
			for line in file:
				if len(line.split(' '))>2:
					if ((line.split(' ')[2] == "slack")):
						line_to_save = line
						break
			pass
		line_to_save = line_to_save.strip()
		line_to_save = " ".join(line_to_save.split())
		line_to_save = line_to_save.split(' ')[5]
	file_object = open('syn/scripts/synth_iir.tcl', 'rb')
	pos = next = 0

	for line in file_object:
	  	pos = next # position of beginning of this line
	  	next += len(line) # compute position of beginning of next line

	file_object = open('syn/scripts/synth_iir.tcl', 'ab')
	file_object.truncate(pos)

	if flag == 1:
		clk_value += 0.01
	elif line_to_save == "0.00":
		fine = 1
	else:
		clk_add = float(line_to_save)
		clk_value = float(clk_value) - clk_add
		clk_value += 0.01
	flag = 0

clk_value = clk_value * 4
file_object = open('syn/scripts/synth_iir.tcl','a')
file_object.write('synth '+ str(clk_value))
file_object.close()
print("SYNTHESIS WITH " + str(clk_value) + " ns")
os.system("syn/synth.sh")
print("END SYNTHESIS WITH " + str(clk_value) + " ns")

change_clock_gen(clk_value)
print("CLOCK CHANGED")

os.system("modelsim/post_synth.sh")
print("END SIMULATION POST SYNTHESIS")

os.system("modelsim/vcd2saif.sh")
print("END VCD TO SAIF")

os.system("syn/power.sh")
print("END POWER CONSUMPTION SYNOPSIS")

print("OPEN INNOVUS")
os.system("innovus/place_route.sh")
print("INNOVUS OPENED")
#os.system("modelsim/post_place.sh")
#os.system("innovus/powercons.sh")
