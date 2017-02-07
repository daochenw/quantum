function [ T ] = checkallp( X , Wtest , Wvalid )
T = 1;
for i = 1:length(Wtest)
    T = checkp(X,Wtest{i},Wvalid);
    if T == 0,
        return
    end
end
end

