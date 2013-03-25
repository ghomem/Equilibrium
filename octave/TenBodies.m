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
saveplots = 1;

% individual spending tendency

Ci = [ 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 ];

% actual spending tendency

ACi = Ci * confidence;

% initial condition

V0=[ 10, 10, 10, 10, 10, 10, 10, 10, 10, 10 ];

% several matrix possibilities
% mutual simpathies: we must have Cii = 0

% null matrix - no sympathies

S0 = [  0, 0, 0, 0, 0, 0, 0, 0, 0, 0  ;
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0  ;
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0  ;
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0  ;
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0  ;
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0  ;
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0  ;
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0  ;
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0  ;
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];

% uniform matrix with unitary sympathy

S1 = [  0, 1, 1, 1, 1, 1, 1, 1, 1, 1  ;
	1, 0, 1, 1, 1, 1, 1, 1, 1, 1  ;
	1, 1, 0, 1, 1, 1, 1, 1, 1, 1  ;
	1, 1, 1, 0, 1, 1, 1, 1, 1, 1  ;
	1, 1, 1, 1, 0, 1, 1, 1, 1, 1  ;
	1, 1, 1, 1, 1, 0, 1, 1, 1, 1  ;
	1, 1, 1, 1, 1, 1, 0, 1, 1, 1  ;
	1, 1, 1, 1, 1, 1, 1, 0, 1, 1  ;
	1, 1, 1, 1, 1, 1, 1, 1, 0, 1  ;
	1, 1, 1, 1, 1, 1, 1, 1, 1, 0 ];

% sympathies defined by player

S2  = [ 0,   0.11, 0.12, 0.9, 1, 0.8, 0.09, 0.2, 0.22, 0.1 ; 
	0.1, 0,    0.12, 0.9, 1, 0.8, 0.09, 0.2, 0.22, 0.1 ; 
	0.1, 0.11, 0,    0.9, 1, 0.8, 0.09, 0.2, 0.22, 0.1 ; 
	0.1, 0.11, 0.12, 0,   1, 0.8, 0.09, 0.2, 0.22, 0.1 ; 
	0.1, 0.11, 0.12, 0.9, 0, 0.8, 0.09, 0.2, 0.22, 0.1 ; 
	0.1, 0.11, 0.12, 0.9, 1, 0  , 0.09, 0.2, 0.22, 0.1 ; 
	0.1, 0.11, 0.12, 0.9, 1, 0.8, 0   , 0.2, 0.22, 0.1 ; 
	0.1, 0.11, 0.12, 0.9, 1, 0.8, 0.09, 0  , 0.22, 0.1 ; 
	0.1, 0.11, 0.12, 0.9, 1, 0.8, 0.09, 0.2, 0,    0.1 ; 
	0.1, 0.11, 0.12, 0.9, 1, 0.8, 0.09, 0.2, 0.22, 0  ];

% sympathies defined by player with "perturbations"

S3  = [ 0,    0.07, 0.12, 0.9, 1, 0.8, 0.09, 0.2,   0.11, 0.18 ; 
	0.11, 0,    0.17, 0.9, 1, 0.8, 0.09, 0.2,   0.12, 0.11 ; 
	0.1,  0.09, 0,    0.9, 1, 0.8, 0.09, 0.22,  0.26, 0.15 ; 
	0.09, 0.11, 0.08, 0,   1, 0.8, 0.09, 0.2,   0.15, 0.05 ; 
	0.1,  0.11, 0.02, 0.9, 0, 0.8, 0.09, 0.3,   0.25, 0.03 ; 
	0.12, 0.13, 0.11, 0.9, 1, 0  , 0.09, 0.2,   0.22, 0.14 ; 
	0.13, 0.11, 0.12, 0.9, 1, 0.8, 0   , 0.28,  0.17, 0.07 ; 
	0.14, 0.2 , 0.12, 0.9, 1, 0.8, 0.09, 0  ,   0.32, 0.1  ; 
	0.08, 0.11, 0.13, 0.9, 1, 0.8, 0.09, 0.1,   0,    0.1  ; 
	0.1,  0.14, 0.12, 0.9, 1, 0.8, 0.09, 0.05,  0.22, 0   ];

% sympathies defined by player with "perturbations" and higher values

