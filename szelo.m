function szelo(f,t)
    i=input('K�rem a kezd� intervallumot:')
    a=i(1)
    b=i(2)
    if f(a)==0 
        fprintf('Az intervallum els� v�gpontja megold�s!')
        return
    end
    if f(b)==0 
        fprintf('Az intervallum m�sodik v�gpontja megold�s!')
        return
    end
    l=1;
    if f(a)-f(b) == 0
        fprintf('Nem tal�lhat� megold�s, a szel� p�rhuzamos az x tengellyel!')
        return
    end
    p=b-f(b)*(b-a)/(f(b)-f(a));
    while abs(f(p))>=t & l < 100 
        if f(a)-f(b) == 0
            fprintf('Nem tal�lhat� megold�s, a szel� p�rhuzamos az x tengellyel!')
            return
        end
        p=b-f(b)*(b-a)/(f(b)-f(a));
        fprintf('%d. l�p�sben a k�zel�t� gy�k: %6f\n',l,p)
        a=b;
        b=p;
        l=l+1;
    end
end
