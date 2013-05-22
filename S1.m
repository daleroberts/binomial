u = 1.05;
d = 0.97;
r = 0.02;

K = 14;
S = 12;
T = 8;

SP = zeros(T,T); % Stock portfolio
BP = zeros(T,T); % Bond portfolio
s = zeros(T,T);

for t=T:-1:1
	for i=1:t
		s(i,t) = S * u^(t-i) * d^(i-1);
		uP = call(s(i,t)*u, K);
		dP = call(s(i,t)*d, K);
		SP(i,t) = (uP - dP) / (s(i,t) * (u - d));
		BP(i,t) = (u*dP - d*uP)/ ((1+r)*(u-d));
	end
end