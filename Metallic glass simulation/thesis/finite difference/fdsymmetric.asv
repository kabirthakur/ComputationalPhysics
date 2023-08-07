clear;
clc;
%simulation factors
N=200;
M=200; %100
%disp("This is ",N, ",",M,"grid")
dx=1.0;
dy=1.0;
dt=0.01;
%disp("dt=",dt,", dx=",dx," dy=",dy)

%thermodynamic factors
A=0.5
Mob=1.0
k=0.5
noise=0.02*rand(N,M);
c_0=0.48
c=c_0+noise;
framenum=0

  for t=1:25000
    disp(t)
    for i=1:N
      for j=1:N
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
        
        % COMPUTE DEL sq c
        dsq_c(i,j)= (c(L,j)+c(R,j)+c(i,U)+c(i,D)-4*c(i,j))/((dx)^2);
        %compute theta
        theta(i,j)=2*c(i,j)*(1-c(i,j))*(1-2*c(i,j))-2*k*dsq_c(i,j);
        
        
      end
    end
   for i=1:N
     for j=1:N
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
      
        del_sq_theta(i,j)=(theta(L,j)+theta(R,j)+theta(i,U)+theta(i,D)-4*theta(i,j))/((dx)^2);
        
     end
   end
     for i=1:N
        for j=1:N
            c_new(i,j)=c(i,j)+dt*Mob*del_sq_theta(i,j);
         end
     end
   c=c_new;
end
   figure(1)
    pcolor(c), shading interp, ...
     axis('off'), axis('equal'), title('initial composition');
     colorbar;
