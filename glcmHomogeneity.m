function H = glcmHomogeneity(glcm)
Homo_framework = zeros(6,6);
H = 0;
for y=1:6
    for x=1:6
        Homo_framework(y,x) = glcm(y,x)./(1 + abs(y-x).^2);
        H = H + Homo_framework(y,x);
    end
end

end

