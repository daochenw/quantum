function [ T ] = checkp( X , w , Wvalid )
%w is a word: a 1 by n cell containing n letters - i.e. 1 by 2 matrices.
%-------------------------------------------------
%Wvalid is dictionary of valid words
%-------------------------------------------------
for k = 1:size(X,4);
[ O , o ] = mealy(X,w,k);
n = length(O); f = find(o ~= -2);
if isempty(f); T = 1; return, end
if n == 1; T = 1;return, end
T = 0;
%while T == 0 && i <= l
for i = 1:length(Wvalid)  
    if length(Wvalid{i,1}) < n
        continue
    end   
    counter = 0;
    if  isequal(w(1:n),Wvalid{i,2}(1:n)) && isequal(O(f), Wvalid{i,1}(f))
        counter = 1;
    end
    T = T+counter;
    %if T > 0.5, return, end
    %i=i+1;
end
%when you consider different k add:
if T == 0, T = 0; break, end
end



