clc
function [Q,R]=eig_qr(A,epsilon)
	n=size(A)(1);
	Q=zeros(n);
	R=A;
	for ii = 1:n
		A(:,ii)
		v=A(ii:n,ii)-norm(A(ii:n,ii))*eye(size(A))(:,ii);
		v/=(norm(v))^2;
		H=eye(n)-2*v*v';
		R=H*R
		if (ii == 1)
			Q=H;
		else
			Q=H*Q;
		endif		
	endfor
endfunction

A = rand(5)+eye(5)

[q,r]=eig_qr(A,0.0001)
%[Q,R]=qr(A)
%printf("wartosci wlasne")
%eig(A)