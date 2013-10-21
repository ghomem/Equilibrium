% Equilibrium of simpathies
%
% numerical solution of ODE system for the 10 body problem in Economics.

clear all;

% parameters

global Sysdim=10;
global C;
interval = 3;  % time interval
nrpoints= floor(interval)*100;  % step for ODE solving, 100 pts per time units seems enough
confidence = 1; % affects both time to equilibrium and GDP value
ymargin = 10; % just a visual margin for plots
mfactor = 0.05; % proportional adjustement for ymargin
saveplots = 1;


% individual spending tendency

Ci = [ 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 ];

% actual spending tendency

ACi = Ci * confidence;

% *** tax related parameters ***

% seems that k and epsilon are reserved words...
kk=2;
global alpha=0.4;

% a simple test function for work retraction
global eps=(1-alpha) ** kk;

% several political simpathy sets

pS0= [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
pS1= [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ];
pS3= [ 0, 0, 0, 0, 1, 1, 0, 0, 0, 0 ];
pS4= [ 0, 0, 0, 0.3, 0.8, 0.5, 0.5, 0.3, 0, 0 ];

global pSimp = pS4;

% *** end of tax related parameters ***

% initial condition

% model where the State taxes the initial amount according to the tax rate alpha 

Multiplier = 1;
Vbase = 10;
Vpriv = 10*(1-alpha);
Vstate = Multiplier*Vbase*alpha*Sysdim;

V0=[ Vpriv, Vpriv, Vpriv, Vpriv, Vpriv, Vpriv, Vpriv, Vpriv, Vpriv, Vpriv, Vstate ];

%V0 = [ 10 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 100 ];

% load definitions from a separate file

source("input.m");

% **** Main script ****

% choose the simpathy and awareness matrices for this simulation

Sij = S5b;
Aij = A1;

% initialize Cij

for i=1:Sysdim
  for j=1:Sysdim
    C(i,j) = ACi(i) * Sij(i,j) * Aij(i,j);
  endfor
endfor

% compute matrix M and its eigenvalues
% note - the matrix is not used for the ODE solving as we are using the scalar equations for xdot on the deq function

D=zeros(Sysdim,1);
for i=1:Sysdim
  for j=1:Sysdim
    D(i) = D(i) + C(i,j);
  endfor
endfor

for i=1:Sysdim
  for j=1:Sysdim
    if j != i
      M(i,j) = C(j,i);
    else
      M(i,j) = -D(i);
    endif
  endfor
endfor

%disp(M);

% the eigenvalues must be zero and a set of numbers with negative real part; zero may appear as a very small number in some cases

disp("Eigenvalues: ");
eig(M)

t=linspace(0,interval,nrpoints); % time frames
% this sdeq function includes the State
V=lsode("sdeq",V0,t); % ODE solver - obtains the saved value function V, uses matrix C (global var)

% plot values, configure y axis for better appearance

figure(1);
plot(t, V(:,1), t, V(:,2), t, V(:,3), t, V(:,4),t, V(:,5),t, V(:,6),t, V(:,7),t, V(:,8),t, V(:,9),t, V(:,10) );
title("Wealth acumulation");
mylimit = max ( [ V(nrpoints,1) V(nrpoints,2) V(nrpoints,3) V(nrpoints,4) V(nrpoints,5) V(nrpoints,6) V(nrpoints,7) V(nrpoints,8) V(nrpoints,9) V(nrpoints,10) ] ) + ymargin;
ylim([ 0 mylimit ]);

% save the plot to a file
if saveplots == 1
  print("output/wealth-plot.png","-dpng");
endif

% state value
figure(2);
plot(t, V(:,Sysdim+1));
title("State saving");
MM=max (V(:,Sysdim+1));
mylimit = MM + mfactor*(ymargin*MM);
ylim([ 0 mylimit ]);

% save the plot to a file
if saveplots == 1
  print("output/state-plot.png","-dpng");
endif

% we can now calculate the total GDP

G = zeros(nrpoints,1);

for h=1:nrpoints
  sum = 0;
  for i=1:Sysdim
    for j=1:Sysdim
      sum = sum + C(i,j)*V(h,i); %outward flow - expenditure PoV
    endfor
    sum = sum + pSimp(i)*(Sysdim+1); % investment from the State on player i
  endfor
  G(h) = sum;
endfor

% plot total GDP , configure y axis for better appearance

figure(3);
plot(t, G);
title("Total GDP");
MM=max (G);
mylimit = MM + mfactor*(ymargin*MM);
ylim([ 0 mylimit ]);

% save the plot to a file
if saveplots == 1
  print("output/GDP-plot.png","-dpng");
endif

% calculate total simpathy

TS=0;

for i=1:Sysdim
  for j=1:Sysdim
    TS = TS + Sij(i,j); 
  endfor
endfor

disp("Total simpathy: "), disp(TS);
disp("Total GDP: "), disp(G(nrpoints));
disp("GDP per capita: "), disp(G(nrpoints)/Sysdim);
disp("State savings: "), disp(V(nrpoints,Sysdim+1));

% calculate Gini coefficient for the Vis

aux = zeros(Sysdim,1);
% V is tranposed with symbol '
GC = ginicoeff(V(nrpoints,:)',1,false);
disp("Gini coefficient: "), disp(GC);

% gini function validation

%test1 = [ 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 ];
%test2 = [ 1 , 1 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ];
%GC = ginicoeff(test1,1,false)
%GC = ginicoeff(test2,1,false)
