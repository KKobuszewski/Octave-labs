function root = solve_eq_bisect(equation, begin_interval, end_interval, epsilon,iteration = 0)
	%equation - function to be compared to 0 (equation(x)=0)
	
	%if(epsilon <) trzeba sprawdzić czy taka dokładność obliczeń jest wykonalna w tym środowisku
	iteration = iteration +1;
	if( equation(begin_interval)*equation(end_interval) <= 0 )
		root = begin_interval + (end_interval - begin_interval)/2;
		if (abs(equation(root)) >epsilon)
			if(equation(begin_interval)*equation(root) < 0 )
				end_interval = root;
			elseif (equation(root)*equation(end_interval) < 0)
				begin_interval = root;
			%else tu jeszcze nie wiem
			endif
			
			printf("\niteracja %i.\n root %e, a %e, b %e, e %e\n", iteration, root, begin_interval, end_interval,epsilon);
			root = solve_eq_bisect(equation, begin_interval, end_interval,epsilon,iteration);
		else	
			return;	
		endif
	else
		printf("No roots in given interval\n");
		root = NaN;
	endif
endfunction

f = @(x)x.+cos(x);
x = linspace(-10,10,1000);
plot(x,f(x));
%format long;
time1 = tic();
solve_eq_bisect(f,-2,1,0.0000001)
printf("\nczas: %e s\n",toc(time1));