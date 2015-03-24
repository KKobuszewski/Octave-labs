clc

function x = lower_triangular_matrix(A,b)
	%solves  equation given by lower triangular matrix
	%A - matrix of 
	ii = 1;
	x = zeros(size(b));
	n = length(b);
	while(ii<n)
		x(ii) = b(ii)/A(ii,ii);
		b((ii+1):n) = b((ii+1):n) - A((ii+1):n,ii)'*x(ii);
		ii = ii + 1;
	endwhile
endfunction

A =  [1.,0.,0.,0. ; 1.,1.,0.,0. ; 0.,1.,1.,0. ; 0.,0.,1.,1.]
b = [1.,1.,1.,1.]
lower_triangular_matrix(A,b)

%A = tril(rand(10),0);
%b = rand(1,10);

%time1 = tic();
%lower_triangular_matrix(A,b)
%toc(time1)