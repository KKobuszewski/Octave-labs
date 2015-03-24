clc
A = rand(5)
I = eye(5);
AI = [A I]
AI = validate_matrix(AI)
AinvA = jordanElim(AI)
invA=AinvA(:,size(A)(2)+1:size(AI)(2))
A*invA