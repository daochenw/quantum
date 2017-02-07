function [ O , o ] = mealy( X ,w ,k )
%Given a Mealy machine X, input word w and starting state k, T == 1 means
%this mealy machine does not have sufficient information to give an output
%for input word w. Else T == 0 and O is the output sequence for w. 
 
L = length(w);
S = zeros(1,L); %state sequence
O = cell(1,L); %letter and output sequence

o = zeros(1,L);
S(1) = k; %start from state k 

% build output sequence O from word w
for i = 2:L   
    e = w{i-1};
    t = X(e(1),e(2),1,S(i-1));  
    O{i-1} = [e(1),e(2),t];
    o(i-1) = t;
    S(i) = X(e(1),e(2),2,S(i-1));
    if S(i) < 0,
        for j=i:L
        e = w{j};
        entry = X(e(1),e(2),1,:);
        if length(unique(entry)) == 1
            O{j} = [e(1),e(2),entry(1)];
            o(j) = entry(1);
        end
        O = O(~cellfun('isempty',O));
        o = nonzeros(o);
        end
        return, 
    end     
end

e = w{L};
t = X(e(1),e(2),1,S(L));
O{L}= [e(1),e(2),t];
o(L) = t;
end

