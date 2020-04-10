function [x,w1,w2]=disnolin(f,a,b,d,c,n,tol,m)
%paso1
f=inline(f,'x','y','diff(y)')
w1=zeros(1,n+1);
w2=zeros(1,n+1);
x=zeros(1,n+1);
f1=inline(diff(f,'w'),x,w,z);
f2=inline(diff(f,'z'),x,w,z);
h=(b-a)/n;
k=1;
TK=(c-d)/(b-a);
%paso2
while k<=m
%paso3
w1(1)=d;
w2(1)=TK;
u(1)=0;
u(2)=1;
%paso4
for i=2:n
%paso5
x=a+(i-2)/h;
%paso6
k11=h*w2(i-1);
k12=h*f(x,w1(i-1),w2(i-1));
k21=h*(w2(i-1)+0.5*k12);
k22=h*f(x+0.5*h,w1(i-1)+0.5*k11,w2(i-1)+0.5*k12);
k31=h*(w2(i-1)+0.5*k22);
k32=h*f(x+0.5*h,w1(i-1)+0.5*k21,w2(i-1)+0.5*k22);
k41=h*(w2(i-1)+k32);
k42=h*f(x+h,w1(i-1)+k31,w2(i-1)+k32);
w1(i)=w1(i-1)+(k11+2*k21+2*k31+k41)/6;
w2(i)=w2(i-1)+(k12+2*k22+2*k32+k42)/6;
l11=h*u(2);
l12=h*(f1(x,w1(i-1),w2(i-1))*u(1)+f2(x,w1(i-1),w2(i-1))*u(2));
l21=h*(u(2)+0.5*l12);
l22=h*(f1(x+0.5*h,w1(i-1),w2(i-1))*(u(1)+0.5*l11)+f2(x+0.5*h,w1(i-1),w2(i-1))*(u(2)+0.5*l12));
l31=h*(u(2)+0.5*l22);
l32=h*(f1(x+0.5*h,w1(i-1),w2(i-1))*(u(1)+0.5*l21)+f2(x+0.5*h,w1(i-1),w2(i-1))*(u(2)+0.5*l22));
l41=h*(u(2)+l32);
l42=h*(f1(x+h,w1(i-1),w2(i-1))*(u(1)+l31)+f2(x+h,w1(i-1),w2(i-1))*(u(2)+l32));
u(1)=u(1)+(l11+2*l21+2*l31+l41)/6;
u(2)=u(2)+(l12+2*l22+2*l32+l42)/6;
%paso7
if abs(w1(n)-c)<=tol
%paso8
for j=0:n
x=a+j*h;
%[x' w1(i)' w2(i)'];
%paso9
end
end
end
%paso10
TK=TK-(w1(i)-c)/u(1);
k=k+1;
end
%paso11
fprint('numero maximo de ieraciones excedido'); 