function Rungekutta4(a,b,n,g,w0)
%%datos de entrada: a=limite inferior del intervalo;
%%b=limite superior; n=numero de pasos;
%%g=la funcion a ingresar; w0=punto incial; 
%%w0=condicion inicial;
syms t 
W=[];T=[];Y=[]; A=[];   
f=inline(g,'t','y');   
y(t)=dsolve('Dy=y*(2.128-0.043*y)','y(0)=0.24') 
t1=a;           
h=(b-a)/n; 
w=w0;
fprintf(' \t\t      MÉTODO DE RUNGE KUTTA DE ORDEN 4\n\n');
fprintf('\t---------------------------------------------------\n');
fprintf('\t t(i)\t    y(ti)\t\t     w(ti) \t\t    error\t  \n');
fprintf('\t---------------------------------------------------\n');
for i=1:n+1 
    k1=h*f(t1,w);
    k2=h*f(t1+h/2,w+k1/2);
    k3=h*f(t1+h/2,w+k2/2);
    k4=h*f(t1+h,w+k3);
    s=double(subs(y,[t],[t1]));  %%lineas 12-25 
    W=[W,w];                     %%ejecucion programa
    T=[T t1];
    Y=[Y s];
    e=abs(s-w);
    fprintf('\t %3.1f\t   %3.7f\t    %3.7f\t   %3.7f\n',t1,s,w,e);
    w=w+(k1+2*k2+2*k3+k4)/6;
   t1=a+i*h;
end
tt=0:0.001:2;
yy=y(tt);       
yy';
plot(T',W','-ro') 
hold on
plot(tt',yy','b')
title('METODO DE RK4')
xlabel('t')
ylabel('y')
legend('aproximacion RK4','solcion general');


   
  