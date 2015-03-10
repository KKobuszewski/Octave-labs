function y=arctg(x,N)
	n = [1:2:2*N]; %liczby nieparzyste 1,3,5,.. mniejsze od 2N
	m =  ones(1,N);
	m(2:2:(N-1)) = m(2:2:(N-1)).*(-1); %(-1)^n
	X = ones(1,length(n)).*x; %rozszerzenie x do postaci vectora
	y = m*((X.^n)./n)';
	
endfunction

format long;
4*arctg(1,11)
4*arctg(1,10)
4*arctg(1,9)
4*arctg(1,8)
6*arctg(sqrt(3)/3,10)
16*arctg(1/5,5)-4*arctg(1/239,5)
pi

function j=iters()
	for i = 1:20
		printf("%d. %e\n",i,(16*arctg(1/5,i)-4*arctg(1/239,i)-pi));
	endfor
endfunction

iters() %7 cyfr dla dokladności 10 miejsc po przecinku