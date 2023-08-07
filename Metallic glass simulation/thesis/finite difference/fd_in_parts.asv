clear;
clc;
%simulation factors
N=100;
M=100; %100
%disp("This is ",N, ",",M,"grid")
dx=1.0;
dy=0.01;
dt=1e-6;
%disp("dt=",dt,", dx=",dx," dy=",dy)

%thermodynamic factors
A=1.0
Mob=1.0
k=1.0
noise=0.02*rand(N,M);
c_0=0.48
c=c_0+noise;
framenum=0
%for snap=1:500 % x snapshots every y time steps where we change entire matrix using NxM for loop
  for t=1:5000
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
     axis('off'), axis('equal'), title('final composition');
     colorbar;