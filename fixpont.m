function fixpont(f,t)
    a=input('K�rem a kezd��pontot: ')
    l=1;
    while abs(f(a)-a)>t & l<100
        a=f(a);
        fprintf('A %d l�p�sben a k�zel�t� megold�s: %6f\n',l,a)
        l=l+1;
    end
end
