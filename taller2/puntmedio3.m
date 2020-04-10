function puntmedio3(g,x0,x);
f=inline(g,'x');
h=(x-x0)/5;
integral=5*h*(11*f(x0)+f(x0+h)+2*f(x0+2*h)+11*f(x0+3*h))/24