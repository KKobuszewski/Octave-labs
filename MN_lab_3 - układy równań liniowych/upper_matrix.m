clc

%rozwianzywanie ukladu rownan z macierzy trojkatnej gornej

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



%A = [1.,1.,0.,0. ; 0.,1.,1.,0. ; 0.,0.,1.,1. ; 0.,0.,0.,1.]
%b = [1.,1.,1.,1.]
%upper_triangular_matrix(A,b)

A = triu(rand(5),0);
b = rand(1,5);

time1 = tic();
upper_triangular_matrix(A,b)'
toc(time1)
printf("rozwiazanie prawidlowe");
A\b'
%zlozonosc obliczeniowa w przyblizeniu liniowa