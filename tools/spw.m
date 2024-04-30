function xi = spw(sigma,Lambda,p)
xi=zeros(size(sigma));
if p==1
    for i=1:sum(sigma>Lambda)
        xi(i)=sigma(i)-Lambda;
    end
else
    yu = (2*Lambda*(1-p))^(1/(2-p));
    yu = yu+Lambda*p*yu^(p-1);
    idx = find(sigma>yu);
    if idx>0
        xi(idx)=sigma(idx);
        for j = 1:3        
            xi(idx)=sigma(idx)-Lambda*p.*(xi(idx)).^(p-1);
        end
    end
end
end