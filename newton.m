function newton(f,df,t)
    a=input('K�rem a kezd�pontot: ')
    if f(a)==0 | abs(f(a))<t
        fprintf('A kezd�pont megold�s!')
        return
    end
    l=1;
    while abs(f(a))>=t & l < 100
    if df(a) == 0
        fprintf('Nem tal�lhat� megold�s, az �rint� p�rhuzamos az x tengellyel!')
        return
    end
    a=a-f(a)/df(a);
    fprintf('%d. l�p�s ut�n a k�zel�t� megold�s: %6f\n',l,a)
    l=l+1;
    end
end
