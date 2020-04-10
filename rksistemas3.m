function rksistemas3(a,b,f,g,h,x10,x20,x30,n)
syms t
y(t)=dsolve('D2y =exp(2*t)*sin(t)+2*Dy-2*y','y(0)=-0.4','Dy(0)=-0.6')
f1=inline(f,'t','x1','x2','x3');
f2=inline(g,'t','x1','x2','x3');
f3=inline(h,'t','x1','x2','x3')
W=[];T=[];
h=(b-a)/n;
t1=a;
x1=x10;
x2=x20;
x3=x30;
s=double(subs(y,[t],[t1]));
e=abs(x1-s);
fprintf(' \t\t MÉTODO DE RUNGE KUTTA DE ORDEN 4 PARA SISTEMAS \n\n');
fprintf('\t------------------------------------------------------\n');
fprintf('\t t(i)\t  x1(ti)\t   x2(ti)\t  y(ti)\t\t   error\n');
fprintf('\t------------------------------------------------------\n');
fprintf('\t %3.2f\t %3.7f\t %3.7f\t %3.7f\t %3.7f\n',t1,x1,x2,x3,s,e)
for i=1:n
    k(1,1)=h*f1(t1,x1,x2,x3);
    k(1,2)=h*f2(t1,x1,x2,x3);
    k(1,3)=h*f3(t1,x1,x2,x3);
    k(2,1)=h*f1(t1+h/2,x1+(1/2)*k(1,1),x2+(1/2)*k(1,2),x3+(1/2)*k(1,2));
    k(2,2)=h*f2(t1+(h/2),x1+(1/2)*k(1,1),x2+(1/2)*k(1,2),x3+(1/2)*k(1,2));
    k(2,3)=h*f3(t1+(h/2),x1+(1/2)*k(1,1),x2+(1/2)*k(1,2),x3+(1/2)*k(1,2));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    k(3,1)=h*f1(t1+(h/2),x1+(1/2)*k(2,1),x2+(1/2)*k(2,2),x3+(1/2)*k(2,2));
    k(3,2)=h*f2(t1+(h/2),x1+(1/2)*k(2,1),x2+(1/2)*k(2,2),x3+(1/2)*k(2,2));
    k(3,3)=h*f3(t1+(h/2),x1+(1/2)*k(2,1),x2+(1/2)*k(2,2),x3+(1/2)*k(2,2));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    k(4,1)=h*f1(t1+h,x1+k(3,1),x2+k(3,2),x3+k(3,3));
    k(4,2)=h*f2(t1+h,x1+k(3,1),x2+k(3,2),x3+k(3,3));
    k(4,3)=h*f3(t1+h,x1+k(3,1),x2+k(3,2),x3+k(3,3));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
    x1=x1+(k(1,1)+2*k(2,1)+2*k(3,1)+k(4,1))/6;
    x2=x2+(k(1,2)+2*k(2,2)+2*k(3,2)+k(4,2))/6;
    x3=x2+(k(1,3)+2*k(2,3)+2*k(3,3)+k(4,3))/6;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    t1=a+i*h;
    s=double(subs(y,[t],[t1]));
    W=[W,x1];                     %%ejecucion programa
    T=[T t1];
    e=abs(x1-s);
    fprintf('\t %3.2f\t %3.7f\t %3.7f\t %3.7f\t %3.7f\t %3.7f\n',t1,x1,x2,x3,s,e)
end
tt=0:0.001:1;
yy=y(tt);       
yy';
plot(T',W','-r') 
hold on
plot(tt',yy','b')
title('METODO DE RK4')
xlabel('t')
ylabel('y')
legend('RK4 PARA SISTEMAS','SOLUCION AL PVI');
