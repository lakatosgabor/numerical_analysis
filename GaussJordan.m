function GaussJordan(A,b)
sA=size(A);
sb=size(b);
if sA(1)~=sA(2) | sA(1)~=sb(1) | sb(2)~=1
  fprintf('Nem j�k a param�terek!')
  return
end
n=sA(1);
A=[A,b];
disp('0. l�p�s:')
disp(A)
for i=1:n
  if A(i,i)== 0
    fprintf('F��tl�ban 0 �rt�k van, az elimin�ci� le�ll!')
    return
  end
  for j=1:n
    if i~=j
      kiv=A(j,i)/A(i,i);
      A(j,:)=A(j,:)-kiv*A(i,:);
    end
  end
  fprintf('%d. l�p�sben az iter�ci�s m�trix:\n',i)
  disp(A)
end
for i=1:n
  A(i,n+1)=A(i,n+1)/A(i,i)
  A(i,i)=A(i,i)/A(i,i)
end
fprintf('A megold�s az al�bbi m�trixb�l olvashat� ki:\n')
disp(A)
end