function [ W ] = cut( Wvalid )
%cuts off the output values from vwords in Wvalid

L = length(Wvalid); W = cell(1,L);
for j = 1:L
k = length(Wvalid{j}); word=cell(1,k);
for i = 1:k
    w = Wvalid{j}{i}; %ith letter of the jth word in Wvalid
    w = w(1:length(w)-1);
    word{i}=w;
end
W{j}=word;
end
end

