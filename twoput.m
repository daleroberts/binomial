% 'Two Put' payoff
%
% Dale Roberts <dale.o.roberts@gmail.com>
%
function value = twoput(k,s)
    value = max(k-s,0) * 2;
