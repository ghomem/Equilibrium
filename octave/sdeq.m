% definition of the ODE system for 10 bodies problem
function xdot=sdeq(x,t)

 global C;
 global Sysdim;
 global alpha;
 global eps;
 global pSimp;

 sum1=zeros(Sysdim+1,1);
 sum2=zeros(Sysdim+1,1);
 xdot=zeros(Sysdim+1,1);
 
  for i=1:Sysdim
    for j=1:Sysdim
     sum1(i) = sum1(i) + C(i,j)*x(i)*eps;
     sum2(i) = sum2(i) + C(j,i)*x(j)*eps*(1-alpha);
    endfor
    % investment from the State
    sum2(i) = sum2(i) + pSimp(i)*x(Sysdim+1);
    xdot(i) = -sum1(i) + sum2(i);
  endfor

  % separate equation for the State
  for i=1:Sysdim
    for j=1:Sysdim
      sum1(Sysdim+1) = sum1(Sysdim+1) + C(i,j)*x(i)*eps*alpha;
    endfor
    sum2(Sysdim+1) = sum2(Sysdim+1) + pSimp(i)*x(Sysdim+1);
  endfor
  xdot(Sysdim+1) = sum1(Sysdim+1) - sum2(Sysdim+1);

endfunction

