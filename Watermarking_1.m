#the scheme proposed by Liu and Tan

clc
clear all

pkg load image #to run mat2gray

I1=imread('256.jpg');
I1=rgb2gray(I1);
[u1 v1 w1]=svd(I1); 

I2=imread('256_2.jpg');

x=0.9;
new_matrix=v1+(x*I2);

[u2 v2 w2]=svd(new_matrix);

I_new=u1*v2*w1';

subplot(1,3,1)
imshow(I1)
title('Original Image')

image1=mat2gray(I_new);
subplot(1,3,2)
imshow(image1)
title('Watermarked Image, scaling parametet=0.9')

subplot(1,3,3)
imshow(I2)
title('Image W')