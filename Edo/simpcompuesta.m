function simpcompuesta(a,b,n,p)
f=inline(p,'x')
h=(b-a)/n;
XI0=f(a)+f(b)
X10=0;
X20=0;
for i=1:n-1
    X=a+i*h;
    if mod(i,2)==0
        X20=X20+f(X);
    else
        X10=X10+f(X);
    end
end
XI=h*(XI0+2*X20+4*X10)/3;
XI
