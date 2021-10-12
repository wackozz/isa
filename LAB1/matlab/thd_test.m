nb=9;
filename= 'resultsc.txt';
delimiter= '\n';
headerlines = 1;
A=importdata(filename,delimiter,headerlines);
A.data(1)=0;
y=A.data./2^(nb-1);
thd(y)
