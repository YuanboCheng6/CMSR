function [Z,E,sumL,sumHH] = Initialization(X,L,S,V, n)

%% Initialization 
E = cell(1,V);
H = cell(1,V);
XX = cell(1,V);
sumXX = zeros(n,n);
sumHH = zeros(n,n);
sumL = zeros(n,n);
sumS = zeros(n,n);
for v = 1:V    
    E{v} = zeros(n);   
    H{v} = zeros(n);   
    XX{v} = X{v}' * X{v}; 
    sumXX = sumXX + XX{v};   
%     sumL = sumL + L{v};
    sumS = sumS + S{v};
end
% Z = 1/V * sumS;
Z = zeros(n,n);