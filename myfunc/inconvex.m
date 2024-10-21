function isinconvex = inconvex(convex,pts)
% Test points in convex shape
% pts can be 2*n column vectors

pts = reshape(pts,size(pts,1),1,[]);
v1 = [convex(:,2:end),convex(:,1)]-convex;
v2 = pts-convex;
isinconvex = reshape(all(cross2d(v1,v2)>=0,2),1,[],1);
end