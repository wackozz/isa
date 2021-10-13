nb=9;
filename= 'resultsm.txt';
delimiter= '\n';
headerlines = 1;
A=importdata(filename,delimiter,headerlines);
A.data(1)=0;
y=A.data./2^(nb-1);
thd(y,10e3,9)
