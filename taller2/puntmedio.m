function puntmedio(g,x0,x);
f=inline(g,'x');
h=(x-x0)/2;
integral=2*h*(f((x+x0)/2))