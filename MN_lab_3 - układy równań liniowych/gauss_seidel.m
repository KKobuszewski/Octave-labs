clc
function X = gauss_seidel(A,b)
	X = ones(size(b))';
	L = tril(A,-1);
	U = tril(A,1);
	D = 1./diag(A);
	for i = 1:20
		for x 
		X = (b' - (A-eye(size(A)).*A)*X).*(1./diag(A));
	endfor
endfunction

A = rand(5) + eye(5).*5
b = rand(1,5)

format long e
X1=jacobi(A,b)
printf("Rozwiazanie prawidlowe");
X2=A\b'
printf("Roznice")
X2-X1

%szybkosc
A=rand(1000) + eye(1000);
b=rand(1,1000);
printf("czas jacobi")
time1 = tic();
jacobi(A,b);
toc(time1)

printf("czas octave")
time1 = tic();
X=A\b';
toc(time1)
