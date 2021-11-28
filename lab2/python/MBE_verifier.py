
#Multiplication NxN
#N partial products
N=8
A = "0"+str(bin(144)).split('b')[1]
B = 132
triplets = []
Pp = []
Result = 0

#MBE encoder
A=''.join([A,'0'])
if((len(A)%2) == 0):
    A=''.join([A[len(A)-1],A])

#triplets production
for i in range(len(A)-2,0,-2):
    triplets.append(A[i-1]+A[i]+A[i+1])

#partial product
for i in range(0,len(triplets),1):
    if (triplets[i] == "000" or triplets[i] =="111") :
        Pp.append(0)
    if (triplets[i] == "010" or triplets[i] == "001") :
        Pp.append(B)
    if (triplets[i] == "110" or triplets[i] == "101") :
        Pp.append(-B)
    if triplets[i] == "100":
        Pp.append(-2*B)
    if triplets[i] == "011":
        Pp.append(2*B)
        
#check product
for i in range(0,len(triplets),1):
    Result = Result + pow(4,i) * Pp[i]