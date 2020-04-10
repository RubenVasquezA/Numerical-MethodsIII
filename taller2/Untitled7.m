f=inline('0.2*x*y','x','y');
x(1)=1
y(1)=1
xx=1.5;
h=0.1;
for n=1:5
    y(n+1)=y(n)+0.1*f(x(n),y(n));
    x(n+1)=x(n)+h;
end
xx=linspace(1,1.5,50);
yy=exp(0.1*(xx.^2-1));
plot(xx,yy,'b',x,y,'r');
legend('solucion exacta','solucion aproximada h=0.1',...
    'localizacion','northwest');
res=y'