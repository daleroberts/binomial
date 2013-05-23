% Question 2
%
% Dale Roberts <dale.o.roberts@gmail.com>
%
d = 1.2;
u = 1.4;
r = 0.3;

% Part (a) - European option

b = 1; % put=1 or call=-1
T = 2
K = (u^T + d^T)/2

p = (1 + r - d) / (u - d);

for i=0:T
	S = u^i * d^(T-i);
	V(i+1) = max(b*(K-S), 0);
end

for t=T-1:-1:0
	for i=0:t
		V(i+1) = (p * V(i+2) + (1-p) * V(i+1)) / (1+r);
	end
end

euro = V(1)

% Part (a) - American option

b = 1; % put=1 or call=-1
T = 2
K = (u^T + d^T)/2

p = (1 + r - d) / (u - d);

for i=0:T
	S = u^i * d^(T-i);
	V(i+1) = max(b*(K-S), 0);
end

optimal = T
for t=T-1:-1:0
	for i=0:t
		S = u^i * d^(T-i);
		X = max(b*(K-S), 0);
		P = (p * V(i+2) + (1-p) * V(i+1)) / (1+r);
		if X > P
			optimal=min(optimal, t);
		end
		V(i+1) = max(X, P);
	end
end

amer = V(1)

