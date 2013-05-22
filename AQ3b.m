d = 0.9;
u = 1.1;
r = 0.05;
S = 25;
T = 12;
a = 0.76;
K = 25.5;

p = ((1+r) - d) / (u - d);

V = zeros(T+1,T+1);
s = zeros(T+1,T+1);

for i=1:T+1
	s(i,T+1) = S*u^(T+1-i) * d^(i-1);
	V(i,T+1) = l(K,s(i,T+1));
end

Hs = zeros(T,T);
Ls = zeros(T,T);

for i=1:T
	Hs(i,T) = 1;
	Ls(i,T) = 1;
end

for t=T:-1:0
	for i=1:t
		s(i,t) = S * u^(t-i) * d^(i-1);
		L = l(K,s(i,t));
		H = h(K,s(i,t),a);
		P = (p * V(i,t+1) + (1-p) * V(i+1,t+1)) / (1+r);
		if (H < max(L,P))
			Hs(i,t) = 1;
		elseif (L > P)
			Ls(i,t) = 1;
		endif
		V(i,t) = min(H, max(L,P));
	end
end

value = V(1,1)
disp('Exercise tree:')
St = Hs | Ls
