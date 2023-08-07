clear;
clc;
clf;

N=128;
M=128; 


dx=1.0;
dy=1.0;
dt=0.001;


kappa=0.5
Mob=1.0

%c_0=0.4
%c=c_0+0.02*rand(N,M);
l=load('c.mat')
c=l.c


  for t=1:40000
    disp(t)
    g=2.*c.*(1.-2.*c).*(1.-c);
    d=lap(c);
    cnew=c+dt*Mob*lap(g-(kappa*2).*d);
    c=cnew;
  end

figure(1)
  pcolor(c), shading interp, ...
  axis('off'), axis('equal');
  colorbar;
   