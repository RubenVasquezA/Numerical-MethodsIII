function y=euler(n,a,b,h)
format long
x=a:h:n*h;
y=zeros(n,1);
y(1)=b;
for k=1:n
    f=fe(x(k),y(k));
    y(k+1)=y(k)+h*f;
end




