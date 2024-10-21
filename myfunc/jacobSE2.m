function J = jacobSE2(x,y,theta)

n = numel(x);
if n>1
    x = reshape(x,1,1,n);
    y = reshape(y,1,1,n);
    if numel(theta)==n
        theta = reshape(theta,1,1,n);
    elseif numel(theta)==1
        theta = theta.*ones(1,1,n);
    end
end

J = NaN(2,3,n);
J(:,1:2,:) = eye(2).*ones(1,1,n);

c = cos(theta); s = sin(theta);
J(1,3,:) = -y.*c-x.*s;
J(2,3,:) =  x.*c-y.*s;

end