function minv(A)
s=size(A);
if s(1)~=s(2)
  fprintf('Invert�lni n�gyzetes m�trixot lehet!')
  return
elseif det(A)==0
  fprintf('Szingul�ris m�trix!')
  return  
end
n=s(1);
A=[A,eye(n,n)];
disp('0. l�p�s:')
disp(A)
for i=1:n
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
  A(i,:)=A(i,:)/A(i,i)
end
fprintf('Az inverz m�trix:\n')
disp(A(:,n+1:2*n))
end