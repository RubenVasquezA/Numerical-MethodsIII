function puntmedio1(g,x0,x);
f=inline(g,'x');
h=(x-x0)/3;
integral=3*h*(f(x0)+f(x0+h))/2