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
	2, 0, 1, 1, 1, 1, 1, 1, 1, 1  ;
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
	0.71, 0,    0.17, 0.4, 1, 0.01,  0.69, 0.7,   0.82, 0.81 ;
	0.1,  0.09, 0,    0.9, 1, 0.99,  0.08, 0.62,  0.26, 0.75 ;
	0.69, 0.11, 0.08, 0,   1, 0.05,  0.09, 0.5,   0.55, 0.55 ;
	0.1,  0.81, 0.02, 0.2, 0, 0.7,   0.09, 0.6,   0.25, 0.63 ;
	0.52, 0.63, 0.41, 0.9, 1, 0  ,   0.09, 0.2,   0.99, 0.99 ;
	0.13, 0.41, 0.12, 0.9, 1, 0.99,  0   , 0.88,  0.77, 0.97 ;
	0.84, 0.2 , 0.62, 0.3, 1, 0.99,  0.99, 0  ,   0.32, 0.81 ;
	0.08, 0.71, 0.83, 0.9, 1, 0,     0.99, 0.1,   0,    0.71 ;
	0.1,  0.54, 0.92, 0.1, 1, 0,     0.09, 0.85,  0.22, 0   ];

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
