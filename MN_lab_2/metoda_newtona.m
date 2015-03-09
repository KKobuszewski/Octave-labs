function apx_zero = solve_zero_Newton(func, begin_intv, end_intv, epsilon)
	if (func(begin_intv)*func(end_intv)>0)
		printf("\nBrak rozwiązań w przedziale [%d,%d]!\n",begin_intv,end_intv);
		apx_zero=NaN;
		return
	endif
	apx_zero=count_zero(func(begin_intv),func(end_intv),begin_intv,end_intv);
	iterations = 0;
	while(abs(func(apx_zero))>epsilon)
		iterations++;
		
		%tu algorytm
		
		if(iterations>256)
			printf("\nPrzekroczono maksymalną ilość iteracji!\n");
			return
		endif
	endwhile
	printf("%d. iteracji\n", iterations);
endfunction

f = @(x)x.+cos(x);
x = linspace(-10,10,1000);
%plot(x,f(x));
%format long;
time1 = tic();
solve_zero_Newton(f,-2,1,0.0000001)
printf("\nczas: %e s\n",toc(time1));