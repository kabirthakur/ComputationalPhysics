function f=lap(c)
  dx=1.0;
  N=size(c,1);
  for i=1:size(c,1)
      for j=1:size(c,2)
        % PBC
        L=i-1;
        R=i+1;
        U=j-1;
        D=j+1;
        if(L==0) L=N;
        end
        if(R==N+1) R=R-N;
        end
        if(U==0) U=N;
        end
        if(D==N+1) D=D-N;
        end
      f(i,j)=(c(L,j)+c(R,j)+c(i,U)+c(i,D)-4*c(i,j))/((dx)^2);
        end
     end
  end