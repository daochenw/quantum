function [ T ] = extraconstraintsdisp( X )
%extracontraints captures constraints as given in the Kleinmann paper pg 8. 
T = 1; N = size(X,4);

%1. repeatablility
%%
for s = 1:N
    %'a'. 'aa','aga','ada','aaa','aba','aca'
    S0 = X(1,1,2,s); O0 = X(1,1,1,s);
    if S0 ~= -2 && O0 ~= -2
        O1 = X(1,1,1,S0);
        if O1 ~= -2 && O1 ~= O0
            T = 0; return, end
        S1 = [X(1,1,2,S0),X(1,2,2,S0),X(1,3,2,S0),X(2,1,2,S0),X(3,1,2,S0)];
        S1 = S1(S1 ~= -2);
        O2 = X(1,1,1,S1); O2 = O2(O2 ~= -2);
        if  any(O2 ~= O0)
            T = 0; disp('R1'), return, end
    end
    %'b'. 'bb',...
    S0 = X(1,2,2,s); O0 = X(1,2,1,s);
    if S0 ~= -2 && O0 ~= -2
        O1 = X(1,2,1,S0);
        if O1 ~= -2 && O1 ~= O0
            T = 0; return, end
        S1 = [X(1,1,2,S0),X(1,2,2,S0),X(1,3,2,S0),X(2,2,2,S0),X(3,2,2,S0)];
        S1 = S1(S1 ~= -2);
        O2 = X(1,2,1,S1); O2 = O2(O2 ~= -2);
        if  any(O2 ~= O0)
            T = 0; disp('R1'),return, end
    end
    %'c'
    S0 = X(1,3,2,s); O0 = X(1,3,1,s);
    if S0 ~= -2 && O0 ~= -2
        O1 = X(1,3,1,S0);
        if O1 ~= -2 && O1 ~= O0
            T = 0; return, end
        S1 = [X(1,1,2,S0),X(1,2,2,S0),X(1,3,2,S0),X(2,3,2,S0),X(1,3,2,S0)];
        S1 = S1(S1 ~= -2);
        O2 = X(1,3,1,S1); O2 = O2(O2 ~= -2);
        if  any(O2 ~= O0)
            T = 0;disp('R1'), return, end
    end
    %'d'
    S0 = X(2,1,2,s); O0 = X(2,1,1,s);
    if S0 ~= -2 && O0 ~= -2
        O1 = X(2,1,1,S0);
        if O1 ~= -2 && O1 ~= O0
            T = 0; return, end
        S1 = [X(2,1,2,S0),X(2,2,2,S0),X(2,3,2,S0),X(1,1,2,S0),X(3,1,2,S0)];
        S1 = S1(S1 ~= -2);
        O2 = X(2,1,1,S1); O2 = O2(O2 ~= -2);
        if  any(O2 ~= O0)
            T = 0; disp('R1'), return, end
    end
    %'e'
    S0 = X(2,2,2,s); O0 = X(2,2,1,s);
    if S0 ~= -2 && O0 ~= -2
        O1 = X(2,2,1,S0);
        if O1 ~= -2 && O1 ~= O0
            T = 0; return, end
        S1 = [X(2,1,2,S0),X(2,2,2,S0),X(2,3,2,S0),X(1,2,2,S0),X(3,2,2,S0)];
        S1 = S1(S1 ~= -2);
        O2 = X(2,2,1,S1); O2 = O2(O2 ~= -2);
        if  any(O2 ~= O0)
            T = 0; disp('R1'),return, end
    end
    %'f'
    S0 = X(2,3,2,s); O0 = X(2,3,1,s);
    if S0 ~= -2 && O0 ~= -2
        O1 = X(2,3,1,S0);
        if O1 ~= -2 && O1 ~= O0
            T = 0; return, end
        S1 = [X(2,1,2,S0),X(2,2,2,S0),X(2,3,2,S0),X(1,3,2,S0),X(3,3,2,S0)];
        S1 = S1(S1 ~= -2);
        O2 = X(2,3,1,S1); O2 = O2(O2 ~= -2);
        if  any(O2 ~= O0)
            T = 0; disp('R1'),return, end
    end
    %'g'
    S0 = X(3,1,2,s); O0 = X(3,1,1,s);
    if S0 ~= -2 && O0 ~= -2
        O1 = X(3,1,1,S0);
        if O1 ~= -2 && O1 ~= O0
            T = 0; return, end
        S1 = [X(3,1,2,S0),X(3,2,2,S0),X(3,3,2,S0),X(2,1,2,S0),X(1,1,2,S0)];
        S1 = S1(S1 ~= -2);
        O2 = X(3,1,1,S1); O2 = O2(O2 ~= -2);
        if  any(O2 ~= O0)
            T = 0;disp('R1'), return, end
    end
    %'h'
    S0 = X(3,2,2,s); O0 = X(3,2,1,s);
    if S0 ~= -2 && O0 ~= -2
        O1 = X(3,2,1,S0);
        if O1 ~= -2 && O1 ~= O0
            T = 0; return, end
        S1 = [X(3,1,2,S0),X(3,2,2,S0),X(3,3,2,S0),X(2,2,2,S0),X(1,2,2,S0)];
        S1 = S1(S1 ~= -2);
        O2 = X(3,2,1,S1); O2 = O2(O2 ~= -2);
        if  any(O2 ~= O0)
            T = 0; disp('R1'),return, end
    end
    %'i'
    S0 = X(3,3,2,s); O0 = X(3,3,1,s);
    if S0 ~= -2 && O0 ~= -2
        O1 = X(3,3,1,S0);
        if O1 ~= -2 && O1 ~= O0
            T = 0; return, end
        S1 = [X(3,1,2,S0),X(3,2,2,S0),X(3,3,2,S0),X(2,3,2,S0),X(1,3,2,S0)];
        S1 = S1(S1 ~= -2);
        O2 = X(3,3,1,S1); O2 = O2(O2 ~= -2);
        if  any(O2 ~= O0)
            T = 0;disp('R1'), return, end
    end
