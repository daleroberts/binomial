% h payoff
%
% Dale Roberts <dale.o.roberts@gmail.com>
%
function ret = h(k, s, a)
	ret = max(k-s,0) + a;
	
