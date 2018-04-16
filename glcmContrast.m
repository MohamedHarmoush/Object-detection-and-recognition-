function C = glcmContrast(glcm)
contrast_framework = zeros(6,6);
C = 0;
for y=1:6
    for x=1:6
        contrast_framework(y,x) = ((y-x).^2).*(glcm(y,x));
        C = C + contrast_framework(y,x);
    end
end
end

