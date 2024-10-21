function [closestpt,mindist] = closestpt2Shape2d(pt,O)
if numel(O) == size(O,1) && numel(O) ~= 1
    O = O';
end

isinconvex = any(cellfun(@(x) inconvex(x,pt), O));


projpt = cellfun(@(O) proj2line(polygon2lineseg(O),pt,'bound'),O,'UniformOutput',false);
dist = cellfun(@(x) sqrt(sum((x-pt).^2)),projpt,'UniformOutput',false);
[mindist,minidx] = cellfun(@(x) min(x,[],2),dist,'UniformOutput',false);
closestpt = cellfun(@(pt,indx) pt(:,indx), projpt,minidx,'UniformOutput',false);
closestpt = cell2mat(closestpt);

if isinconvex
    mindist = 0;
else
    mindist = cell2mat(mindist);
end

end