end

%2. contradictions and other tables 1
%%
%j = 3;
for k = 1:N
    col = X(:,3,1,k);
    if any(col == -2), continue,
    elseif prod(col) ~= -1
        col = X(:,3,2,k);
        col_1 = col(col == -2); l = length(col_1);
        if l >= 2; continue,
        else col = col(col ~= k & col ~= -2);
            if length(unique(col)) + l < 2
                T = 0;disp('R2'), return, end
        end
        
    end
end
for j = 1:2
    for k = 1:N
        col = X(:,j,1,k);
        if any(col == -2), continue,
        elseif prod(col) ~= 1
            col = X(:,j,2,k);
            col_1 = col(col == -2); l = length(col_1);
            if l >= 2; continue,
            else col = col(col ~= k & col ~= -2);
                if length(unique(col)) + l < 2
                    T = 0; disp('R2'), return, end
            end
        end
    end
end
for i = 1:3
    for k = 1:N
        row = X(i,:,1,k);
        if any(row == -2), continue,
        elseif prod(row) ~= 1
            col = X(i,:,2,k);
            col_1 = col(col == -2); l = length(col_1);
            if l >= 2; continue,
            else col = col(col ~= k & col ~= -2);
                if length(unique(col)) + l < 2
                    T = 0; disp('R2'),return, end
            end
        end
    end
end

%3. pigeonhole
%%
% return for impossible puzzles 2.
CONTRADICTIONS = -2*zeros(N,6);
for s = 1:N
    for i = 1:3
        r1 = X(mod(i,3)+1,:,2,s); r2 = X(mod(i+1,3)+1,:,2,s);
        r1 = r1(r1 == s); r2 = r2(r2 == s);
        if length(r1) >= 2 && length(r2) >= 2
            CONTRADICTIONS(s,i) = 1; continue
        end
        
        prod_r= prod(X(i,:,1,s));
        if  prod_r == -1
            CONTRADICTIONS(s,i) = 1;
        end
    end
    
    for j = 4:6
        c1 = X(:,mod(j-3,3)+1,2,s); c2 = X(:,mod(j-3+1,3)+1,2,s);
        c1 = c1(c1 == s); c2 = c2(c2 == s);
        if length(c1) >= 2 && length(c2) >= 2
            CONTRADICTIONS(s,j) = 1;
        end
        
        prod_c= prod(X(:,j-3,1,s));
        if prod_c == -1 && j < 6
            CONTRADICTIONS(s,j) = 1;
        end
        
        if  prod_c == 1 && j == 6
            CONTRADICTIONS(s,j) = 1;
        end
    end
end

for j = 1:6
    if N-length(find(CONTRADICTIONS(:,j) == 1)) < 2
        T = 0; disp('R3'),return
    end
end

for i = 1:3
    F = find(CONTRADICTIONS(:,i) == 1);
    for s = 1:length(F) 
    for j = 1:3   
        if X(i,j,1,F(s)) == -2, continue, end
        nonrep = length(find(X(i,j,1,:) == -X(i,j,1,F(s))));
        contra_nonrep = length(find(X(i,j,1,F(:)) == -X(i,j,1,F(s))));   
        if N-(length(F) + nonrep - contra_nonrep) < 2
        T = 0; disp('R3'),return
        end
    end
    end
