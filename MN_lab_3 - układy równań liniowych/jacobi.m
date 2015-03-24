clc
function X = jacobi(A,b)
	X = ones(size(b))';
	for i = 1:20
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
format long

%szybkosc
%A=rand(10000) + eye(10000);
%b=rand(1,10000);
%printf("czas jacobi")
%time1 = tic();
%jacobi(A,b);
%toc(time1)

%printf("czas octave")
%time1 = tic();
%X=A\b';
%toc(time1)
