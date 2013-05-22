u = 1.2
d = 0.9
r = 0.05

K = 1
S = 1
T = 7

p = (1 + r - d) / (u - d);

V = zeros(T+1,T+1);
s = zeros(T+1,T+1);

for i=0:T
    s(i+1,T+1) = S * u^(T-i) * d^i;
    V(i+1,T+1) = max(K-s(i+1,T+1),0);
end

for t=T:-1:1
    for i=1:t
        s(i,t) = S * u^(t-i) * d^(i-1);
        V(i,t) = (p * V(i,t+1) + (1-p)* V(i+1,t+1))/(1+r);
    end
end

value = V(1,1)

