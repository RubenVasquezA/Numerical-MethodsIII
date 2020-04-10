function y = eulermod(fun, x0, xf, N, y0)
h=(xf-x0)/N;
y(1)=y0;
f=inline(fun);
fprintf('Aproximaciones\n');
for i = 1:N
x(i) = x0+(i-1)*h;
y(i+1) = y(i)+h/2*(f(x(i),y(i))+y(i)+f(x(i)+h,y(i)+h*f(x(i),y(i))));
fprintf('%d\n',i);
fprintf('y(%.4f)=%.6f\n',x(i)+h,y(i+1));
end
end