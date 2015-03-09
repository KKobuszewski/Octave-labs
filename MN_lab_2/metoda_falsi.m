function apx_zero = solve_zero_falsi(func, begin_intv, end_intv, epsilon)
	if (func(begin_intv)*func(end_intv)>0)
		printf("Brak rozwiązań w przedziale [%d,%d]",begin_intv,end_intv);
		apx_zero=NaN;
		return
	endif
	apx_zero=count_zero(func(begin_intv),func(end_intv),begin_intv,end_intv);
	while(abs(func(apx_zero))>epsilon)
		if(func(begin_intv)*func(apx_zero)<0)%zero jest w przedziale (begin_intv,zero)
			end_intv = apx_zero;
		elseif(func(apx_zero)*func(end_intv)<0)%zero jest w przedziale (zero,end_intv)
			begin_intv = apx_zero
		else
			return
		endif
		apx_zero=count_zero(func(begin_intv),func(end_intv),begin_intv,end_intv);
	endwhile
endfunction

function linzero=count_zero(fa,fb,a,b)
	%x value for the intersection of line with axis x
	linzero = (a*fb-b*fa)/(fb-fa);
endfunction

f = @(x)x.+cos(x);
x = linspace(-10,10,1000);
%plot(x,f(x));
format long e;
time1 = tic();
solve_zero_falsi(f,-2,1,0.0000001)
printf("\nczas: %e s\n",toc(time1));