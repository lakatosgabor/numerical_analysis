function kozeppont(f,a,b)
n=input('H�ny r�szre osszuk az intervallumot? ');
h=(b-a)/n;
x=a:h:b;
m=0;
for i=1:n
   m=m+f((x(i)+x(i+1))/2);
end
m=h*m;
fprintf('A k�zel�t� integr�l %d r�szre osztva az intervallumot: %6f\n',n, m)
end