

function val = diff_quot(X,Y)
    if (length(X) == 1)
      val = Y
    else
      val = ( diff_quot(X(2:length(X)),Y(2:length(X))) - diff_quot(X(1:length(X)-1),Y(1:length(X)-1)) )/(X(length(X)) - X(1))
    endif
endfunction

function polynomial = polynewton(X,Y)

endfunction

X = [1,2,3]
Y = [1,1,2]

diff_quot(X,Y)