S4  = [ 0,    0.57, 0.12, 0.9, 1, 0.8, 0.09, 0.2,   0.11, 0.18 ; 
	0.71, 0,    0.17, 0.9, 1, 0.8, 0.09, 0.2,   0.12, 0.11 ; 
	0.1,  0.09, 0,    0.9, 1, 0.8, 0.09, 0.22,  0.26, 0.15 ; 
	0.69, 0.11, 0.08, 0,   1, 0.8, 0.09, 0.2,   0.15, 0.05 ; 
	0.1,  0.81, 0.02, 0.9, 0, 0.8, 0.09, 0.3,   0.25, 0.03 ; 
	0.52, 0.63, 0.41, 0.9, 1, 0  , 0.09, 0.2,   0.22, 0.14 ; 
	0.13, 0.41, 0.12, 0.9, 1, 0.8, 0   , 0.28,  0.17, 0.07 ; 
	0.84, 0.2 , 0.62, 0.9, 1, 0.8, 0.09, 0  ,   0.32, 0.1  ; 
	0.08, 0.71, 0.83, 0.9, 1, 0.8, 0.09, 0.1,   0,    0.1  ; 
	0.1,  0.54, 0.92, 0.9, 1, 0.8, 0.09, 0.85,  0.22, 0   ];

% sympathies defined by player with "perturbations" , even higher values and less unanimousity

S5  = [ 0,    0.57, 0.12, 0.9, 1, 0.8, 0.39, 0.2,   0.41, 0.98 ; 
	0.71, 0,    0.17, 0.4, 1, 0.2, 0.69, 0.7,   0.82, 0.81 ; 
	0.1,  0.09, 0,    0.9, 1, 0.9, 0.08, 0.62,  0.26, 0.75 ; 
	0.69, 0.11, 0.08, 0,   1, 0.1, 0.09, 0.5,   0.55, 0.55 ; 
	0.1,  0.81, 0.02, 0.2, 0, 0.7, 0.09, 0.6,   0.25, 0.63 ; 
	0.52, 0.63, 0.41, 0.9, 1, 0  , 0.09, 0.2,   0.62, 0.84 ; 
	0.13, 0.41, 0.12, 0.9, 1, 0.7, 0   , 0.88,  0.77, 0.97 ; 
	0.84, 0.2 , 0.62, 0.3, 1, 0.8, 0.99, 0  ,   0.32, 0.81 ; 
	0.08, 0.71, 0.83, 0.9, 1, 0.1, 0.99, 0.1,   0,    0.71 ; 
	0.1,  0.54, 0.92, 0.1, 1, 0.6, 0.09, 0.85,  0.22, 0   ];

% variation of S5 trying to maximize oscilations

S5b  = [ 0,    0.57, 0.12, 0.9, 1, 0.89, 0.39, 0.2,   0.41, 0.98 ; 
	0.71, 0,    0.17, 0.4, 1, 0.01, 0.69, 0.7,   0.82, 0.81 ; 
	0.1,  0.09, 0,    0.9, 1, 0.99, 0.08, 0.62,  0.26, 0.75 ; 
	0.69, 0.11, 0.08, 0,   1, 0.05, 0.09, 0.5,   0.55, 0.55 ; 
	0.1,  0.81, 0.02, 0.2, 0, 0.7, 0.09, 0.6,   0.25, 0.63 ; 
	0.52, 0.63, 0.41, 0.9, 1, 0  , 0.09, 0.2,   0.99, 0.99 ; 
	0.13, 0.41, 0.12, 0.9, 1, 0.99, 0   , 0.88,  0.77, 0.97 ; 
	0.84, 0.2 , 0.62, 0.3, 1, 0.99, 0.99, 0  ,   0.32, 0.81 ; 
	0.08, 0.71, 0.83, 0.9, 1, 0, 0.99, 0.1,   0,    0.71 ; 
	0.1,  0.54, 0.92, 0.1, 1, 0, 0.09, 0.85,  0.22, 0   ];

% test case for 2 distinct social classes

low=0.1;
med=0.2;
high=1;

S6 = [  0,    high, low, low, low, low, low, low, low, low  ;
	high, 0   , low, low, low, low, low, low, low, low  ;
	high, high, 0  , med, med, med, med, med, med, med  ;
	high, high, med, 0  , med, med, med, med, med, med  ;
	high, high, med, med, 0  , med, med, med, med, med  ;
	high, high, med, med, med, 0  , med, med, med, med  ;
	high, high, med, med, med, med, 0  , med, med, med  ;
	high, high, med, med, med, med, med, 0  , med, med  ;
	high, high, med, med, med, med, med, med, 0  , med  ;
	high, high, med, med, med, med, med, med, med, 0   ];

totalS6=(9*2)*high + (8*2)*low + (7*8)*med;

% test case for 2 distinct social classes - variation with the same total simpathy

