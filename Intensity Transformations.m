I = imread('Benedict.png');
figure(1);imshow(I);

I = rgb2gray(I);
figure(2);
imshow(I);

[row,col] = size(I);


hist1 = zeros(1,256);

for i = 1 : row
    for j = 1 : col
    	temp = I(i,j)+1;
        hist1(temp) =  hist1(temp)+1;
    end
end

figure(3);
subplot(5,2,1),imshow(I);title('Gray Scale');
subplot(5,2,2),bar(hist1);


ID = im2double(I);
A = double(zeros(row,col));
c = 1.56;
g = 2.5;



for i = 1 : row
    for j = 1 : col
        A(i,j) =  c*ID(i,j)^g;
    end
end

A = uint8(255*A);
figure(3);
subplot(5,2,3),imshow(A);title('Power Law transformed image');

hist2 = zeros(1,256);

for i = 1 : row
    for j = 1 : col
    	temp = A(i,j)+1;
        hist2(temp) =  hist2(temp)+1;
    end
end

figure(3);
subplot(5,2,4),bar(hist2);


A = 200;
B = uint8(zeros(row,col));


for i = 1:row
    for j = 1:col
        if(I(i,j) < A)
            B(i,j) = I(i,j) + (0.5 * I(i,j));
        else
            B(i,j) = I(i,j) - (0.25 * I(i,j));
        end
    end
end

figure(3);
subplot(5,2,5),imshow(B);title('Increase-Decrease brightness image');


hist3 = zeros(1,256);

for i = 1 : row
    for j = 1 : col
    	temp = B(i,j)+1;
        hist3(temp) =  hist3(temp)+1;
    end
end

figure(3);
subplot(5,2,6),bar(hist3);


C = double(zeros(row,col));
c = 1.9;

for i = 1 : row
    for j = 1 : col
        C(i,j) =  c*log(ID(i,j)+1);
    end
end

C = uint8(255*C);
figure(3);
subplot(5,2,7),imshow(C);title('Log transformed image');

hist4 = zeros(1,256);

for i = 1 : row
    for j = 1 : col
    	temp = C(i,j)+1;
        hist4(temp) =  hist4(temp)+1;
    end
end

figure(3);
subplot(5,2,8),bar(hist4);


D = uint8(zeros(row,col));

for i = 1 : row
    for j = 1 : col
        D(i,j) =  255 - I(i,j);
    end
end

figure(3);
subplot(5,2,9),imshow(D);title('Negative image');


hist5 = zeros(1,256);

for i = 1 : row
    for j = 1 : col
    	temp = D(i,j)+1;
        hist5(temp) =  hist5(temp)+1;
    end
end

figure(3);
subplot(5,2,10),bar(hist5);


figure(4);
subplot(3,2,1);
bar(hist1);
title('Gray Scale');

subplot(3,2,2);
bar(hist2);
title('Power Law');

subplot(3,2,3);
bar(hist3);
title('Threshold');

subplot(3,2,4);
bar(hist4);
title('Log Transformation');

subplot(3,2,5);
bar(hist5);
title('Negative');
