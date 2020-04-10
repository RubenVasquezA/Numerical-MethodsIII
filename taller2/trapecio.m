function integral=trapecio(g,x0,x)
f=inline(g,'x');
h=x-x0;
integral=h*(f(x)+f(x0))/2;


