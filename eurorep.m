function [SP, BP] = eurorep(u, d, r, T, S0, K, payoff)
	% Calculates replicating portfolio for a European-style
	% claim payoff.
	SP = zeros(T,T); % Stock portfolio
	BP = zeros(T,T); % Bond portfolio
	for t=T:-1:1
		for i=1:t
			S = S0 * u^(t-i) * d^(i-1);
			uP = feval(payoff, S*u, K);
			dP = feval(payoff, S*d, K);
			SP(i,t) = (uP - dP) / (S * (u - d));
			BP(i,t) = (u*dP - d*uP)/ ((1+r)*(u-d));
		end
	end