clc

function B = swaprows(A,n,m)
	%size(A)(1);
	B = repmat(A,1);
	if (n <= size(A)(1)) && (m <= size(A)(1))
		B([n, m], :) = A([m, n], :);
	else
		printf("Wrong rows numbers!");
	endif 
endfunction

function C = validate_matrix(AB)
	%Sprowadza macierz do postaci optymalnej dla algorytmu gaussa
	C = repmat(AB,1);
	for ii = fliplr(2:size(AB)(1))
		if (AB(ii,1) > AB(ii-1,1))
			C = swaprows(AB,ii,ii-1);
		endif
	endfor
endfunction

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

A = magic(5);
%A = swaprows(A,1,4)
b = linspace(1,5,5);
AB = [A b']
validate_matrix(AB)
C = gaussElim(AB)