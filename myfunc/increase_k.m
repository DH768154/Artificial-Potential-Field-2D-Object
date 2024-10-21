function k = increase_k(pct,k0,kmax,x)
k = (sin(pi/pct.*x+pi/2)+1).*(kmax-k0)/2+k0;
end