function S = solveS(alpha,sumHH,sumL ,L,H,C,E,Y,mu,beta,V,n)
for v=1:V
     sumHH = sumHH +H{v}'* H{v};
     sumL = sumL + L{v};
end

A_syl = 2*alpha*sumHH + mu*eye(n);
B_syl = 2*beta*sumL;
C_syl = mu*C - Y;
for v=1:V
%     C_syl = C_syl + 2*XX{v}*(eye(n) - E{v}); 
      C_syl = C_syl + 2*alpha*H{v}'* H{v}*(eye(n) - E{v});
end
S = lyap(A_syl,B_syl,-C_syl);