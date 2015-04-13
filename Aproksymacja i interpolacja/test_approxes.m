
X = 0:0.2:10;
Y = 0.005*X.^3 .- 0.01*X.^2 .+ X .+ rand(size(X));

plot(X,Y,'o')

polynomial = leastsq( X, Y, 1 )

plot(X,polynomial(X),'-',X,Y,'o')