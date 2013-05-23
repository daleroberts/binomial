% European put price
%
% Dale Roberts <dale.o.roberts@gmail.com>
%
function ret = europut(u, d, r, T, S0, K)
p = (1 + r - d) / (u - d);
for i=0:T
	S = S0 * u^i * d^(T-i);
	V(i+1) = max((K-S), 0);
end
for t=T-1:-1:0
	for i=0:t
		V(i+1) = (p * V(i+2) + (1-p) * V(i+1)) / (1+r);
	end
end
ret = V(1);
