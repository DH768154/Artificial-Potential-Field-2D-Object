function crossprod = cross2d(a,b)
% calculate cross product for 2d column vectors
% for vectorize calculation
% a,b can be 2*n vectors
% size(a) = [2,n], size(b) = [2,n]
% size(a) = [2,n], size(b) = [2,1]
% size(a) = [2,1], size(b) = [2,n]

crossprod = a(1,:,:).*b(2,:,:)-a(2,:,:).*b(1,:,:);
end