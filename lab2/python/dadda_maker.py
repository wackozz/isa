import math
#Dadda tree maker
N = 24
H = math.ceil((N/2)+1)
bit_list = []
max_step = 0

#filling bitlist.. RISE
for i in range(2,H,1):
    bit_list.append(i)
    bit_list.append(i)
#SAT #check here for errors
for i in range(N,N+math.ceil(N/4)-1,1): 
    bit_list.append(H)
#FALL
for i in range(1, H-1,1):
    if(i == 1):
        bit_list.append(H-i)
    else:
        bit_list.append(H-i)
        bit_list.append(H-i)
print(len(bit_list))
print(bit_list)
dadda_lst = [2,3,4,6,9,13,19,28]
step = 0
start_h = 0

#find first number in dadda list
for i in range(0,len(dadda_lst),1):
    if(dadda_lst[i] > H):
        step = i
        max_step = i-1
        break

with open("../hdl/src/MBE/dadda_tree.vhd","w") as file:
    #HEADER
    file.write("-- Generated .vhd for MBE multiplication\n\n")
    
    #LIBRARIES
    file.write("library ieee;\nuse ieee.std_logic_1164.all;\nuse ieee.numeric_std.all;\n\n")

    #ENTITY
    file.write("entity dadda_tree is\n\n")
    file.write("\tport (\n\t")
    #first
    file.write("Pp_0 : ")
    file.write("std_logic_vector("+str(N+3)+" downto 0);\n\t")

    #PPExt loop
    for i in range(1,H-2,1):
        file.write("Pp_"+str(i)+", ")
    file.write("Pp_"+str(H-2)+" : ")
    file.write("in std_logic_vector("+str(N+4)+" downto 0);\n")
    #last
    file.write("\tPp_"+str(H-1)+" : ")
    file.write("in std_logic_vector("+str(N+2)+" downto 0);\n\n")
    #output
    file.write("\tZ\t\t: out std_logic_vector("+str(2*N)+"-1 downto 0));\t-- output Z\n\n")
    file.write("end entity dadda_tree;\n\n")
    
    #ARCHITECTURE
    file.write("architecture arch of dadda_tree is\n\n")

    #SIGNAL DECLARATION
    file.write("-- SIGNALS\n")

    #Partial product extension to 64 bits
    file.write("signal ")
    for i in range(0,H-1,1):
        file.write("Pp_EXT_"+str(i)+", ")
    file.write("Pp_EXT_"+str(H-1)+" : ")
    file.write("std_logic_vector("+str(2*N-1)+" downto 0):=(others => '0');\n")

    #Last step signals
    file.write("signal ")
    for i in range(0,H-1,1):
        file.write("r_L"+str(step)+"_"+str(i)+", ")
    file.write("r_L"+str(step)+"_"+str(H-1))
    file.write(": std_logic_vector("+str(2*N)+"-1 downto 0):=(others => '0');\t-- input\n")

    #rows
    step = step -1
    while (step > -1):
        file.write("\n\n--STEP NO. "+str(step)+"\n")
        file.write("signal ")
        for i in range(0,dadda_lst[step]-1,1):
            file.write("r_L"+str(step)+"_"+str(i)+", ")
        file.write("r_L"+str(step)+"_"+str(dadda_lst[step]-1))
        file.write(": std_logic_vector("+str(2*N)+"-1 downto 0):=(others => '0');\n")
        step = step -1
    #COMPONENT DECLARATION
    file.write("\n-- COMPONENTS\n")
    #full adder
    file.write("component full_adder is\n\tport (\n\t\tA\t: in  std_logic;\n\t\tB\t: in  std_logic;\n\t\tCin\t: in  std_logic;\n\t\tSum\t: out std_logic;\n\t\tCout : out std_logic);\nend component full_adder;\n\n")
    #half adder
    file.write("component half_adder is\nport (\n\tA\t: in  std_logic;\n\tB\t: in  std_logic;\n\tS\t: out std_logic;\n\tCout\t: out std_logic);\nend component half_adder;\n\n")

    #BEGIN
    file.write("begin\n ")

    #PORT MAP
    #FIRST STEP
    step = max_step+1
    
    #SIGNAL ASSIGNMENT
    #pp extension
    
    #first
    file.write("Pp_EXT_0 <=")
    file.write("("+str(2*N)+"-1 downto Pp_0'length => '0')&Pp_0;\n")

    #PPExt loop
    sh=0
    for k in range(1,H,1):
        file.write("Pp_EXT_"+str(k)+"<=")
        file.write("("+str(2*N)+"-1 downto Pp_"+str(k)+"'length => '0')&std_logic_vector(shift_left(unsigned(Pp_"+str(k)+"),"+str(sh)+"));\n")
        sh=sh+2
    
    #pyramid creation:
    pos_pp = 0
    for i in range((2*N)-N+4, (2*N),1):
        pos_pp = H-bit_list[i]
        for j in range(0,bit_list[i],1):
            file.write("r_L"+str(step)+"_"+str(j)+"("+str(i)+")<=")
            file.write("Pp_EXT_"+str(pos_pp+j-1)+"("+str(i)+");\n ") 
    
    file.write("\n\n")

    #procedure
    step = step -1
    while(step>=0):
        c=[0]*64 #carries for the next stage
        file.write("\n\n--STEP L"+str(step)+"\td ="+str(dadda_lst[step])+":\n")
        for i in range(0,2*N-1,1):
            diff=bit_list[i]-dadda_lst[step]
            n_fa = 0 #number of FA
            ha = 0 #presence of the HA [0,1]
            pos=c[i] #position in col
            pos_lock=pos
            j=0
            if(diff>=2): #allocate a FA
                n_fa=0 #initialize full adder num = 0
                max_n_fa = math.floor(diff/3) 
                #for j in range (pos_lock,pos_lock+diff-1,3): #FA triplets
                while (diff >=2):
                    n_fa = n_fa+1
                    file.write("FH_L"+str(step)+"_"+str(i)+"_"+str(n_fa)+":")
                    file.write(" full_adder port map(")
                    file.write("r_L"+str(step+1)+"_"+str(j)+"("+str(i)+"), ") #A
                    file.write("r_L"+str(step+1)+"_"+str(j+1)+"("+str(i)+"), ") #B
                    file.write("r_L"+str(step+1)+"_"+str(j+2)+"("+str(i)+"), ") #Cin
                    file.write("r_L"+str(step)+"_"+str(pos)+"("+str(i)+"), ") #Sum
                    file.write("r_L"+str(step)+"_"+str(c[i+1])+"("+str(i+1)+"));\n") #Cout
                    j = j+3 #position (old)
                    pos = pos+1 #position (new)
                    c[i+1] = c[i+1]+1 #update position for the next carry in
                    bit_list[i]= bit_list[i]-2 #2:3 compression
                    bit_list[i+1]= bit_list[i+1]+1 #update number of col bits with carry out
                    diff=bit_list[i]-dadda_lst[step] #recalculate diff

            if (diff==1): #if positive, diff must be == 2 at this point, half adder
                file.write("HA_L"+str(step)+"_"+str(i)+":")
                file.write(" half_adder port map(")
                file.write("r_L"+str(step+1)+"_"+str(j)+"("+str(i)+"), ") #A
                file.write("r_L"+str(step+1)+"_"+str(j)+"("+str(i)+"), ") #B
                file.write("r_L"+str(step)+"_"+str(pos)+"("+str(i)+"), ") #Sum
                file.write("r_L"+str(step)+"_"+str(c[i+1])+"("+str(i+1)+"));\n") #Cout
                c[i+1] = c[i+1]+1 #update position for the next carry in
                bit_list[i]= bit_list[i]-1 #2:3 compression
                bit_list[i+1]= bit_list[i+1]+1 #carry out
                ha = 1 #count for half adder presence
                pos=pos+1

            for v in range(c[i]+2*ha+3*(n_fa),bit_list[i],1):
                file.write("r_L"+str(step)+"_"+str(pos)+"("+str(i)+")"+"<= r_L"+str(step+1)+"_"+str(v)+"("+str(i)+")"+";\n")
                pos = pos+1
            file.write("\n\n")
        step = step -1
    #SIGNAL ASSOCIATIONS
    file.write("Z <=  std_logic_vector(signed(r_L0_0) + signed(r_L0_1));\n")
    #END ARCHITECTURE
    file.write("\nend architecture arch;")