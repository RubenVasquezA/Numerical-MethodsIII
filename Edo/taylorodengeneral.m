fprintf('\n\tSoluciones de EDO´S por medio de Taylor\n')
p=input('\nUsted desea trabajar con sistemas S=si; N=no: ');
bol=true;
while(p=='S' && bol==true)
  fprintf('\nUsted cuenta con los siguientes sistemas\n')
  fprintf('\n2=Taylor de orden dos\n')
  fprintf('\n3=Taylor de orden tres\n')
  fprintf('\n4=Taylor de orden cuatro\n')
  orden=input('\ningrese que orden desea <2,4>: ');
  switch orden
      case 2
          syms t
          f=input('ingrese f(t,y)= ');
          g=input('ingrese f´(t,y)= ');
          f1=inline(f,'t','y');
          f2=inline(g,'t','y');
          a=input('ingrese a= ');
          b=input('ingrese b= ');
          h=input('ingrese h= ');
          w0=input('ingrse w0= ');
          condicional=input('se conoce la solucion S=si; N=no: ');
          if(condicional=='S')
              k=input('ingrese por favor la solucion: ');
              y=inline(k,'t');
              t1=a;           
              n=(b-a)/h; 
              w=w0;
              s=y(t1)
              e=0;
              W=[];T=[];
              W=[W,w];                   %%ejecucion programa
              T=[T t1];
fprintf(' \t\t\tMÉTODO DE TAYLOR DE ORDEN 2\n\n');
fprintf('\t---------------------------------------------------\n');
fprintf('\t t(i)\t    y(ti)\t\t     w(ti) \t\t    error\t  \n');
fprintf('\t---------------------------------------------------\n');
fprintf('\t %3.1f\t   %3.7f\t    %3.7f\t   %3.7f\n',t1,s,w,e)
for i=1:n 
    
    w=w+h*f1(t1,w)+((h^2)/2)*f2(t1,w);
    t1=a+i*h;
    s=y(t1);  %%lineas 12-25 
    W=[W,w];                   %%ejecucion programa
    T=[T t1];
    e=abs(s-w);
    fprintf('\t %3.1f\t   %3.7f\t    %3.7f\t   %3.7f\n',t1,s,w,e)
end
plot(T',W','-r') 
hold on
ezplot(y,[a,b])
xlabel('t')
ylabel('y')
legend('SOL APROX','SOL EXACTA')

          
          else
              W=[];T=[];
              t1=a;
              n=(b-a)/h; 
              w=w0;
              W=[W,w];
              T=[T t1];
fprintf(' \t\t      MÉTODO DE TAYLOR DE ORDEN 2\n\n');
fprintf('\t------------------------\n');
fprintf('\t t(i)\t     w(ti) \t  \n');
fprintf('\t-------------------------\n');
 fprintf('\t %3.1f\t      %3.7f\n',t1,w)
for i=1:n
    w=w+h*f1(t1,w)+((h^2)/2)*f2(t1,w);
    t1=a+i*h;
    W=[W,w];                     %%ejecucion programa
    T=[T t1];
    fprintf('\t %3.1f\t      %3.7f\n',t1,w)
end
plot(T',W','-r')
xlabel('t')
ylabel('x1')
legend('SOL APROX x1')
          end
      case 3
          syms t
          f=input('ingrese f(t,y)= ');
          g=input('ingrese f´(t,y)= ');
          r=input('ingrese f´´(t,y)= ');
          f1=inline(f,'t','y');
          f2=inline(g,'t','y');
          f3=inline(r,'t','y')
          a=input('ingrese a= ');
          b=input('ingrese b= ');
          h=input('ingrese h= ');
          w0=input('ingrse w0= ');
          condicional=input('se conoce la solucion S=si; N=no: ');
          if(condicional=='S')
              k=input('ingrese por favor la solucion: ');
              y=inline(k,'t');
              t1=a;           
              n=(b-a)/h; 
              w=w0;
              s=y(t1)
              e=0;
              W=[];T=[];
               W=[W,w];                     %%ejecucion programa
    T=[T t1];
fprintf(' \t\t\tMÉTODO DE TAYLOR DE ORDEN 3\n\n');
fprintf('\t---------------------------------------------------\n');
fprintf('\t t(i)\t    y(ti)\t\t     w(ti) \t\t    error\t  \n');
fprintf('\t---------------------------------------------------\n');
fprintf('\t %3.1f\t   %3.7f\t    %3.7f\t   %3.7f\n',t1,s,w,e)
for i=1:n 
   
    w=w+h*f1(t1,w)+((h^2)/2)*f2(t1,w)+((h^3)/6)*f3(t1,w);
    t1=a+i*h;
     s=y(t1);  %%lineas 12-25 
    W=[W,w];                     %%ejecucion programa
    T=[T t1];
    e=abs(s-w);
    fprintf('\t %3.1f\t   %3.7f\t    %3.7f\t   %3.7f\n',t1,s,w,e)
