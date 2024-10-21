function state = bound2range(state,range)
% state: row vector
% range: 1 row is lower bound, 2nd row is upper bound
flip = false;
if size(state,1)~=1
    flip = true;
    state = state';
    range = range';
end

ind_lb = range(1,:)>state;
ind_ub = range(2,:)<state;
state(ind_lb) = range(1,ind_lb);
state(ind_ub) = range(2,ind_ub);

if flip
    state = state';
end
end