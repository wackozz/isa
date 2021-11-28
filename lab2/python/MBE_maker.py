import math
#MBE multiplier maker

N= 32
pp = []

with open("mbe_multiplier.vhd","w") as file:
    #HEADER
    file.write("-- Generated .vhd for MBE multiplication\n\n")
    
    #LIBRARIES
    file.write("library ieee;\nuse ieee.std_logic_1164.all;\nuse ieee.numeric_std.all;\n\n")

    #ENTITY
    file.write("entity MBE_multiplier is\n\n")
    file.write("\tport (\n")
    file.write("\t\tA\t: in  std_logic_vector("+str(N)+"-1 downto 0);\t-- input A\n")
    file.write("\t\tB\t: in  std_logic_vector("+str(N)+"-1 downto 0);\t-- input B\n")
    file.write("\t\tZ\t: out  std_logic_vector("+str(N)+"-1 downto 0));\t-- output Z\n\n")
    file.write("end entity MBE_multiplier;\n\n")
    
    #ARCHITECTURE
    file.write("architecture arch of MBE_multiplier is\n\n")

    #SIGNAL DECLARATION
    file.write("-- SIGNALS\n")

    #A extended 
    file.write("signal A_ext : std_logic_vector("+str(N)+"-1+2 downto 0);\n\n")

    #partial products
    file.write("signal ")
    for i in range(0,N-1,1):
        file.write("par_pro_"+str(i)+", ")
    file.write("par_pro_"+str(N-1)+" : ")
    file.write("std_logic_vector("+str(N+2)+" downto 0);\n\n")

     #triplets
    file.write("signal ")
    for i in range(0,math.ceil(N/2)-1,1):
        file.write("triplet_"+str(i)+", ")
    file.write("triplet_"+str((math.ceil(N/2)-1))+" : ")
    file.write("std_logic_vector(2 downto 0);\n\n")

    #COMPONENT DECLARATION
    file.write("-- COMPONENTS\n")

    #mbe encoder
    file.write("component MBE_encoder is\n")
    file.write("generic (\n")
    file.write("N : integer);\n")
    file.write("port (\n")
    file.write("triplet : in  std_logic_vector(2 downto 0);\n")
    file.write("A       : in  std_logic_vector(N-1 downto 0);\n")
    file.write("P       : out std_logic_vector(N downto 0));\n")
    file.write("end component MBE_encoder;\n\n")

    #BEGIN
    file.write("begin\n")

    #PORT MAP
    for i in range(0,math.ceil(N/2),1):
        file.write("mbe_enc"+str(i)+":\t mbe_encoder generic map(N => "+str(N+2)+") port map (triplet=>triplet_"+str(i)+",A=>A_ext,P=>par_pro_"+str(i)+");\n")

    #SIGNAL ASSOCIATIONS
    file.write("\n-- SIGNAL ASSOCIATIONS\n")
    #ext a
    file.write("A_ext <= A("+str(N)+"-1)&A&'0';\n\n")
    #triplets
    for i in range(1,N,2):
        file.write("triplet_"+str(math.ceil((i-1)/2))+"<=A_ext("+str(i+1)+")&A_ext("+str(i)+")&A_ext("+str(i-1)+");\n")
    
    #END ARCHITECTURE
    file.write("\nend architecture arch;")