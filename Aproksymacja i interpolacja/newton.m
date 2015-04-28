%author: Filole

x = [1,2,4,5,7];
y = [52,5,-5,-40,10];
X=x;
Y=y;
A(1)=Y(1);
[nr,nc] = size(x);
for i=1:nc-1
	Y=diff(Y);
	Y=Y./(X(i+1:end)-X(1:end-i));
	A(i+1)=Y(1);
end
polyout(A,'x')
	
f=@(z)A(1)+A(2).*(z-x(1))+A(3).*(z-x(1)).*(z-x(2))+A(4).*(z-x(1)).*(z-x(2)).*(z-x(3))+A(5).*(z-x(1)).*(z-x(2)).*(z-x(3)).*(z-x(4));

ptk = 1: 0.1 : 7;

polyout(lagrangepoly(x,y),'x')
f2 = @(z) polyval(lagrangepoly(x,y),z);

plot(ptk,f(ptk),"g",ptk,spline(x,y,ptk),"b",ptk,f2(ptk),"r",x,y,"ro")
hold on;
plot(ptk,yy,"b")
print -djpg newton_filole.jpg
%hold off;