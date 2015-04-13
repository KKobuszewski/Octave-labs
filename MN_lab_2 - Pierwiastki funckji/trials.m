function val = evaluating_trial(func,x)
	val = func(x);
endfunction

f = @(x)x.^2
evaluating_trial(f,2)