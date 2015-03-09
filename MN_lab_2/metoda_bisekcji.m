function zero = solve_eq_bisect(equation, begin_interval, end_interval, epsilon,iteration = 0)
	%equation - function to be compared to 0 (equation(x)=0)
	if iteration == 0
		printf("Liczba iteracji: %d\n",log2((end_interval-begin_interval)/epsilon));
	endif
	%if(epsilon <) trzeba sprawdzić czy taka dokładność obliczeń jest wykonalna w tym środowisku
	iteration = iteration +1;
	if( equation(begin_interval)*equation(end_interval) <= 0 )
		zero = begin_interval + (end_interval - begin_interval)/2;
		if (abs(equation(zero)) >epsilon)
			if(equation(begin_interval)*equation(zero) < 0 )
				end_interval = zero;
			elseif (equation(zero)*equation(end_interval) < 0)
				begin_interval = zero;
			%else tu jeszcze nie wiem
			endif
			
			printf("\niteracja %i.\n zero %e, a %e, b %e, e %e\n", iteration, zero, begin_interval, end_interval,epsilon);
			zero = solve_eq_bisect(equation, begin_interval, end_interval,epsilon,iteration);
		else	
			return;	
		endif
	else
		printf("No zeros in given interval\n");
		zero = NaN;
	endif
endfunction

function zero2 = solve_eq_bisect2(equation, begin_interval, end_interval, epsilon)
	%equation - function to be compared to 0 (equation(x)=0)
	if( equation(begin_interval)*equation(end_interval) <= 0 )
		iterations = ceil(log2((end_interval-begin_interval)/epsilon));
		printf("\n%d. iteracje\n",iterations);
		for ii = 1:iterations
			
			zero2 = begin_interval + (end_interval - begin_interval)/2;
			if(equation(begin_interval)*equation(zero2) < 0 )
				end_interval = zero2;
			elseif (equation(zero2)*equation(end_interval) < 0)
				begin_interval = zero2;
			else
				return
				%else tu jeszcze nie wiem
			endif	
				%printf("\niteracja %i.\n zero %e, a %e, b %e, e %e\n",
				% iteration, zero, begin_interval, end_interval,epsilon);
		endfor
	else
		printf("No zeros in given interval\n");
		zero = NaN;
	endif
	
endfunction

f = @(x)x.+cos(x);
x = linspace(-10,10,1000);
plot(x,f(x));
%format long;
time1 = tic();
solve_eq_bisect(f,-2,1,0.0000001)
printf("\nczas: %e s\n",toc(time1));

time1 = tic();
solve_eq_bisect2(f,-2,1,0.0000001)
printf("\nczas: %e s\n",toc(time1));