n=input('ingresa el orden de aproximacion : ');
f=inline('(x^2+x+1)*cos(x)');
x=linspace(0,pi/2,2^n+1);
s=0;
for i=1:2^n,
    r=(x(i+1)-x(i))*(f(x(i))+f(x(i+1)))/2;
    s=s+r;
end
s