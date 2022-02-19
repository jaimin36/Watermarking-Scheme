#The scheme proposed by Subhayan Roy Moulick, Siddharth Arorab, Chirag Jain, Prasanta K. Panigrahi

clc
clear all

pkg load image 

#reading image and converting to matrix
I1=imread('256.jpg');
I1=rgb2gray(I1);

I2=imread('256_2.jpg');
#I2=rgb2gray(I2);

[u s v]=svd(I1);

[uw sw vw]=svd(I2);
M=uw*sw;

h_id=randn(256);
mxor=bitxor(h_id,M);
x=0.0009;
s_1=s+x*(mxor);

I_new=u*s_1*v';
#plotting both images
subplot(1,3,1)
imshow(I1)
title('Original Image')

image1=mat2gray(I_new);
subplot(1,3,2)
imshow(image1)
title('Watermarked Image, scaling parameter=0.09')

subplot(1,3,3)
imshow(I2)
title('Image W')