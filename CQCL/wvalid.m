function [ T, wv ] = wvalid(wt)
%wv.m first checks whether w  places (a non-trivial) constraint on the 
% automaton via T. If T > 0, i.e.'yes', then it gives the corresponding 
%wv (valid words) associated to w in the form of a matrix. 

%%
%setup
at='a':'i'; T = 0; n = length(wt);  
wv = permn([-1,1],n);
%comp = compatibility constraints
comp = {'[bcdg]*','[aceh]*','[abfi]*','[agef]*','[bhdf]*','[deci]*','[adhi]*','[gibe]*','[ghcf]*'};
%detm = determinism constraints from contextuality
l = {'abc','def','ghi','adg','beh','cfi'}; detm = cell(1,36);
detmp = {'[abcdg]*','[abceh]*','[abcfi]*','[adgef]*','[behdf]*','[defci]*','[adghi]*','[ghibe]*','[ghicf]*'};
for i = 1:6, pl = perms(l{i}); 
    for j = 1:6, plj = pl(j,:); 

        for k = 1:9, if plj(3) == at(k), x = detmp{k}; end, end;
        detm{1,6*(i-1)+j} = [plj(1),'[',l{i},']*','(',plj(2),')',x, plj(3)];        
    end
end
%%
%constraints 
%--------------------------------------------------------------------------   
% 1. the compatibility constraints
for j = 1:9
[x1,y1] = match(wt,[at(j),comp{j},at(j)]); t = length(x1);
if x1 == zeros(size(x1)), continue, end
    for i = 1:2^n
        k = 1; counter = 0;
        while counter == 0 && k <= t, if wv(i,x1(k)) ~= wv(i,y1(k)),counter = counter+1; end, k = k+1; end    
        if counter > 0, wv(i,:) = 0; end
    end 
if isempty(x1) == 0; T = T+1; end
end
wv( ~any(wv,2),:) = [];%delete zero rows
%--------------------------------------------------------------------------
% 2. the determinism constraints from contextuality
for j = 1:36
[x1,y1,z1]=regexp(wt,detm{j}); t = length(x1);
if isempty(x1) == 1, continue, end
    for i = 1:size(wv,1)
        k = 1; counter = 0;
        while counter == 0 && k <= t, 
            if j < 31
                if prod([wv(i,x1(k)),wv(i,z1{k}(1)),wv(i,y1(k))]) ~= 1,...
                    counter = counter+1; end
            else
                if prod([wv(i,x1(k)),wv(i,z1{k}(1)),wv(i,y1(k))]) ~= -1,...
                    counter = counter+1; end
            end
            k = k+1;
        end
        if counter > 0, wv(i,:) = 0; end
    end        
if isempty(x1) == 0; T = T+1; end        
end        
wv( ~any(wv,2),:) = [];%delete zero rows
end





