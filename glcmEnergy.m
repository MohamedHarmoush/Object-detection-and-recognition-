function Eneg = glcmEnergy(glcm)
Energy_framework = zeros(6,6);
Eneg = 0;
for y=1:6
    for x=1:6
        Energy_framework(y,x) = glcm(y,x).^2;
        Eneg = Eneg + Energy_framework(y,x);
    end
end

end

