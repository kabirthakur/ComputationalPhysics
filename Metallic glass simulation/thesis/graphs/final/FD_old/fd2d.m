clc;
clear;
clf;

dx=1.0;
dy=1.0;
dt=0.005;

D=1;
kappa=0.5;
beta1=0.01 %D*dt/(dx*dx);
beta2=0.01 %D*dt/(dy*dy);
beta3=0.01%(2*kappa*beta1)/(dx*dx);
beta4=0.01%(2*kappa*beta2)/(dy*dy);

N=128;
M=128;
timesteps=10000;

noise=0.02*rand(N,M);
c_0=0.4;
c=c_0+noise;
cold=c;
newc=zeros(N,M);
figure(1)
    pcolor(cold), shading interp, ...
     axis('off'), axis('equal'), title('final composition');
     colorbar;
for t=1:timesteps
  disp(t)
  g=2.*c.*(1.-2.*c).*(1.-c);
  for i=1:N
    for j=1:M
      L=i-1;
      LL=i-2;
      R=i+1;
      RR=i+2;
      U=j-1;
      UU=j-2;
      D=j+1;
      DD=j+2;
      if(LL<1) LL=LL+N;
      end
      if(L<1) L=L+N;
      end
      if(R>N) R=R-N;
      end
      if(RR>N)RR=RR-N ;
      end
      if(UU<1) UU=UU+N;
      end
      if(U<1) U=U+N;
      end
      if(D>N) D=D-N;
      end
      if(DD>N) DD=DD-N ;
      end
      %disp(UU)
      %disp(U)
      %disp(j)
      %disp(D)
      %disp(DD)
     % disp('**********')
      T1=g(R,j)-2*g(i,j)+g(L,j);
      
      T2=g(i,U)-2*g(i,j)+g(i,D);
      
      T3=c(LL,j)-4*c(L,j)+6*c(i,j)-4*c(R,j)+c(RR,j);
      
      T4=c(i,UU)-4*c(i,U)+6*c(i,j)-4*c(i,D)+c(i,DD);
      
      newc(i,j) = c(i,j) + beta1*T1 + beta2*T2 - beta3*T3 - beta4*T4 ;
       %newc(i,j)=c(i,j)+dt*(T1+T2-T3-T4);

    end
  end

  c=newc;
  
end
figure(2)
    pcolor(c), shading interp, ...
     axis('off'), axis('equal'), title('final composition');
     colorbar;