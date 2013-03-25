% definition of the ODE system for 10 bodies problem
function xdot=deq(x,t)

 global C;
 global Sysdim;

 sum1=zeros(Sysdim,1);
 sum2=zeros(Sysdim,1);
 xdot=zeros(Sysdim,1);

  for i=1:Sysdim
    for j=1:Sysdim
     sum1(i) = sum1(i) + C(i,j)*x(i);
     sum2(i) = sum2(i) + C(j,i)*x(j);
    endfor
    xdot(i) = -sum1(i) + sum2(i);
  endfor

endfunction

