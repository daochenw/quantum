function [ A ] = c( x )
% converts word string to the corresponding cell of vectors.
A = cell(size(x));
alpha ='a':'i';
for i = 1: length(A)
    for j = 1:9
      if x(i)==alpha(j)
        A{i}=[ceil(j/3),mod(j-1,3)+1];
      end
    end
end

