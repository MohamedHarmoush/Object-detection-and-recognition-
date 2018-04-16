function Eglcm = glcmEntropy(glcm)
Entropy_framework = zeros(6,6);
Eglcm = 0;
for y=1:6
    for x=1:6
        if glcm(y,x) == 0
            continue;
        end
        Entropy_framework(y,x) = double(glcm(y,x).*(log2(glcm(y,x))));
        Eglcm = double(Eglcm + Entropy_framework(y,x));
    end
end
Eglcm = -Eglcm;
end

