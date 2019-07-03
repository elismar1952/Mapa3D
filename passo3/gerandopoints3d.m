%
clc
close all

page_screen_output(0);
page_output_immediately(1);

addpath(genpath('lib-mcode'))
addpath(genpath('lib-mcode2'))

% diretorio das imagens
% DIRECTORY='../imagens/ResultadoFinalCorte';
DIRECTORY='../imagens/img2_CaixaBranca_cut2' 
RESULTADO='output_points'; 

% Dados do algoritmo de calibração
PARAMS=[    h0=400; ...
            D=1.0; ...
            Q=pi/3; ...
            f=1.8; ...
            g=1.8];

% quantidade de imagens
ENDD=14; 
INIT=2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mkdir(RESULTADO);

% salvando cada dado em um txt separado
for ID=INIT:ENDD      
  IMAGEREF = [DIRECTORY filesep num2str(ID) '_ref.bmp'];
  IMAGEOBJ = [DIRECTORY filesep num2str(ID) '_obj.bmp'];
   

  disp(' ');
  disp(['IMAGE:',IMAGEOBJ])  ;
  
  pfun(PARAMS,IMAGEREF,IMAGEOBJ,true,RESULTADO,ID);
endfor

juntar_arquivos_e_plot3d(RESULTADO,INIT,ENDD)


