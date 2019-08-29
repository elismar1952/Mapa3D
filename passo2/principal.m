%
clc
close all
addpath(genpath('mcode'));
  
   rgb = (imread ('../padroes/6_obj.bmp'));
   figure(1);
   imshow(rgb);
   title('IMAGEM RGB');
   msgbox ( 'select 1 point in the image' );
   [col, lin] = ginput (1);
   lin=round(lin);
   col=round(col);

   COLOR=[rgb(lin,col,1),rgb(lin,col,2),rgb(lin,col,3)];
   gray=vermelho2binario(rgb,COLOR,0.15);
   figure(2)
   imshow(gray);
   title('ннн IMAGEM GRAY ннн');
   imwrite (gray, 'grayscale.bmp')
 
 
   
 
