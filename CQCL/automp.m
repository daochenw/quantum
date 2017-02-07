function [ X ] = automp( X , Wtest , Wvalid)
% autom tries to solve the quantum automaton using recursive backtracking.
% %autom(X,Wtest) expects a 3 by 3 by 2 by _ array. _ = no. of states.
% C is a cell array of candidate vectors for each cell.
% s is the first cell, if any, with one candidate.
% e is the first cell, if any, with no candidates.

sz = size(X); N = sz(4); 
[C,s,e] = candidates(X);

%if n>29; X, pause(60); end
while ~isempty(s) && isempty(e)
for ii = 1:length(s)
    X(s(ii)) = C{s(ii)};
end
[C,s,e] = candidates(X);
end
% return for impossible puzzles
if ~isempty(e)
return
end
    
% recursive backtracking.
if any(X(:) < -1.5)
    Y = X;
    L = cellfun(@length,C(:,:,2,:));
    I = find(L == min(L(L > 0)),1);
    
    if ~isempty(I)
        I = 9+I+9*(floor((I-1)/9));
    else
        L = cellfun(@length,C);
        I = find(L == min(L(L > 0)),1);
    end
    
    [pt_1,pt_2,pt_3,pt_4] = ind2sub(size(X),I); % The first unfilled cell.
    
    for r1 = [C{pt_1,pt_2,pt_3,pt_4}] % Iterate over candidates.
        if X(pt_1,pt_2,3-pt_3,pt_4) == -2
            for r2 = [C{pt_1,pt_2,3-pt_3,pt_4}]
                X = Y;
                X(pt_1,pt_2,pt_3,pt_4) = r1; % Insert a tentative value.
                X(pt_1,pt_2,3-pt_3,pt_4) = r2; % Insert a tentative value.               
                n = nnz(X+2)
                X = automp(X,Wtest,Wvalid); % Recursive call.
                if all(X(:) > -1.5) % Found a solution.
                    return
                end
            end
        else
            X = Y;
            X(pt_1,pt_2,pt_3,pt_4) = r1; % Insert a tentative value.
            n = nnz(X+2)
            X = automp(X,Wtest,Wvalid); % Recursive call.
            if all(X(:) > -1.5) % Found a solution.
                return
            end
        end
    end
end
%------------------------------------------------
    function [C,s,e] = candidates(X)
        tic; C = cell(3,3,2,N);        
        F = find(X == -2);
        [~,~,S,~]=ind2sub(size(X),find(X < -1.5));
        A = F(S == 1);
        B = F(S == 2);
        
        for i = 1:length(A)
            z = [1 -1]; 
                Xnew = X; Xnew(A(i)) = -1;
                if  extraconstraintsdisp(Xnew) == 0 || checkallp(Xnew,Wtest,Wvalid) == 0, z(2) = 0; end
                %extraconstraints(Xnew) == 0 || 
                %|| checkallp(Xnew,Wtest,Wvalid) == 0
                Xnew = X; Xnew(A(i)) = +1; 
                if  extraconstraintsdisp(Xnew)  == 0 || checkallp(Xnew,Wtest,Wvalid) == 0, z(1) = 0; end    
                C{A(i)} = nonzeros(z)';
        end
        
        for j = 1:length(B)
             z = 1:N; %depends on number of states
             [~,~,~,k] = ind2sub(size(X),B(j));
                for p = circshift(1:N,[1,N+1-k]); %depends on number of states
                %for p = 1:N,
                    Xnew = X; Xnew(B(j)) = p; 
                    if  extraconstraintsdisp(Xnew) == 0 || checkallp(Xnew,Wtest,Wvalid) == 0, z(p) = 0; end
                end          
                z = circshift(z,[1,N+1-k]);
                C{B(j)} = nonzeros(z)';
        end        

        L = cellfun(@length,C);
        s = find(X < -1.5 & L == 1); 
        e = find(X < -1.5 & L == 0,1);  
        toc
    end %candidates
end %automp
