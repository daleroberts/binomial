d = 0.97;
u = 1.05;
r = 0.02;
S = 12;
T = 10;
K = 9;

for i = 1:8
	euro(u,d,r,T,S,K+i,@call)
end