end

for j = 4:6
    F = find(CONTRADICTIONS(:,j) == 1);
    for s = 1:length(F) 
    for i = 1:3   
        if X(i,j-3,1,F(s)) == -2, continue, end
        nonrep = length(find(X(i,j-3,1,:) == -X(i,j-3,1,F(s))));
        contra_nonrep = length(find(X(i,j-3,1,F(:)) == -X(i,j-3,1,F(s))));   
        if N-(length(F) + nonrep - contra_nonrep) < 2
        T = 0; disp('R3'),return
        end
    end
    end
end
        

%4. condition for fixing the memory
%%
D = zeros(1,N);
for i = 1:3
    for j = 1:3
        for k =1:N
            D(k)=X(i,j,1,k);
        end
        if any(D == -2), continue, end;
        f1 = find(D == 1); f2 = find(D == -1);
        if length(f1) == 1; X_R = X(i,:,2,f1); X_C = X(:,j,2,f1);
            if ~isempty(find(X_R ~= -2 & X_R ~= f1,1)), T = 0; disp('R4'), return, end,
            if ~isempty(find(X_C ~= -2 & X_C ~= f1,1)), T = 0;disp('R4'), return, end,
        end
        
        if length(f2) == 1; X_R = X(i,:,2,f2); X_C = X(:,j,2,f2);
            if ~isempty(find(X_R ~= -2 & X_R ~= f2,1)), T = 0; disp('R4'),return, end,
            if ~isempty(find(X_C ~= -2 & X_C ~= f2,1)), T = 0; disp('R4'),return, end,
        end
    end
end

%5. contradictions and other tables 2
%%
for j = 3
    P = zeros(1,N);
    for k = 1:N
        P(k) = prod(X(:,3,1,k));
    end
    
    P_1 = P(abs(P) ~= 1); l = length(P_1);
    
    if l >= 2; continue,
    else
        P = P(abs(P) == 1);
        if any(P ~= -1)
            F = find(P == -1); %indices of the correct columns.
            if length(F)+l < 2, T = 0; disp('R5'),return, end;
            
            if l == 0
                col_correct = zeros(3,length(F));
                for k0 = 1:length(F)
                    col_correct(:,k0) = X(:,3,1,F(k0));
                end
                col_correct_unique = unique(col_correct.','rows').';
                if size(col_correct_unique,2) < 2, T = 0; disp('R5'), return, end
            end
        end
    end
end
for j = 1:2
    P = zeros(1,N);
    for k = 1:N
        P(k) = prod(X(:,j,1,k));
    end
    
    P_1 = P(abs(P) ~= 1); l = length(P_1);
    
    if l >= 2; continue,
    else
        P = P(abs(P) == 1);
        if any(P ~= 1)
            F = find(P == 1); %indices of the correct columns.
            if length(F)+l < 2, T = 0; disp('R5'),return, end;
            
            if l == 0
                col_correct = zeros(3,length(F));
                for k0 = 1:length(F)
                    col_correct(:,k0) = X(:,j,1,F(k0));
                end
                col_correct_unique = unique(col_correct.','rows').';
                if size(col_correct_unique,2) < 2, T = 0;  disp('R5'),return, end
            end
        end
    end
end
for i = 1:3
    P = zeros(1,N);
    for k = 1:N
        P(k) = prod(X(i,:,1,k));
    end
    
    P_1 = P(abs(P) ~= 1); l = length(P_1);
    
    if l >= 2; continue,
    else
        P = P(abs(P) == 1);
        if any(P ~= 1)
            F = find(P == 1); %indices of the correct rows.
            if length(F)+l < 2, T = 0; disp('R5'),return, end;
            
            if l == 0
                row_correct = zeros(length(F),3);
                for k0 = 1:length(F)
                    row_correct(k0,:) = X(i,:,1,F(k0));
                end
                row_correct_unique = unique(row_correct.','rows').';
                if size(row_correct_unique,1) < 2, T = 0; disp('R5'), return, end
            end
        end
    end
end


% %5. heuristic uniqueness
% %%
% for k = 1:2
% for i = 1:N
%     for j = 1:N
%         if j==i
%         continue;
%         end
%         W0 = X(:,:,k,i); W = X(:,:,k,j);
%         if any(W0(:) == -2) == 0 && any(W(:) == -2) == 0;
%         t = isequal(W0,W);
%         if t == 1, T = 0; return, end
%         end
%     end
% end
% end

