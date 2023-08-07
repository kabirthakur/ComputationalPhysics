clear;
clf;
dt=0.001;
dx=1.0;
D=1.0;
kappa=0.5;
beta1=D*dt/(dx*dx);
%beta2=2*kappa*beta1/(dx*dx)  ;
beta2=0
n=32;
timesteps=40000;
clf
hold on
m=1;
for i=1:n
  oldc(i)=0.5*(1+sin(2*pi*m*i*dx/n));
  newc(i)=0;
end
plot(oldc,'b')
%for i=1:n
% g(i)=2.*oldc(i)*(1-oldc(i))*(1-2.*oldc(i));
%end
for i=1:timesteps
    disp(i)
    for i=1:n
        g(i)=2.*oldc(i)*(1-oldc(i))*(1-2.*oldc(i));
    end
  for i=1:n
    w=i-1;
    ww=i-2;
    e=i+1;
    ee=i+2;
    if(ww<1) ww=ww+n;
    end
    if(w<1) w=w+n;
    end
    if(e>n) e=e-n;
    end
    if(ee>n)ee=ee-n ;
    end
    newc(i)=oldc(i)+beta1*(oldc(w)+oldc(e)-2*oldc(i));
  end
  for i=1:n
  oldc(i)=newc(i);
  end
end
plot(oldc,'r')