clc
close all
addpath(genpath('mcode'));
  
   rgb = (imread ('backup\5.bmp'));
   figure(1);
   
   
   
   subplot(1,2,1);
   imshow(rgb);
   title('��� IMAGEM RGB ���');
   
   gray=vermelho2binario(rgb,[113,58,55]);
   subplot(1,2,2);
   imshow(gray);
   title('��� IMAGEM GRAY ���');
 
 
 
   
 