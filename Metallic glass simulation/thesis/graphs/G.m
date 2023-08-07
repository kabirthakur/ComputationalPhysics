function y=G(x,alpha)
  dH=alpha.*x.*(1.-x);
  dS=x.*log(x)+(1.-x).*log(1.-x);
  y=dH+dS;
end
