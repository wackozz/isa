import os
#os.system("hdl/sim/simulate.sh")

clk_value = 0
prove = 0
while prove <= 3:
	file_object = open('syn/scripts/synth_iir.tcl','a')
	file_object.write('synth '+ str(clk_value))
	file_object.close()
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

	if line_to_save == "0.00":
		prove += 1
	else:
		clk_add = float(line_to_save)
		clk_value = float(clk_value) - clk_add
		clk_value += 0.01

clk_value = clk_value * 4
file_object = open('syn/scripts/synth_iir.tcl','a')
file_object.write('synth '+ str(clk_value))
file_object.close()
os.system("syn/synth.sh")

#os.system("modelsim/post_synth.sh")
#os.system("modelsim/vcd2saif.sh")
#os.system("syn/power.sh")
#os.system("innovus/place_route.sh")
#os.system("modelsim/post_place.sh")
#os.system("innovus/powercons.sh")
