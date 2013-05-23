% American option pricing
%
% Dale Roberts <dale.o.roberts@gmail.com>

S = 60;
K = 65;
TTM = 0.25;
r = 0.08;
sigma = 0.30;
n = 1000;

dt = TTM/n;

u = exp(sigma*sqrt(dt));
d = 1/u;

p = (exp(r*dt) - d) / (u - d);

V = zeros(n+1,n+1);
s = zeros(n+1,n+1);

for i=1:n+1
	s(i,n+1) = S*u^(n+1-i) * d^(i-1);
	V(i,n+1) = call(K,s(i,n+1));
end

for t=n:-1:0
	for i=1:t
		s(i,t) = S * u^(t-i) * d^(i-1);
		E = call(K, s(i,t));
		P = (p * V(i,t+1) + (1-p) * V(i+1,t+1)) / exp(r*dt);
		V(i,t) = max(E,P);
	end
end

price = V(1,1)
