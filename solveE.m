function E = solveE(gama,H, S, temp_inv, V, n)

temp1 = (eye(n) - S);
for v = 1:V
    temp2 =gama* H{v}'*H{v}*temp1;
    E{v} = temp_inv{v} * temp2;
end
        