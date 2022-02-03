pkg load image;

img=imread('C:\Users\umutd\Documents\dersler computer engineering\3.sinif 2.donem\Image Processing\IDIP-homework2\3.tif');
subplot(2,2,1)
I1=medfilt2(img);
imshow(I1)
title('median filter')

I2=2*I1;

subplot(2,2,2)
I3=histeq(I2);
imshow(I3);
title('Histogram Eq.');


PQ = paddedsize(size(I3));

H1 = notch('btw', PQ(1), PQ(2), 5, 24,41);
H2 = notch('btw', PQ(1), PQ(2), 5, 977,710);

F=fft2(double(I3),PQ(1),PQ(2));

FS_I3 = F.*H1.*H2;

F_I3=real(ifft2(FS_I3)); 

F_I3=F_I3(1:size(I3,1), 1:size(I3,2));

subplot(2,2,3)
imshow(F_I3,[])
title('notch filter')


I=F_I3;
f=[0 1 0;1 -4 1;0 1 0]
Ilap=imfilter(I,f);
Isharp=imsubtract(I,Ilap);
subplot(2,2,4)
imshow(Isharp*0.85)  % multiplied with 0.85 to convert white regions to grey
title('Final result with Laplacain');

figure,imshow(Isharp*0.85)