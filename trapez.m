function trapez(f,a,b)
    n=input('H�ny r�szre osszuk az intervallumot? ');
    h=(b-a)/n;
    x=a:h:b;
    m=f(a)+f(b);
%    m2=f(a)+f(b)
%    for i=1:n-1
    for i=2:n   
        m=m+2*f(x(i));
%        m2=m2+2*f(a+i*h)
    end
    m=h/2*m;
%    m2=m2*h/2
    fprintf('A k�zel�t� integr�l %d r�szre osztva az intervallumot: %6f\n',n, m)
end