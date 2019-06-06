clc
close all
addpath(genpath('mcode'));
  
   rgb = (imread ('C:\Users\alex\Desktop\4d\padroes\cortadas\padroes0000.bmp'));
   figure(1);
   
   
   
   subplot(1,2,1);
   imshow(rgb);
   title('ннн IMAGEM RGB ннн');
   
   gray=vermelho2binario(rgb,[34,25,52]);
   subplot(1,2,2);
   imshow(gray);
   title('ннн IMAGEM GRAY ннн');
 
 
 
   
 