function Rungekuttaorden2(f,h,x0,y0,r0,n)
fprintf('\n \tRESOLUCION DE ECUACIONES DIFERENCIALES POR MEDIO RUNGE KUTA\n');
f=input('Ingrese la primera funcion ','s');
f=inline(f,'t','y','u');
x0=input('\n Ingrese la condicion inicial x0:\n');
y0=input('\n Ingrese la condicion inicial y0:\n');
r0=input('\n Ingrese la condicion inicial r0:\n');
n=input('\n Ingrese el numero de pasos n:\n');
h=input('\n Ingrese h:\n');
A=[];
B=[];
C=[];
U0=y0;
R0=r0;
for i=0:n
    M1=R0;
    K1=feval(f,x0,U0,R0);
    M2=R0+0.5*h*K1;
    K2=feval(f,x0+0.5*h,U0+0.5*h*M1,R0+0.5*h*K1);
    M3=R0+0.5*h*K2;
    K3=feval(f,x0+0.5*h,U0+0.5*h*M2,R0+0.5*h*K2);
    M4=R0+0.5*h*K3;
    K4=feval(f,x0+h,U0+h*M3,R0+h*K3);
    U=U0+(h*(M1+2*M2+2*M3+M4))/6;
    R=R0+(h*(K1+2*K2+2*K3+K4))/6;
    x=x0+h;
    A=[A,x0];
    x0=x;
    B=[B,U0];
    C=[C,R0];
    U0=U;
    R0=R;
end
W=[A' B' C']
plot(A,B,':rh')
xlabel('\fontname{LCD}\it\bf Eje Abcisas','fontsize',15)
ylabel('\fontname{LCD}\it\bf Eje Ordenadas','fontsize',15)
title('\fontname{LCD} GRAFICA DE LA SOLUCIONES DE ECUACIONES DIFERENCIALES','fontsize',15)
grid on 