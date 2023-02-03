Name = 'cameraman.png';
I = imread(Name);  
if size(I, 3) == 3
    I = rgb2gray(I);
end

[row, col,dim] = size(I); 
X = ones(1, 8);
for i = 1 : 8               
    X(i) = 2 ^ (i - 1);  
end
R = I;
plane1 = zeros(row, col);
plane2 = zeros(row, col);
plane3 = zeros(row, col);
plane4 = zeros(row, col);
plane5 = zeros(row, col);
plane6 = zeros(row, col);
plane7 = zeros(row, col);
plane8 = zeros(row, col);


for i = 1 : row
    for j = 1: col
        plane1(i, j) = bitand(R(i, j), X(1));
        plane2(i, j) = bitand(R(i, j), X(2));
        plane3(i, j) = bitand(R(i, j), X(3));
        plane4(i, j) = bitand(R(i, j), X(4));
        plane5(i, j) = bitand(R(i, j), X(5));
        plane6(i, j) = bitand(R(i, j), X(6));
        plane7(i, j) = bitand(R(i, j), X(7));
        plane8(i, j) = bitand(R(i, j), X(8));
    end
end

figure
subplot(2, 4, 1);
imshow(plane1); title('1st Bit Plane');
subplot(2, 4, 2);
imshow(plane2); title('2nd Bit Plane');
subplot(2, 4, 3);
imshow(plane3); title('3rd Bit Plane');
subplot(2, 4, 4);
imshow(plane4); title('4th Bit Plane');
subplot(2, 4, 5);
imshow(plane5); title('5th Bit Plane');
subplot(2, 4, 6);
imshow(plane6); title('6th Bit Plane');
subplot(2, 4, 7);
imshow(plane7); title('7th Bit Plane');
subplot(2, 4, 8);
imshow(plane8); title('8th Bit Plane');
