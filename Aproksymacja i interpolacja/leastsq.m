function polynomial=leastsq(X,Y,m)
	% X - vector of points x_i
	% Y - vector of points f(x_i)
	% m - degree of a approximating polynomial
	%
	% RETURN
	% a - vector of polynomial coefficients
	
	if (length(X) <= m)
		printf("Za mało punktów by dopasować wielomian tego stopnia!");
		return;
	endif
	if (length(X) != length(Y))
		printf("Niezgodny rozmiar wektorów X i Y");
		return;
	endif
	
	X_powers = sum( (ones(m+1,1)*X) .^ ([0:1:m]'*ones(1,m+1)), 2); % [sum(X^0),sum(X^1),...,sum(X^2m)], elements 1..2m+1
	b = sum( (ones(m+1,1)*X) .^ ([0:1:m]' * ones(1,m+1)) .* (ones(m+1,1)*Y, 2); % vector of free expressions
	A = sqrt(X_powers)' * sqrt(X_powers)
	
	a = A \ b
	
	polynomial = @(x) a .* x .^ [0:1:m];
endfunction