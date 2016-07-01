 v=zeros(length,1);
v(1)=1;
v(2)=1;
for i=3:length;
  v(i)=v(i-1)+v(i-2);
endfor;
v

