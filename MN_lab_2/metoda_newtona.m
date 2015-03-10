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
		
		apx_zero = apx_zero - func(apx_zero)/derivate_at_point(func,apx_zero);
		printf("%d. %e\n",iterations,apx_zero);
		
		if(iterations>256)
			printf("\nPrzekroczono maksymalną ilość iteracji!\n");
			return
		endif
	endwhile
	printf("%d. iteracji\n", iterations);
endfunction

a = [1,1,0,1];%wspolczynniki wielomianu

function X = get_poly(a,x)
	N =linspace(0,length(a)-1,length(a))
	XX = x*ones(1,length(a)).^N
	X = XX*a';
endfunction
get_poly(a,1)

function derivative = derivate_at_point(func,x) 
	h = 1e-10;
	derivative= (func(x-2*h)-8*func(x-h)+8*func(x+h)-func(x+2*h))/(12*h);
endfunction

%f = @(x) sin(x)
%derivate_at_point(f,0)

f = @(x)x.+cos(x);q = polyder(p)
x = linspace(-10,10,1000);
%plot(x,f(x));
%format long;
time1 = tic();
solve_zero_Newton(f,-2,1,0.0000001)
printf("\nczas: %e s\n",toc(time1));