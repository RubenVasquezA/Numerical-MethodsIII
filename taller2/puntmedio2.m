function puntmedio2(g,x0,x);
f=inline(g,'x');
h=(x-x0)/4;
integral=4*h*(2*f(x0)-f(x0+h)+2*f(x0+2*h))/3