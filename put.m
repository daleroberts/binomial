% Put payoff
%
% Dale Roberts <dale.o.roberts@gmail.com>
%
function value = put(k,s)
    value = max(k - s, 0);
