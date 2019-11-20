%%
clc
close all
addpath(genpath('mcode'));

PASTA_ORIGEM='../imagens/5';
PASTA_SAIDA='../padroes_out/';
INITC=1;
ENDC=16;
FORMAT='jpg';
TYPE='obj';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

NN=ENDC-INITC+1;
LIN=zeros(NN,1);
COL=zeros(NN,1);
for KK=1:NN
   rgb = imread (fullfile(PASTA_ORIGEM,[num2str(KK+INITC-1) '_' TYPE '.' FORMAT]));
   figure(1);
   imshow(rgb);
   daspect([1 1 1])
   title('IMAGEM RGB');
   msgbox ( 'select 1 point in the image' );
   [col, lin] = ginput (1);
   LIN(KK)=round(lin);
   COL(KK)=round(col);
endfor
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mkdir(PASTA_SAIDA)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for KK=1:NN
   fprintf('\nANalizando imagem %d.\n',KK+INITC-1)
   rgb = imread (fullfile(PASTA_ORIGEM,[num2str(KK+INITC-1) '_' TYPE '.'  FORMAT]));
   COLOR=[rgb(LIN(KK),COL(KK),1),rgb(LIN(KK),COL(KK),2),rgb(LIN(KK),COL(KK),3)];
   grayimg=vermelho2binario(rgb,COLOR,0.15);
   figure(2)
   imshow(gray);
   title('ннн IMAGEM GRAY ннн');
   imwrite (grayimg, fullfile(PASTA_SAIDA,[num2str(KK+INITC-1) '_' TYPE '.' FORMAT]))
endfor
 
   
 
