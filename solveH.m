function H = solveH(alpha,E,S,X,V,n)

for v=1:V
    A = X{v}' * X{v};
    B = alpha*(eye(n)-E{v}-S-E{v}'-S'+E{v}*E{v}'+E{v}*S'+S*E{v}'+S*S');
    C = -X{v}' * X{v};
    H{v}  = lyap(A,B,C);
end






