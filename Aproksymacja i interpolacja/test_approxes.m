#!/usr/bin/octave -qf
clc

function polynomial=leastsq(X,Y,m)
	% X - vector of points x_i
	% Y - vector of points f(x_i)
	% m - degree of a approximating polynomial
	%
	% RETURN
	% a - vector of polynomial coefficients
	
	if (length(X) <= m)
		printf("Za mało punktów by dopasować wielomian tego stopnia!\n");
		return;
	endif
	if (length(X) != length(Y))
		printf("Niezgodny rozmiar wektorów X i Y\n");
		return;
	endif
	
	sum(fliplr(vander(X)),1)
	X_powers = sum( (ones(2*m+1,1)*X) .^ ([0:1:2*m]'*ones(1, length(X) )), 2) % [sum(X^0),sum(X^1),...,sum(X^2m)], elements 1..2m+1
	b = sum( (ones(m+1,1)*X) .^ ([0:1:m]' * ones(1, length(X) )) .* (ones(m+1,1)*Y), 2) % vector of free expressions
	
	A = zeros(m+1,m+1);
	for ii = 1:m+1
		for jj = 1:m+1
			A(ii,jj) = X_powers(ii+jj-1);
		endfor
	endfor
	
	A
	
	a =A\b
	
	polynomial = @(x)   sum( (X .^ ( [0:1:m]' * ones(1,length(X))) .* ( a * ones(1,length(X)) ) ), 1);
endfunction

X = 0:0.05:2
Y = 0.005*X.^3 .- 0.01*X.^2 .+ X .+ rand(size(X));

%plot(X,Y,'o')

polynomial1 = leastsq( X, Y, 1 );
polynomial2 = leastsq( X, Y, 2 );
polynomial3 = leastsq( X, Y, 3 );

set (0, "defaultaxesfontname", "Helvetica") % this is the line to add BEFORE plotting
hold on;
plot(X,polynomial3(X),'-',X,Y,'o',X,0.005*X.^3 .- 0.01*X.^2 .+ X)
print -djpg image.jpg