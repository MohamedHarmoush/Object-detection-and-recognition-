function comArr = countNumOfOCurrance(direction,img,MaxIntensity)
[rows,cols] = size(img); %width x height
 MaxLength = rows+cols;
 MaxIntensity = MaxIntensity +2;
comArr = zeros(MaxIntensity,MaxLength);
if( cols < rows) % if matrix not square matrix
    MaxLength = cols; % possible max run Length
end
if direction == 0
x = 1;
MaxLength = cols;
while(x<=MaxIntensity)
    y =1;
    while(y<=MaxLength)
      counter = 0;
    for i=1:rows
    j=1;
    while(j<=MaxLength)
        if( img(i,j) == x -1 )
            ch=0;
            for z = j:MaxLength
                if( img(i,z) == x-1 )
                    ch=ch+1;  
                end
                if( img(i,z) ~= x-1 )
                    break;
                end
            end
            if(ch == y)
                counter = counter+1;
            end
            j=z+1;
        else 
           j=j+1;
        end
    end
    end
      comArr(x,y)= counter;
      y = y+1;
    end
   x = x+1;
end
elseif direction == 90
x = 1;
MaxLength = rows;
while(x<=MaxIntensity)
    y =1;
    while(y<=MaxLength)
      counter = 0;
    for i=1:cols
    j=1;
    while(j<= MaxLength)
        if( img(j,i) == x-1 )
            ch=0;
            for z = j:MaxLength
                if( img(z,i) == x-1 )
                    ch=ch+1;  
                end
                if( img(z,i) ~= x-1 )
                    break;
                end
            end
            if(ch == y)
                counter = counter+1;
            end
            j=z+1;
        else 
        j=j+1;
        end
    end
    end
    comArr(x,y)= counter;
      y = y+1;
    end
   x = x+1;
end
elseif direction == 45
i=rows;
k = MaxIntensity;
    while(i>=1)
        j=0;
        while(j<=k)
            ti = i;
            tj = 1;
            cnt = 0;
           % while (ti >= 1 && tj <= rows)
            while (ti >= 1 && tj <= cols)
                if (img(ti, tj) == j)
                    cnt = cnt + 1;
                else
                    if (cnt > 0)
                        comArr(j + 1, cnt) = comArr(j + 1, cnt) + 1;
                    end
                    cnt = 0;
                end
                ti = ti - 1;
                tj = tj + 1;
            end
            if (cnt > 0)
                comArr(j + 1, cnt) = comArr(j + 1, cnt) + 1;
            end
            j = j + 1;
        end
        i = i-1;
    end
    
    i = 2;
    while(i<= cols)
        j=0;
        while(j<=k)
            %display(j);
            ti = rows;
            tj = i;
            cnt = 0;
            while (ti >= 1 && tj <= cols)
                if (img(ti, tj) == j)
                    cnt = cnt + 1;
                else
                    if (cnt > 0)
                        comArr(j + 1, cnt) = comArr(j + 1, cnt) + 1;
                    end
                    cnt = 0;
                end
                ti = ti - 1;
                tj = tj + 1;
            end
            if (cnt > 0)
                comArr(j + 1, cnt) = comArr(j + 1, cnt) + 1;
            end
            j = j + 1;
        end
        i = i+1;
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif direction == 135
i= rows;
k = MaxIntensity;
    while(i>=1)
        j=0;
        while(j<=k)
            ti = i;
            tj = cols;
            cnt = 0;
            while (ti >= 1 && tj >= 1)
                if (img(ti, tj) == j)
                    cnt = cnt + 1;
                else
                    if (cnt > 0)
                        comArr(j + 1, cnt) = comArr(j + 1, cnt) + 1;
                    end
                    cnt = 0;
                end
                ti = ti - 1;
                tj = tj - 1;
            end
            if (cnt > 0)
                comArr(j + 1, cnt) = comArr(j + 1, cnt) + 1;
            end
            j = j + 1;
        end
        i = i-1;
    end
    
    i = cols - 1;
    while(i>=1)
        j=0;
        while(j<=k)
            %display(j);
            ti = rows;
            tj = i;
            cnt = 0;
            while (ti >= 1 && tj >= 1)
                if (img(ti, tj) == j)
                    cnt = cnt + 1;
                else
                    if (cnt > 0)
                        comArr(j + 1, cnt) = comArr(j + 1, cnt) + 1;
                    end
                    cnt = 0;
                end
                ti = ti - 1;
                tj = tj - 1;
            end
            if (cnt > 0)
                comArr(j + 1, cnt) = comArr(j + 1, cnt) + 1;
            end
            j = j + 1;
        end
        i = i-1;
    end
end
%display(comArr);
end
