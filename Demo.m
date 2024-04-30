warning off;
clc;
clear all;

addpath(genpath('./tools/'));
addpath(genpath('./data/'));
 
load('yale_newdouble','gt','X'); 
% gt: ground truth label
% X: input datas

%%
for iv = 1:length(X)     %πÈ“ªªØ
    X1 = NormalizeFea(X{iv},0) ;
    Q{iv} = X1;                         
end
clear X X1 ;
X = Q;
clear Q;
K = numel(unique(gt)); % number of clusters

%% parameters
alpha  = 1;   
beta = 0.01;  
lambda= 0.01;  
gama = 10;  
knn = 2;
p = 0.2;   

%%
label = runCMSR(X, K, alpha,beta, lambda, gama,knn,p);

%%
[ACC, NMI, PUR] = ClusteringMeasure(gt,label);
[F,P,R] = compute_f(gt,label);
result = [ACC NMI PUR F P R];
disp(result);

