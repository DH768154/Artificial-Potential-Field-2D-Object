function xy_loop = ptsloop(xy,varargin)

if nargin == 2
    ind = varargin{1};
else
    ind = 1;
end

if isa(xy,'cell')
    xy_loop = cellfun(@(x) [x,x(:,1:ind,:)],xy,'UniformOutput',false);
else
    xy_loop = [xy,xy(:,1:ind,:)];
end
end