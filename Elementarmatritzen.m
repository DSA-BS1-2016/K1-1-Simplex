1;
function M=P_ij(i,j,n)
  M=eye(n);
  M(i,i)=0;
  M(j,j)=0;
  M(i,j)=1;
  M(j,i)=1;
endfunction

function N=S_i(i,l,n)
  N=eye(n);
  N(i,i)=l;
endfunction


function N=Q_ijl(i,j,l,n)
  N=eye(n);
  N(i,j)=l;
endfunction
