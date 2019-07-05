clc
close all
addpath(genpath('mcode'));
  
   rgb = (imread ('/home/fernando/Downloads/30.jpg'));
   figure(1);
   
   
   
   subplot(1,2,1);
   imshow(rgb);
   title('IMAGEM RGB');
   
   gray=vermelho2binario(rgb,[34,25,52]);
   subplot(1,2,2);
   imshow(gray);
   title('ннн IMAGEM GRAY ннн');
 
 
 
   
 
