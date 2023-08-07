clear;
clc;
clf;
N=128;
M=N;
dx=1.0;
D=1.0;
k=0.5;
%noise=0.1*rand(N,M);
%c_0=0.4;
%c=c_0+noise;
l=load('c_0.3.mat')
c=l.c
halfN=N/2;
halfM=M/2;
dkx=2*pi/N;
dky=2*pi/M;
dt=2.0;

for timestep=1:80
  disp(timestep)
  g=2.*c.*(1.-c).*(1.-2.*c);
  c_hat=fft2(c);
  g_hat=fft2(g);
  for i=1:N
    for j=1:M
       if((i-1)<=halfN) kx=(i-1)*dkx;
       end
       if((i-1)>halfN) kx=(i-1-N)*dkx;
       end
       if((j-1)<=halfM) ky=(j-1)*dky;
       end
       if((j-1)>halfM) ky=(j-1-N)*dky;
       end
       k2=kx*kx+ky*ky;
       k4=k2*k2;
       c_hat(i,j)=(c_hat(i,j)-D*dt*k2*g_hat(i,j))/(1+2*k*k4*dt);
       %c_hat(i,j)=c_hat(i,j)/(1+2*k*k4*dt);
    end
  end
  c=real(ifft2(c_hat));
end
 figure(1)
    pcolor(c), shading interp, ...
     axis('off'), axis('equal');
     colorbar;
saveas(figure(1),'Figure_x4.png')