l = length(permn([1 -1],3));
L = zeros(1,l)
for i = 1:l
i, X(:,1,1,4) = permn([-1 1],3,i);
tic; U = automp(X,Wtest,Wvalid); toc, if any(U(:)==-2), L(i) = 1, end
L
end