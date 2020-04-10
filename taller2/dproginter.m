function[deri]=dproginter(ff,a,b,h)
x=a:h:b;
for i=1:length(x)
    y(i)=centrada(ff,x(i),h);
end
plot(x,y,'-r')
hold on 
x=linspace(a,b,200);
plot(x,-cos(x)-sin(x),'r')
plot(a,-cos(a)-sin(a),'or')
plot(b,-cos(b)-sin(b),'or')
legend('derivada aprox','soluciones exactas','borde');
hold off 
xlabel('eje x')
ylabel('eje y')
title('Grafica de la derivada de una funcion')

