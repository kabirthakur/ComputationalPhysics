x=0.001:0.001:0.999;

alpha=1.0;
for i=1:8
  alpha=alpha+0.5;
  plot(x,G(x,alpha));
  hold on;
end
