u = 1.2
%d = 0.9
d = 1/u
r = 0.1
T = 1

%K = (u^T + d^T)/2
K = 1

p = (1 + r - d) / (u - d);

for i=0:T
	S = u^i * d^(T-i);
	V(i+1) = max((K-S), 0);
end

for t=T-1:-1:0
	for i=0:t
		V(i+1) = (p * V(i+2) + (1-p) * V(i+1)) / (1+r);
	end
end

euro = V(1)
