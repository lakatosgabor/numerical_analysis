%% a,b az intervvalum amit mi adunk meg
function intfel(f,a,b,t)
    if f(a)*f(b)>0
        fprintf('Nem ellent�tes el�jel� az intervallum!\n')
        return
    end
    l=1;
    while abs(b-a)>=t & l < 100,
        c=(a+b)/2;
        if f(a)*f(c) < 0 
            b=c;
        elseif f(b)*f(c) < 0
            a=c;
        else
            fprintf('%d. l�p�sben a pontos megold�s: %6f\n',l,c)
            return
        end
        fprintf('%d. l�p�sben a k�zel�t� megold�s: %6f\n',l,c)
        l=l+1;
    end
end