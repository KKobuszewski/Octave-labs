clc
% tu trzeba jeszcze wymyslic jak zrobic by nie zostawaly -0.0000

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
		if (C(ii,1) > C(ii-1,1))
			C = swaprows(C,ii,ii-1);
		endif
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

A = magic(5);
%A = swaprows(A,1,4)
b = linspace(1,5,5);
A,b
AB = [A b']
AB = validate_matrix(AB)
C = jordanElim(AB)