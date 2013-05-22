u = 1.2;
d = 1/u;
r = 0:0.01:0.2;
v = ones(1,length(r));
for i = 1:length(r)
	v(i) = europut(1.2, 1/1.2, r(i), 1.0, 1.0, 1.1);
endfor

plot(r,v);

%xlabel("r");
%drawnow("latex", "WQ3.tex");