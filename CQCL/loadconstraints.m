clear; clc
%Y = num2cell([perms('abc');perms('cfi');perms('def');perms('ghi');perms('adg');perms('beh');'aaa';'bbb';'ccc';'ddd';'eee';'fff';'ggg';'hhh';'iii'],2);
% 'aaa';'bbb';'ccc';'ddd';'eee';'fff';'ggg';'hhh';'iii'
%Y = {'abc','cfi'};
%Y = num2cell(permn('a':'i',3),2);

%Y = num2cell([perms('abc');perms('cfi');perms('def');perms('ghi');perms('adg');perms('beh')],2);

%Y = union(Y,{'aa';'bb';'cc';'dd';'ee';'ff';'gg';'hh';'ii';...
   %'abfhc';'dechf';'gicfh';'adihg';'beghi';'cfgih'});
   
  
%alpha='a':'i';
%Y = alpha(randi(numel(alpha),1,20));

[Wtest, Wvalid] = prec({...
   'fdif','feif','igfi','ihfi','fci','ifc','fic','icf','cif','cfi','abc','cba','bac','def','efd','fde','ghi','hig','igh'});
 
 %[Wtest1, Wvalid1] = prec(union(Y, {'aa';'bb';'cc';'dd';'ee';'ff';'gg';'hh';'ii';'cfi';'abc'}));
 
X = -2*ones(3,3,2,4);
X(:,3,1,2) = [-2 2 3];
X(:,3,1,1) = [1 1 1];
X(:,3,1,2) = [1 1 -1];
X(:,3,1,3) = [1 -1 1];
X(:,3,1,4) = [-1 1 1];
%tic; U = automp(X,Wtest,Wvalid); toc
