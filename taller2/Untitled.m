
x=linspace(0,1,11);
s=0;
for i=1:10
    r=trapecio('(x.^2).*(exp(-x.^2))',x(i),x(i+1));
    s=s+r;
end
I=s