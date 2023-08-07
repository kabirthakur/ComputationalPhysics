clear;
c=rand(2,2);
g=2.*c.*(1.-2.*c).*(1.-c)
for i=1:2
  for j=1:2
    f(i,j)=2*c(i,j)*(1-c(i,j))*(1-2*c(i,j));
  end
end
disp(f)