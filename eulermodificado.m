function eulermodificado(a,b,n,y0,g)

syms t 

y(t)=dsolve('Dy=y*(2.128-0.043*y)','y(0)=0.24')

f=inline(g,'t','y');
h=(b-a)/n;
fprintf(' \t\t\t           MÉTODO DE EULER MODIFICADO\n\n')
fprintf('\t----------------------------------------------------\n')
fprintf('\t t(i)\t\t  yti)\t\t    w(ti) \t\t    error     \n')
fprintf('\t----------------------------------------------------\n')
t1=[];w=[];
A=[];
B=[];
T=a;
t1(1)=a;
w(1)=y0;
s=double(subs(y,[t],[T]));
e=0;
fprintf('\t %3.1f\t   %3.7f\t   %3.7f\t   %3.7f\n',t1(1),s,w(1),e)


for i=1:n
    
    t1(i+1)=a+i*h;
    w(i+1)=w(i)+(h/2)*(f(t1(i),w(i))+f(t1(i+1),w(i)+h*f(t1(i),w(i))));
    T=a+i*h;
    s=double(subs(y,[t],[T]));
    e=abs(w(i+1)-s);
    fprintf('\t %3.1f\t   %3.7f\t   %3.7f\t   %3.7f\n',t1(i+1),s,w(i+1),e)
end