function x0 = bisect(func,a,b,epsilon)
	%a - poczatek przedzialu
	%b - koniec
	%epsilon - dokladnosc
	%func - funkcja
	if (func(a)*func(b)<0)
		%iters = ceil(log2((b-a)/epsilon));
		x0 = 0:0;
		zero = a + (a+b)/2;
		x0(1) = zero;
		%printf("1. przyblizenie %e\n",zero);
		
		while (abs(func(zero))>epsilon)
			%printf("Warunek petli %e, %e\n",func(zero),epsilon);
			if (func(a)*func(zero)<0)
				%jezeli pierwiastek lezy w przedziale (a,x_zero(ii))
				%to zmieniamy granice przedzilu przesuwajac b
				b = zero;
			elseif (func(zero)*func(b)<0)
				%jezeli pierwiastek lezy w przedziale (x_zero(ii),b)
				%to zmieniamy granice przedzilu przesuwajac a
				a = zero;
			else
				%zero = NaN;
				printf("Blad - te same znaki po obu stronach przedzialu");
				return
			endif
			%jak mamy nowy przedzial to liczymy kolejne przyblizenie
			
			zero = (a+b)/2;
			x0(end+1) = zero;
		endwhile
	else
		printf("Blad - te same znaki po obu stronach przedzialu");
		x0 = NaN;
		return
	endif
endfunction