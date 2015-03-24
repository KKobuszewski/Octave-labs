% Równanie Ax = b
% A - macierz
% x,b - wektory

clc

function x = cramer(A,b)
	W = det(A);
	x = zeros(size(b));
	length(b);
	for ii = 1:length(b)
		A_copy = repmat (A,1);
		A_copy(:,ii) = b;
		x_i = det(A_copy)/W;
		x(ii) = x_i;
	endfor	
endfunction


A = [1,1,0 ; 0,1,1 ; 0,0,1]
b = [1,1,1]

cramer(A,b)

A = rand(100,100);
b = rand(1,100);

time1 = tic();
cramer(A,b)
toc(time1)