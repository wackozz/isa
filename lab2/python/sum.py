A = 8632129
B = 8678393

A_bin = str(bin(A)).split('0b')[1]
B_bin = str(bin(B)).split('0b')[1]

res = A * B

val = [8678393, 0, 0, 8678393, 24876038, 17356786, 24876038, 24876038, 33554431, 8678393, 0, 16197645, 8678393]
ext = [142896121,402653184,1610612736,6997868096,23548134912,120852564224,376770158592,1507080638464,6597069717504,28663267786752,105553116266496,67937847214080,145599278088192]

sum = 0
z = 0

print("A * B = " + str(res))

bin_res = str(bin(res)).split('0b')[1]

print("A * B  bin = " + str(bin_res))

z += pow(4,0) * val[0]
z += pow(4,1) * val[1]
z += pow(4,2) * val[2]
z += pow(4,3) * val[3]
z += pow(4,4) * -(val[4] ^ (pow(2,25)-1))
z += pow(4,5) * val[5]
z += pow(4,6) * -(val[6] ^ (pow(2,25)-1))
z += pow(4,7) * -(val[7] ^ (pow(2,25)-1))
z += pow(4,8) * -(val[8] ^ (pow(2,25)-1))
z += pow(4,9) * val[9]
z += pow(4,10) * val[10]
z += pow(4,11) * -(val[11] ^ (pow(2,25)-1))
z += pow(4,12) * val[12]

print("Z = " + str(z))

for k in range (0, len(ext),1):
    sum += ext[k]

print("Sum ext = " + str(sum))

bin_num = str(bin(sum)).split('0b')[1]

print("Sum ext bin = " + str(bin_num))

print(len(bin_num))


#  10001000010001000001011001110010110100100111001
#1010001000010001000001011001110010110100100111001
# 010001000010001000001011001110010110100100111001

#1010001000010000110110000000000000000000000000000
#SUM = 74913007888697