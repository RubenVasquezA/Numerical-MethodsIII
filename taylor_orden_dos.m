function taylor_orden_dos
clc
format long
fprintf('\n')
fprintf(' \t\t\t    ------------------------------------\n')
fprintf(' \t\t\t      MÉTODO DE TAYLOR DE ORDEN DOS\n');
fprintf(' \t\t\t    ------------------------------------\n\n')
fun=input('ingrese la ecuacion  dy/dx: ','s');
fun1=input('ingrese la segunda derivada: ','s');
Xn=input('ingrese el valor al que se desea aproximar(Xn): ');
a=input('ingrese el valor inicial a: ');
b=input('ingrese el valor inicial b: ');
h=input('ingrese el valor de h : ');
fprintf('\n');
t=inline(fun,'x','y');
t1=inline(fun1,'x','y');
n=(Xn-a)/h;
x=a:h:a+(n*h);
y=zeros(n,1);
y(1)=b;
fprintf('\t n\t    Xn        \t  y(Xn)\n');
fprintf('\t----------------------------------\n');
fprintf('\t 0\t   0.0    \t%12.15f\n',y(1));
    for k=1:n
        y1=t(x(k),y(k));
        y2=t1(x(k),y(k));
        y(k+1)=y(k)+h*(y1+(h/2)*(y2));
          fprintf('\t %d\t   %3.3f   \t%12.15f\n',k,x(k+1),y(k+1));
    end
    fprintf('\n el valor aproximado de y(%d)=%12.15f\n',Xn,y(k+1));
    fprintf('\n');
  plot(x,y,'b')
 grid on
 xlabel('Eje de las Abscisas')
 ylabel('Eje de las Ordenadas') 
 set(gcf,'Color','w')
 title('MÉTODO DE TAYLOR ORDEN DOS')
end