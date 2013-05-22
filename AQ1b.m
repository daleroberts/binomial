d = 0.97;
u = 1.05;
r = 0.02;
S = 12;
T = 10;
K = 9;


[SP, BP] = eurorep(u,d,r,T,S,K,@call);

SP
BP
