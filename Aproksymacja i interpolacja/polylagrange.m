clc

function polynomial = polylagrange(X,Y)
    
    n = length(X)
    c = ones(1,n);
    
    c = Y ./ prod( X'*ones(1,n) - ones(n,1)*X .+ eye(n)  , 2)'
    
    (1*( ones(n,n) .- eye(n)) - (X'*ones(1,n) - (X)*eye(n))) + eye(n)
    prod( (1*( ones(n,n) .- eye(n)) - (X'*ones(1,n) - (X)*eye(n))) + eye(n) ,2)
      prod( (1*( ones(n,n) .- eye(n)) - (X'*ones(1,n) - (X)*eye(n))) + eye(n) ,2) .* c'
        
    polynomial = @(x) sum( prod( (x*( ones(n,n) .- eye(n)) - (X'*ones(1,n) - (X)*eye(n))) + eye(n) .* c' ,2) , 1 )
    
endfunction

X = 0:0.5:2
Y = [1.,2.,0.8,3.,5.]

polynomial=polylagrange(X,Y);
polynomial(1)

printf("wielomian\n");
xx = 0:0.1:2;
W = ones(size(xx));



for ii = 1:length(xx)
    W(ii) = polynomial(xx(ii));
endfor


hold on;
plot(X,Y,'or',xx,W,'-b')
print -djpg lagrange.jpg
