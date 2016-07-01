1;

function w=check_column_empty(MI,j)
  w=ones(1,rows(MI))*MI(1:rows(MI),j)==0;
endfunction

function i=find_first_not_0(MI,j,cr)
  found=false;
  for i=cr:rows(MI)
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

function  j=find_first_column_not_empty(MI,cc)
  found=false;
  for j=cc:columns(MI)
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

function M=eliminate_col(MI,j,cr)
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

function N=gauss2(MI,cr,cc)
  j=find_first_column_not_empty(MI,cc);
  n=find_first_not_0(MI,j,cr); 
  j,n
  if(n!=1)
    MI=P_ij(1,n,rows(MI))*MI
  endif
  MI=eliminate_col(MI,j,cr,cc);
  M=MI;
  N=M(2:rows(M),j+1:columns(M));
  
 endfunction

function N=gauss3(MI)
  
endfunction


