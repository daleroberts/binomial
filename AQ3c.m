d = 0.9;
u = 1.1;
r = 0.05;
S = 25;
T = 12;
K = 25;

p = ((1+r) - d) / (u - d);

V = zeros(T+1,T+1);
s = zeros(T+1,T+1);

for i=1:T+1
	s(i,T+1) = S*u^(T+1-i) * d^(i-1);
	V(i,T+1) = put(K,s(i,T+1));
end

Et = zeros(T,T);
for i=1:T
	Et(i,T) = 1;
end

for t=T:-1:0
	for i=1:t
		s(i,t) = S * u^(t-i) * d^(i-1);
		E = put(K, s(i,t));
		P = (p * V(i,t+1) + (1-p) * V(i+1,t+1)) / (1+r);
		if (E > P)
			Et(i,t) = 1;
		endif
		V(i,t) = max(E,P);
	end
end