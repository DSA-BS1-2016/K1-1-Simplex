function M=ZSF(MI)
  M=gauss3(MI);
endfunction


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

function w=check_column_empty(MI,j)
  w=ones(1,rows(MI))*MI(1:rows(MI),j)==0;
endfunction

function i=find_first_not_0(MI,j)
  found=false;
  for i=1:rows(MI)
    if(MI(i,j)!=0)
      found=true;
      break
    endif
  
  endfor
  if found==false
    i=0;
  endif
  %i
  i=i;
endfunction

function  j=find_first_column_not_empty(MI)
  found=false;
  for j=1:columns(MI)
    if(check_column_empty(MI,j)==false)
      found=true;
      break
    endif
  endfor
  if found==false
    j=0;
  endif
  %j
  j=j;
endfunction

function M=eliminate(MI,m2,m,j)
  lambda=-MI(m2,j)/MI(m,j);
  M=Q_ijl(m2,m,lambda,rows(MI))*MI;
endfunction

function M=eliminate_col(MI,j)
  M=MI;
  MI(1,j);
  if(MI(1,j)!=0)
    for i=2:rows(MI)
      %if(MI(j,i)!=0)
        i;
        MI=eliminate(MI,i,1,j);
      %endif
    endfor  
  end
  M=MI;
endfunction

function [N,MO]=gauss2(MI)
  j=find_first_column_not_empty(MI);
  n=find_first_not_0(MI,j); 
  if(n!=1)
    MI=P_ij(1,n,rows(MI))*MI;
  endif
  if(n!=0)
    MI=eliminate_col(MI,j);
    MO=MI;
    N=MI;
    N=MI(2:rows(MI),j+1:columns(MI));
  endif
 endfunction

function E=gauss3(MI)
  N=MI;
  B=MI;
  E=zeros(size(MI));
  while columns(N)>0
    [N,B]=gauss2(N);
    E=E+extend_NtoB((B-extend_NtoB(N,B)),MI);
  endwhile
endfunction

function K=extend_NtoB(N,B)
  K=[zeros(rows(B)-rows(N),columns(B));[zeros(rows(N),columns(B)-columns(N)),N]];
endfunction
