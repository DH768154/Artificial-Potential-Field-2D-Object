function [newpt,T] = HomTran2d(theta,trans,pt)
R = [cos(theta) -sin(theta);sin(theta) cos(theta)];
newpt = R*pt+trans;
if nargout>1
T = [R,trans;0,0,1];
end
end