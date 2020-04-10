function tresoctavos(f,x0,x);
f=inline(f,'x');
h=(x-x0)/3;
integral=3*h*(f(x0)+3*f(x0+h)+3*f(x0+2*h)+f(x))/8
