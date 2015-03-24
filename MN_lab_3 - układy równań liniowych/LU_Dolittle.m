clc

function [L , U] = LU_Dolittle2(A)
	U = repmat(A);
	L = repmat(A);
	n = size(A)(1)
	for ii = 1:n%iteruje po kolumnach
		for jj = 1:ii %iteruje po wierszach
			U(jj,ii) = U(jj,ii) - L(jj, 1:(jj-1))*U(1:(jj-1),ii);
		endfor 
		for jj = ii+1:n
			L(ii,jj) = ( U(jj,ii) - L(jj, 1:(ii-1))*U(1:(ii-1),ii) )/U(ii,ii);
		endfor
	endfor
endfunction

function U = LU_Dolittle(A)
	U = repmat(A,1);
	%L = eye(size(A));
	n = size(U)(1);
	for ii = 1:n %iteruje po kolumnach
		for jj = 1:ii %iteruje po wierszach
			U(jj,ii) = U(jj,ii) - U(jj, 1:(jj-1)) * U(1:(jj-1),ii);
		endfor
		for jj = ii+1:n
			U(jj,ii) = ( U(jj,ii) - U(jj, 1:(ii-1)) * U(1:(ii-1),ii) )/U(ii,ii);
			%L(jj,ii) = U(jj,ii);
		endfor
	endfor
	%U = U - tril(U,-1);
endfunction

L0 = tril(0.2*ones(4),-1)+eye(4)
U0 = triu(3*ones(4),0)-triu(ones(4),1)-triu(ones(4),2)
A = L0*U0
LU = LU_Dolittle(A)
U = LU - tril(LU,-1)
L = tril(LU,-1)+eye(size(LU))
%l,u = LU_Dolittle2(A)
b = linspace(1,4,4)
y = lower_triangular_matrix(L,b)
x = upper_triangular_matrix(U,y)
jordanElim([A b'])

%B =  [1.,0.,0.,0. ; 1.,1.,0.,0. ; 0.,1.,1.,0. ; 0.,0.,1.,1.]
%b = [1.,1.,1.,1.]
%LU2 = LU_Dolittle(B)
%y = upper_triangular_matrix(LU2,b)
%x = lower_triangular_matrix(LU2,y)
%jordanElim([B b'])