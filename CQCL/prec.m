function [ Wtest , Wvalid ] = prec( x )
%PREC Summary of this function goes here
%   Detailed explanation goes here
Wtest = cell(length(x),1); 
Wvalid0 = cell(length(x), 2^5); % 5 letters
for i = 1:length(x)
    i;
    [T,wv] = wvalid(x{i});
    if T == 0, x{i} = []; continue; end 
    Wtest{i} = c(x{i});
    y = Wtest{i};
    for j = 1:size(wv,1)
        for k = 1:size(wv,2)       
        y{k}(3) = wv(j,k);
        end
        Wvalid0{i,j} = y;
    end
end
Wvalid0 = Wvalid0(~cellfun('isempty', Wvalid0));
Wvalidc = cut(Wvalid0);
Wvalid(:,1) = Wvalid0;
Wvalid(:,2) = Wvalidc';
Wtest = Wtest(~cellfun('isempty', Wtest));
end