low=0.15;
med=0.2;
high=0.955556;

S7 = [  0,    high, low, low, low, low, low, low, low, low  ;
	high, 0   , low, low, low, low, low, low, low, low  ;
	high, high, 0  , med, med, med, med, med, med, med  ;
	high, high, med, 0  , med, med, med, med, med, med  ;
	high, high, med, med, 0  , med, med, med, med, med  ;
	high, high, med, med, med, 0  , med, med, med, med  ;
	high, high, med, med, med, med, 0  , med, med, med  ;
	high, high, med, med, med, med, med, 0  , med, med  ;
	high, high, med, med, med, med, med, med, 0  , med  ;
	high, high, med, med, med, med, med, med, med, 0   ];

totalS7=(9*2)*high + (8*2)*low + (7*8)*med;

% test case for 2 distinct social classes + isolated simpathy increase for a player of one class
% we are insterested in how the same increase leads to different GDP variations, depending on the social class 

low=0.1;
med=0.2;
high=0.8;
delta1=0.0;
delta2=0.2;

S8 = [  0,           high, low, low, low, low, low, low, low, low+delta2  ;
        high+delta1, 0   , low, low, low, low, low, low, low, low+delta2  ;
        high+delta1, high, 0  , med, med, med, med, med, med, med+delta2  ;
        high+delta1, high, med, 0  , med, med, med, med, med, med+delta2  ;
        high+delta1, high, med, med, 0  , med, med, med, med, med+delta2  ;
        high+delta1, high, med, med, med, 0  , med, med, med, med+delta2  ;
        high+delta1, high, med, med, med, med, 0  , med, med, med+delta2  ;
        high+delta1, high, med, med, med, med, med, 0  , med, med+delta2  ;
        high+delta1, high, med, med, med, med, med, med, 0  , med+delta2  ;
        high+delta1, high, med, med, med, med, med, med, med, 0          ];

totalS8=(9*2)*high + (8*2)*low + (7*8)*med;

% assymetric popularity rank - the winner takes it all
% player 1 is the most popular, player 2 the second most popular, and so on...

S9 = [  0, 0, 0, 0, 0, 0, 0, 0, 0, 0  ;
	1, 0, 0, 0, 0, 0, 0, 0, 0, 0  ;
	1, 1, 0, 0, 0, 0, 0, 0, 0, 0  ;
	1, 1, 1, 0, 0, 0, 0, 0, 0, 0  ;
	1, 1, 1, 1, 0, 0, 0, 0, 0, 0  ;
	1, 1, 1, 1, 1, 0, 0, 0, 0, 0  ;
	1, 1, 1, 1, 1, 1, 0, 0, 0, 0  ;
	1, 1, 1, 1, 1, 1, 1, 0, 0, 0  ;
	1, 1, 1, 1, 1, 1, 1, 1, 0, 0  ;
	1, 1, 1, 1, 1, 1, 1, 1, 1, 0 ];

% assymetric popularity - less extreme

low=0.1;
high=1;
% increasing this simpathy will decrease the equilibrium GDP (counter example!)
delta=0.0;

S9b = [  0   ,        low , low, low, low,    low, low,  low,   low, low ;
         high,        0   , low, low, low,    low, low,  low,   low, low ;
         high,        high, 0  , low, low,    low, low,  low,   low, low ;
         high,        high, high, 0  , low,   low, low,  low,   low, low ;
         high,        high, high, high, 0 ,   low, low,  low,   low, low ;
         high,        high, high, high, high, 0 ,   low,  low,  low, low ;
         high,        high, high, high, high, high, 0  ,  low,  low, low ;
         high,        high, high, high, high, high, high, 0,    low, low ;
         high,        high, high, high, high, high, high, high, 0  , low ;
         high+delta , high, high, high, high, high, high, high, high, 0  ];

% assymetric popularity 
% the second most popular player stops sharing so much (see delta) with the top contender...
% ... and shares a little bit (see delta2) with a subset of the remaining ones

% with delta=1 and delta2=0 player2 becomes as important as player1: they both share all the money
% with delta2 !=0 player2 becomes a money re-distributor

low=0;
high=1;
delta=0.85;
delta2=0.2;

