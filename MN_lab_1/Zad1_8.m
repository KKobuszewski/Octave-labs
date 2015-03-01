function ret = multiply(a,b)
	if size(a,2) == size(b,1)
		printf("wymiar zgodny")
		ret = zeros(size(a,1),size(b,2));
		for i = 1:size(a,1)
			for j = 1:size(b,2)
				for k = 1:size(a,2)
					ret(i,j) = ret(i,j) + a(i,k)*b(k,i);
				endfor
			endfor
		endfor
	else
		ret = NaN
	end
end

X = rand(1000,300);
Y = rand(300,700);

time1 = tic();
multiply(X,Y);
time1 = toc(time1)

time2 = tic();
X*Y;
time2 = toc(time2)
