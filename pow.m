clear all
close all
RGB=imread('light.jpg');
I=rgb2gray(RGB);
I=im2double(I);
[m n] = size(I);
c = 2;
g =0.5;
for p = 1 : m
    for q = 1 : n
        I3(p, q) = c * I(p, q).^ g;  
    end
end
figure, imshow(I);title('Original Grayscale Image');
figure, imshow(I3);title('Power-law transformation');xlabel('Gamma='),xlabel(g);