S9c = [  0         , low , low , low       , low,  low       , low,  low, low, low  ;
         high-delta, 0   , low , low+delta2, low,  low+delta2, low,  low, low, low  ;
         high      , high, 0   , low       , low,  low       , low,  low, low, low  ;
         high      , high, high, 0         , low,  low       , low,  low, low, low  ;
         high      , high, high, high      , 0   , low       , low,  low, low, low  ;
         high      , high, high, high      , high, 0         , low,  low, low, low  ;
         high      , high, high, high      , high, high      , 0  ,  low, low, low  ;
         high      , high, high, high      , high, high      , high, 0,   low, low  ;
         high      , high, high, high      , high, high      , high, high,0  , low ;
         high      , high, high, high      , high, high      , high, high, high,0  ];

% just a crazy daisy-chain setup
% limit is the last player, that reconnects to the first one
%
% uncoment interval to override the default
% interval=40

high=1;
low=0.2;
limit=0.6;

S10 = [  0,     high, 0,    0,   0,    0,   0,   0,   0,   0  ;
    	 0,     0,    low,  0,   0,    0,   0,   0,   0,   0  ;
	 0,     0,    0,    low, 0,    0,   0,   0,   0,   0  ;
	 0,     0,    0,    0,   low,  0,   0,   0,   0,   0  ;
	 0,     0,    0,    0,   0,    low, 0,   0,   0,   0  ;
	 0,     0,    0,    0,   0,    0,   low, 0,   0,   0  ;
	 0,     0,    0,    0,   0,    0,   0,   low, 0,   0  ;
	 0,     0,    0,    0,   0,    0,   0,   0,   low, 0  ;
	 0,     0,    0,    0,   0,    0,   0,   0,   0,   low  ;
         limit, 0,    0,    0,   0,    0,   0,   0,   0,   0  ];

% desired good monopoly (1 owner, 3 workers, 7 "others")

high=0.85;
% owner -> worker
low1=0.2;
% owner -> other
low2=0.3;
% worker -> owner
med1=0.4;
% worker -> other
med2=0.5;
% other -> other
med3=0.4;

% workers are full time employees
% worker -> worker = 0
% other  -> worker = 0


S11= [  0,    low1, low1, low1, low2,    low2, low2, low2, low2, low2  ;
	med1, 0,    0,    0,    med2,    med2, med2, med2, med2, med2  ;
	med1, 0,    0,    0,    med2,    med2, med2, med2, med2, med2  ;
	med1, 0,    0,    0,    med2,    med2, med2, med2, med2, med2  ;
	high, 0,    0,    0,    0,       med3, med3, med3, med3, med3  ;
	high, 0,    0,    0,    med3,    0,    med3, med3, med3, med3  ;
	high, 0,    0,    0,    med3,    med3, 0,    med3, med3, med3  ;
	high, 0,    0,    0,    med3,    med3, med3, 0,    med3, med3  ;
	high, 0,    0,    0,    med3,    med3, med3, med3, 0,    med3  ;
	high, 0,    0,    0,    med3,    med3, med3, med3, med3, 0     ];

% several awareness matrix possibilities

% no awareness

A0 = [  0, 0, 0, 0, 0, 0, 0, 0, 0, 0  ;
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0  ;
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0  ;
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0  ;
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0  ;
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0  ;
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0  ;
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0  ;
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0  ;
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];

% full awareness

A1 = [  0, 1, 1, 1, 1, 1, 1, 1, 1, 1  ;
	1, 0, 1, 1, 1, 1, 1, 1, 1, 1  ;
	1, 1, 0, 1, 1, 1, 1, 1, 1, 1  ;
	1, 1, 1, 0, 1, 1, 1, 1, 1, 1  ;
	1, 1, 1, 1, 0, 1, 1, 1, 1, 1  ;
	1, 1, 1, 1, 1, 0, 1, 1, 1, 1  ;
	1, 1, 1, 1, 1, 1, 0, 1, 1, 1  ;
	1, 1, 1, 1, 1, 1, 1, 0, 1, 1  ;
	1, 1, 1, 1, 1, 1, 1, 1, 0, 1  ;
	1, 1, 1, 1, 1, 1, 1, 1, 1, 0 ];

% **** Main script ****

% choose the simpathy and awareness matrices for this simulation

Sij = S9b;
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
V=lsode("deq",V0,t); % ODE solver - obtains the saved value function V, uses matrix C (global var)

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

% we can now calculate the total GDP

G = zeros(nrpoints,1);

for h=1:nrpoints
  sum = 0; 
  for i=1:Sysdim
    for j=1:Sysdim
      sum = sum + C(i,j)*V(h,i); %outward flow - expenditure PoV
    endfor
  endfor
  G(h) = sum;
endfor

% plot total GDP , configure y axis for better appearance

figure(3);
plot(t, G);
title("Total GDP");
mylimit = G(1) + 5*ymargin;
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
