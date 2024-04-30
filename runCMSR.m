function  label = runCMSR(X, cntCls,alpha ,beta,lambda,gama,knn,p)

%%
maxIters = 100;
nView = length(X);  % 视图数
nSample = size(X{1},2); %  样本数
mu = 1; 
Y = zeros(nSample);
S = zeros(nSample);
max_mu = 10^6;
rho = 1.5;
Obj = [];

%% Initialization
[L,G] = constructG(X, knn, nView, nSample);
[C,E,sumL,sumHH]  = Initialization(X,L,G,nView, nSample); %S=G
temp_inv = cell(1,nView);
temp = cell(1,nView);

%% Alternate minizing strategy
for t = 1:maxIters
    %% ------------- update H-------------
    H=solveH(alpha,E,S,X,nView, nSample);   
    L=constructL(H, knn, nView, nSample);
    %% ------------- update S -------------
    S = solveS(alpha,sumHH,sumL , L, H, C, E, Y, mu, beta, nView, nSample); 
    %% ------------- update C -------------
    C = solveC(S, Y, mu, lambda,p);    
    %% ------------- update E ------------- 
    for v = 1:nView
     temp{v}=alpha*H{v}' * H{v} + gama*eye(nSample);
     temp_inv{v}=inv(temp{v});
    end 
    E = solveE(alpha,H, S, temp_inv, nView, nSample); 
    %% ------------- update Y -------------
    Y = Y + mu*(S-C);
    mu = min(max_mu,rho*mu);    
    
    %%   check convergence
    err = S-C;
    err2= max(abs(err(:)));
    Obj(t)=err2;
    if err2 < 1e-4 && t>15
        break;
    end
    
end
%%

W = (C'+C)/2;
[label, ~] = SpectralClustering(W, cntCls);
