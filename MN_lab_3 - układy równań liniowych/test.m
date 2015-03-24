clc

function ab = gaussElim(AB)
	ab = repmat(AB,1);
	n = size(AB)(1)
	size(AB)(2)
	for ii = 1:n-1 %iteruje po kolumnach
		for jj = (ii+1):n %iteruje po wierszach
			m = ab(jj,ii)/ab(ii,ii);
			ab(jj,:) = ab(jj,:) - m*ab(ii,:);
		endfor
	endfor
endfunction

function ab = jordanElim(AB)
	ab = repmat(AB,1);
	n = size(AB)(1)
	size(AB)(2)
	%wykonujemy gaussa z normalizacja przekontnej do 1
	ab(1,:) = ab(1,:)/ab(1,1);
	for ii = 1:n-1 %iteruje po kolumnach
		%normalizacja
		ab(ii,:) = ab(ii,:)/ab(ii,ii);
		for jj = (ii+1):n %iteruje po wierszach
			%gauss - po kolei odejmujemy wiersze przemnozone przez 1. element wiersza
			ab(jj,:) = ab(jj,:) - ab(jj,ii)*ab(ii,:);
		endfor
	endfor
	ab(n,:) = ab(n,:)/ab(n,n);%normalizujemy ostatni element
	%mamy macierz trojkatna gorna
	
	%powtarzamy algorytm w druga strona
	for kk = fliplr(2:n)%iterujemy po kolumnach w druga strona
		%tu juz nie musimy normalizowac bo macierz ma na przekantne jedynki
		for ll = fliplr(1:(kk-1)) %iterujemy po wierszach w druga strona
			ab(ll,:) = ab(ll,:) - ab(ll,kk)*ab(kk,:);
		endfor
	endfor
	%mamy macierz diagonalna
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

function x = upper_triangular_matrix(A,b)
	ii = length(b);
	x = zeros(size(b));
	
	while(ii>0)
		x(ii) = b(ii)/A(ii,ii);
		%trzeba to przepisać wektorowo!!!
		%for jj = 1:ii
		%	b(jj) = b(jj) - x(ii)*A(jj,ii)
		%endfor
		b(1:(ii-1)) = b(1:(ii-1)) - A(1:(ii-1),ii)'*x(ii);
		ii = ii - 1;
	endwhile
endfunction

%A =  [1.,0.,0.,0. ; 1.,1.,0.,0. ; 0.,1.,1.,0. ; 0.,0.,1.,1.]
A = rand(4)
b = [1.,1.,1.,1.]

printf("Gauss")
gaussElim([A b'])
printf("Jordan")
jordanElim([A b'])
%lower_triangular_matrix(A,b)

printf("LU Dolittle")
LU = LU_Dolittle(A);
U = LU - tril(LU,-1);
L = tril(LU,-1)+eye(size(LU));
y = lower_triangular_matrix(L,b);
x = upper_triangular_matrix(U,y)