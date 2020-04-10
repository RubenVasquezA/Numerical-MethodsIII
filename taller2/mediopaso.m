function [t,U]=mediopaso(fun,t0,T,n,u0)
U=zeros(1,n+1);
U(1)=u0;
h=(T-t0)/n;
t=t0:h:T;
f=inline(fun,'t','y')
for k=1:n
    U(k+1)=U(k)+h*f(t(k)+0.5*U(k),0.5*h*f(t(k),U(k)))
end