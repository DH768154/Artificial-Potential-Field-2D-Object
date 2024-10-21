function lineseg = polygon2lineseg(shape)
shape = ptsloop(shape);
shap3reshape = reshape(shape,2,1,[]);
lineseg = [shap3reshape(:,:,1:end-1),shap3reshape(:,:,2:end)];
end