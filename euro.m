% Use this function like this in command prompt:
%   euro(1.2,0.9,0.1,1,1,3,@put)
%   euro(1.2,0.9,0.1,1,1,3,@call)
%   euro(1.2,0.9,0.1,1,1,3,@twoput)
%
% where @put means 'address of function put'
%
function value = euro(u,d,r,K,S,T,payoff)
    p = (1 + r - d) / (u - d);

    V = zeros(T+1,T+1);
    s = zeros(T+1,T+1);

    for i=0:T
        s(i+1,T+1) = S * u^(T-i) * d^i;
        V(i+1,T+1) = feval(payoff,K,s(i+1,T+1)); %% feval: evaluate function 'payoff' with parameters K and s(i+1, T+1)
    end

    for t=T:-1:1
        for i=1:t
            s(i,t) = S * u^(t-i) * d^(i-1);
            V(i,t) = (p * V(i,t+1) + (1-p)* V(i+1,t+1))/(1+r);
        end
    end

    value = V(1,1);
