import os

os.system("hdl/sim/simulate.sh")
input()
os.system("syn/synth.sh")
input()
os.system("modelsim/post_synth.sh")
input()
os.system("modelsim/vcd2saif.sh")
input()
os.system("syn/power.sh")
input()
#os.system("innovus/place_route.sh")
#print("\n**********************INNOVUS CLOSED**********************\n")
#os.system("modelsim/post_place.sh")
#os.system("innovus/powercons.sh")