clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures if you have the Image Processing Toolbox.
clear;  % Erase all existing variables. Or clearvars if you want.
workspace;  % Make sure the workspace panel is showing.
format long g;
format compact;
fontSize = 20;
grayImage = imread('light.jpg');
% Get the dimensions of the image.  
% numberOfColorBands should be = 1.
[rows, columns, numberOfColorBands] = size(grayImage);
if numberOfColorBands > 1
	% It's not really gray scale like we expected - it's color.
	% Convert it to gray scale by taking only the green channel.
	grayImage = grayImage(:, :, 2); % Take green channel.
end
ah=uint8(zeros(rows,columns));
n=rows*columns;
f=zeros(256,1);
pdf=zeros(256,1);
cdf=zeros(256,1);
out=zeros(256,1);
for i=1:rows
    for j=1:columns       
        value=grayImage(i,j);
        f(value+1)= f(value+1)+1;
        pdf(value+1)= f(value+1)/n; 
      end
  end
sum=0; l=255;
for i=size(pdf)
    sum=sum+f(i);
    cum(i)=sum;
    cdf(i)=cum(i)/n;
    out(i)=round(cdf(i)*l);
end
for i=1:rows
    for j=1:columns
        ah(i,j)=out(grayImage(i,j)+1);
    end
end
imshow(grayImage, []); title('Original Grayscale Image');
he=histeq(grayImage);
imshow(he, []); title('Histogram Equalized Image');