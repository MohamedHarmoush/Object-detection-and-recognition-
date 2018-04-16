function features = glcmFeatures(img)

glcm1 = GLCM(img,1,0);
glcm2 = GLCM(img,0,1);
glcm3 = GLCM(img,1,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Contrast = glcmContrast(glcm1);
Entropy = glcmEntropy(glcm1);
Energy = glcmEnergy(glcm1);
Homogeneity = glcmHomogeneity(glcm1);
%%%%%%%%%%%%%
glcm = graycomatrix(img, 'Offset', [0 1], 'GrayLimits', [0 5], 'NumLevels', 6, 'Symmetric', false);
E = entropy(glcm);
E = entropy(glcm1);
stats = graycoprops(glcm);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Contrast = Contrast+glcmContrast(glcm2);
Entropy = Entropy+glcmEntropy(glcm2);
Energy = Energy+glcmEnergy(glcm2);
Homogeneity = Homogeneity+glcmHomogeneity(glcm2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Contrast = Contrast+glcmContrast(glcm3);
Entropy = Entropy+glcmEntropy(glcm3);
Energy = Energy+glcmEnergy(glcm3);
Homogeneity = Homogeneity+glcmHomogeneity(glcm3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
features = [Contrast/3,Entropy/3,Energy/3,Homogeneity/3];
end