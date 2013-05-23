% Call option payoff
%
% Dale Roberts <dale.o.roberts@gmail.com>
%
function value = call(k,s)
    value = max(s - k, 0);
