import os
import time
os.system("hdl/sim/simulate.sh")
os.system("syn/synth.sh")
os.system("modelsim/post_synth.sh")
os.system("modelsim/vcd2saif.sh")
os.system("syn/power.sh")
#os.system("innovus/open_innovus.sh")
#os.system("modelsim/post_place.sh")
