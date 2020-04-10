function Rungekutta2(f,h,x0,n)
fprintf('\n \tRESOLUCION ECUACIONES DIFERENCIALES POR MEDIO RUNGE KUTA\n');
f=input('Ingrese dx/dt= ','s');
f=inline(f,'t','x');
x0=input('\n Ingrese la condicion inicial x(0):\n');

n=input('\n Ingrese el numero de pasos n:\n');
h=input('\n Ingrese h:\n');
A=[];
B=[];
C=[];
T0=0;
U0=x0;

for i=0:n
    M1=feval(f,T0,U0);
    M2=feval(f,T0+0.5*h,U0+0.5*h*M1);
    M3=feval(f,T0+0.5*h,U0+0.5*h*M2);
    M4=feval(f,T0+h,U0+h*M3);
    U=U0+(h*(M1+2*M2+2*M3+M4))/6;
    T=T0+h;
    A=[A,T0];
    T0=T;
    B=[B,U0];
    U0=U;
    
end
W=[A' B']
plot(A,B,':rh')
xlabel('\fontname{LCD}\it\bf t','fontsize',15)
ylabel('\fontname{LCD}\it\bf x(t)','fontsize',15)
title('\fontname{LCD} GRAFICA DE LA SOLUCIONES DIFERENCIALES','fontsize',15)
grid on 
