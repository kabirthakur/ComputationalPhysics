clear 
clf
clc
nx = 5;
ny = 5;
for i = 1:nx
  for j = 1:ny
    comp = 0.5;
    c(i,j) = comp + 0.05*rand(); % initial profile 
  end
 end 
%surf(c);
%shading interp;
%view(2);
%pause(0);
%l=load('c.mat');
%c=l.c;
% for implimentation of periodic boundary condition
dt = 0.5;
hnx = nx/2;
hny = ny/2;
dkx = 2*pi/nx;
dky = 2*pi/ny;

A = 1.0;
M = 1.0;
kappa = 0.5;
for m = 1:1 %1:10
  for n = 1:1 % inner time loop #1:8
    g =2.*c.*(1.-c).*(1.-2.*c);


    gt = fft2(g); % 2D fourier transform
    ct = fft2(c);
    % implementating PBC

     for j = 1:ny
            for i = 1:nx
     if ((i-1) <= hnx), kx = (i-1)*dkx;
     end
     if ((i-1) >hnx), kx = (i-1-nx)*dkx;
     end
     
      if ((j-1) <= hny), ky = (j-1)*dky;
      end
     if ((j-1) >hny), ky = (i-1-ny)*dky;
     end
     disp(i)
      k2 = kx*kx + ky*ky;
      k4 = k2*k2;
      ct(i,j) = (ct(i,j)- M*dt*k2*gt(i,j))/(1+2*M*kappa*k4*dt);

     end
   end
   c = real(ifft2(ct));
  end
  %surf(c);
  %shading interp;
  figure(2)
    pcolor(c), shading interp, ...
     axis('off'), axis('equal'), title('final composition');
     colorbar;
  %view(2);
  %pause(0);
end