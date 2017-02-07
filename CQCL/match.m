function [ x , y ] = match( w, re )
%

x = zeros(1,length(w)); y = zeros(1,length(w)); i = 1;
[a,b] = regexp(w,re,'once'); 
if isempty(a) == 1,return, end

x(1) = a; y(1) = b;
while isempty(w) == 0
w = w(b:length(w));
[a,b] = regexp(w,re,'once');
if isempty(a) == 0
x(i+1) = y(i)+a-1; y(i+1) = x(i+1)+b-a;
end
i = i+1;
end
x = nonzeros(x)';
y = nonzeros(y)';
end

