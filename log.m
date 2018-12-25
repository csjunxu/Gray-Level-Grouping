clear all;
clc;
I=rgb2gray(imread('light.jpg'));
imshow(I),title('Original image')
I2=im2double(I);
c=input('C value :');
J=c*log(1+I2);
%J2=2*log(1+I2);
%J3=5*log(1+I2);
figure, imshow(J),title('After processing');xlabel('C='),xlabel(c);
%figure, imshow(J2)
%figure, imshow(J3)
