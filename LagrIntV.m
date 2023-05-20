function LagrIntV(x,y)
if length(x)~=length(y)
  fprintf('Rossz vektorokat adott meg!\n')
  return
end
n=length(x);
for i=1:n
  for j=1:n
    V(i,j)=x(i)^(j-1);
  end
end
if det(V)==0
  disp('K�t azonos x �rt�ket adott meg!')
  abort
  else
    disp('A Vandermonde m�trix:')
    disp(V)
    disp('A Vandermonde m�trix determin�nsa:')
    disp(det(V))
    a=V\y;
    disp('A polinom egy�tthat�i:')
    disp(a)
end
end
