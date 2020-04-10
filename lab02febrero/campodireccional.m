N=30;
xmin=0;
xmax=40;
ymin=0;
ymax=10;
[x,y]=meshgrid(xmin:(xmax-xmin)/N:xmax,ymin:(ymax-ymin)/N:ymax);
dy=fun(x,y);
dx=ones(size(x));
L=sqrt(dx.^2+dy.^2);
L=L+1e-10;
dy=dy./L;
dx=dx./L;
quiver(x,y,dx,dy);
hold on