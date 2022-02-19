#The scheme proposed by Chirag Jain, Siddharth Arora, and Prasanta K. Panigrahi

clc
clear all

pkg load image 

#reading image and converting to matrix
I1=imread('256.jpg');
I1=rgb2gray(I1);
[u s v]=svd(I1); 

I2=imread('256_2.jpg');
#I2=rgb2gray(I2);
[uw sw vw]=svd(I2); 

#watermarking image 
x=0.05;
s_1=s+(x*uw*sw);

I_new=u*s_1*v';

#plotting both images
subplot(1,3,1)
imshow(I1)
title('Original Image')

image1=mat2gray(I_new);
subplot(1,3,2)
imshow(image1)
title('Watermarked Image, scaling parameter=0.05')

subplot(1,3,3)
imshow(I2)
title('Image W')