function simpson(f,x0,x);
f=inline(f,'x');
h=(x-x0)/2;
integral=h*(f(x0)+4*f(x0+h)+f(x))/3
