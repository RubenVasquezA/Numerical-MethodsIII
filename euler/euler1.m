function[x y]=euler1(n,a,b,h)
%Resuelve el problema de paracaidista
format long
x=a:h:n*h;
y=zeros(n,1);
y(1)=b;
for k=1:n
    f=fe1(x(k),y(k));
    y(k+1)=y(k)+h*f;
end
plot(x,y)
grid 
xlabel('tiempo(s)');
ylabel('velocidad(m/s)');