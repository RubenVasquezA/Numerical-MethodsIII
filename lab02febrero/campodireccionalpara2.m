N=30;
xmin=-1;
xmax=2;
ymin=-2;
ymax=2;
[x,y]=meshgrid(xmin:(xmax-xmin)/N:xmax,ymin:(ymax-ymin)/N:ymax);
dy=fun1(x,y);
dx=fun(x,y);
L=sqrt(dx.^2+dy.^2);
L=L+1e-10;
dy=dy./L;
dx=dx./L;
quiver(x,y,dx,dy);
hold on
