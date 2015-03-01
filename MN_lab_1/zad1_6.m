points=20
x1 = linspace(0,100,10000);
y1 = 0.5  * sin(x1.*x1);
x2 = linspace(0,100,points);
y2 = 0.5  * sin(x2.*x2);
plot(x1,y1,x2,y2)