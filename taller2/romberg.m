%integral de romberg
function I=romberg(h)
f=inline(h,'x');
for n=1:6;
    x=linspace(0,pi/2,2^(n-1)+1);
    s=0;
    for i=1:2^(n-1),
        r=trapecio(h,x(i),x(i+1));
        s=s+r;
    end
    I(n,1)=s;
end
for k=2:6
    for j=k:6
        I(j,k)=(4^(k-1)*I(j,k-1)-I(j-1,k-1))/(4^(k-1)-1);
    end
end
