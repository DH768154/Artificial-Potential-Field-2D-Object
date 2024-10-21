function [pt_proj,r] = proj2line(line,pt,varargin)
% r<0, close to 1st point. r>1, close to 2nd point. otherwise, on line. 
%
% point projection on line/line segment
% line = [x1,x2;y1,y2], column vector define 2 points
% support 3D column vector to define multi line
% support 2D column vector to define multi points
% if line is a point, return this point

v = line(:,2,:)-line(:,1,:);
if size(line,3) == 1 && all(v==0)
    pt_proj = line(:,1);
    r = NaN;
    return
end


u = pt-line(:,1,:);

r = sum(u.*v,1)./sum(v.^2,1);

%% closest point to the line
if ~isempty(varargin)
    if strcmpi(varargin{1},'bound')
        r(r>1) = 1; r(r<0) = 0;
    else
        error('Optional Input can only be ''bound''')
    end
end

%% projection or closest point
pt_proj = line(:,1,:)+r.*v;
pt_proj(:,:,all(v==0,1)) = line(:,1,all(v==0,1));

if size(line,3) > 1
    pt_proj = reshape(pt_proj, size(pt_proj,1),[],1);
    r = reshape(r,1,[],1);
end

%%

end