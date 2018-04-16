function glcm = GLCM(img,yp,xp)
framework = zeros(6,6);
normframework = zeros(6,6);
symmframework = zeros(6,6);
[h,w] = size(img);
% %scale values from 0 to 5
% current_max = max(img(:));
% current_min = min(img(:));
% img = uint8(((img-current_min)*5)/(current_max-current_min));
% img = img + 1;

for	y=1:h
	for x=1:w
        if (y+1 <= h && x+1 <= w)
            framework(img(y,x),img(y+yp,x+xp)) = framework(img(y,x),img(y+yp,x+xp)) +1;
        end
	end
end
trans = transpose(framework);

for	y=1:6
	for x=1:6
        symmframework(y,x) = trans(y,x) + framework(y,x);
	end
end

s = sum(sum(symmframework));
for	y=1:6
	for x=1:6
        normframework(y,x) = symmframework(y,x)./s;
	end
end

glcm = normframework;

end