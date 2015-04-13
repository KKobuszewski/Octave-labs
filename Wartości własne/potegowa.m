clc;

function [eigval, X] = eig_exponential(A,epsilon)
	X=rand(1,size(A)(1))';
	X/=norm(X);
	error=1;
	while (error > epsilon)
		X_old = X;
		X = A*X;
		X /= norm(X);
		error = max(X.-X_old);
	endwhile
	eigval = norm(A*X)/norm(X);
endfunction

function [eigval, X] = eig_invexponential(A,epsilon)
	X=rand(1,size(A)(1))';
	X/=norm(X);
	error=1;
	while (error > epsilon)
		X_old = X;
		X = inv(A)*X;
		X /= norm(X);
		error = max(X.-X_old);
	endwhile
	eigval = norm(A*X)/norm(X);
endfunction

A = rand(3)+eye(3)

printf("metoda potegowa")
[eval,evec]=eig_exponential(A,0.00001)

printf("odwrotna metoda potegowa")
[eval,evec]=eig_invexponential(A,0.00001)

[v,m] = eig(A)
v
m