function apx_zero = solve_zero_Newton(func, begin_intv, end_intv, epsilon)
	if (func(begin_intv)*func(end_intv)>0)
		printf("\nBrak rozwiązań w przedziale [%d,%d]!\n",begin_intv,end_intv);
		apx_zero=NaN;
		return
	endif
	
	%ustawianie punktu startowego
	%bierzemy koniec przedziału odpowiadający mniejszej wartości abs funckji
	%wtedy powinno być szybciej zbierzne
	if (abs(func(begin_intv))>abs(func(end_intv)))
		apx_zero=end_intv;
		old_zero=begin_intv;
	else
		apx_zero=begin_intv;
		old_zero=end_intv;
	endif
	
	iterations = 0;
	while(abs(func(apx_zero))>epsilon)
		iterations++;
		if ((func(apx_zero)-func(old_zero))<epsilon*func(apx_zero))%chcielibysmy by nas wyrzucilo
			old_zero = old_zero - apx_zero*epsilon;
		endif
		
		%wlasciwy algorytm
		bufor = apx_zero;
		printf("%e.\t%e , %e \t",iterations,apx_zero,old_zero)
		apx_zero = apx_zero - func(apx_zero)*(apx_zero-old_zero)/(func(apx_zero)-func(old_zero));
		old_zero = bufor;
		printf("%e , %e\n",apx_zero,old_zero)
		
		%petla nieskonczona
		if(iterations>256)
			printf("\nPrzekroczono maksymalną ilość iteracji!\n");
			return
		endif
	endwhile
	printf("%d. iteracji\n", iterations);
endfunction

f = @(x)x.+x.^3;%cos(x);
x = linspace(-10,10,1000);
%plot(x,f(x));
%format long;
time1 = tic();
solve_zero_Newton(f,-2,1,0.0000001)
printf("\nczas: %e s\n",toc(time1));