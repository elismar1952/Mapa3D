%
clc
close all
addpath(genpath('mcode'));
  
   IMAGERGB = imread ('/home/fernando/Downloads/30.jpg');

   figure(1);
   COLOR=select_cores(IMAGERGB,2);

   IMAGEBW=color2binario(IMAGERGB,COLOR,0.10);

   figure(2);
   subplot(1,2,1);
   imshow(IMAGERGB);
   daspect([ 1 1 1])
   title('­­­ IMAGEM RGB ­­­');
   refresh(gcf);
   subplot(1,2,2);
   imshow(IMAGEBW);
   daspect([ 1 1 1])
   title('­­­ IMAGEM BW ­­­');
 