end
plot(T',W','-r') 
hold on
ezplot(y,[a,b])
xlabel('t')
ylabel('y')
legend('SOL APROX','SOL EXACTA')

          
          else
              W=[];T=[];
              t1=a;
              n=(b-a)/h; 
              w=w0;
              W=[W,w];
              T=[T t1];
fprintf(' \t\t      MÉTODO DE TAYLOR DE ORDEN 3\n\n');
fprintf('\t------------------------\n');
fprintf('\t t(i)\t     w(ti) \t  \n');
fprintf('\t-------------------------\n');
 fprintf('\t %3.1f\t      %3.7f\n',t1,w)
for i=1:n
    w=w+h*f1(t1,w)+((h^2)/2)*f2(t1,w)+((h^3)/6)*f3(t1,w);
    t1=a+i*h;
    W=[W,w];                     %%ejecucion programa
    T=[T t1];
    fprintf('\t %3.1f\t      %3.7f\n',t1,w)
end
plot(T',W','-r')
xlabel('t')
ylabel('x1')
legend('SOL APROX x1')
          end
 
      case 4
               syms t
          f=input('ingrese f(t,y)= ');
          g=input('ingrese f´(t,y)= ');
          r=input('ingrese f´´(t,y)= ');
          q=input('ingrese f´´´(t,y)= ');
          f1=inline(f,'t','y');
          f2=inline(g,'t','y');
          f3=inline(r,'t','y');
          f4=inline(r,'t','y');
          a=input('ingrese a= ');
          b=input('ingrese b= ');
          h=input('ingrese h= ');
          w0=input('ingrse w0= ');
          condicional=input('se conoce la solucion S=si; N=no: ');
          if(condicional=='S')
              k=input('ingrese por favor la solucion: ');
              y=inline(k,'t');
              t1=a;           
              h=(b-a)/n; 
              w=w0;
              s=y(t1)
              e=0;
              W=[];T=[];
              W=[W,w];                     %%ejecucion programa
             T=[T t1];
fprintf(' \t\t\tMÉTODO DE TAYLOR DE ORDEN 4\n\n');
fprintf('\t---------------------------------------------------\n');
fprintf('\t t(i)\t    y(ti)\t\t     w(ti) \t\t    error\t  \n');
fprintf('\t---------------------------------------------------\n');
fprintf('\t %3.1f\t   %3.7f\t    %3.7f\t   %3.7f\n',t1,s,w,e)
for i=1:n 
   
    w=w+h*f1(t1,w)+((h^2)/2)*f2(t1,w)+((h^3)/6)*f3(t1,w)+((h^4)/24)*f4(t1,w);
    t1=a+i*h;
     s=y(t1);  %%lineas 12-25 
    W=[W,w];                     %%ejecucion programa
    T=[T t1];
    e=abs(s-w);
    fprintf('\t %3.1f\t   %3.7f\t    %3.7f\t   %3.7f\n',t1,s,w,e)
end
plot(T',W','-r') 
hold on
ezplot(y,[a,b])
xlabel('t')
ylabel('y')
legend('SOL APROX','SOL EXACTA')

          
          else
              W=[];T=[];
              t1=a;
              h=(b-a)/n; 
              w=w0;
              W=[W,w];
              T=[T t1];
fprintf(' \t\t      MÉTODO DE TAYLOR DE ORDEN 4\n\n');
fprintf('\t------------------------\n');
fprintf('\t t(i)\t     w(ti) \t  \n');
fprintf('\t-------------------------\n');
 fprintf('\t %3.1f\t      %3.7f\n',t1,w)
for i=1:n
     w=w+h*f1(t1,w)+((h^2)/2)*f2(t1,w)+((h^3)/6)*f3(t1,w)+((h^4)/24)*f4(t1,w);
    t1=a+i*h;
    W=[W,w];                     %%ejecucion programa
    T=[T t1];
    fprintf('\t %3.1f\t      %3.7f\n',t1,w)
end
plot(T',W','-r')
xlabel('t')
ylabel('x1')
legend('SOL APROX x1')
          end
  end
  p=input('\nUsted desea trabajar de nuevo con sistemas S=si; N=no: ');
end
  