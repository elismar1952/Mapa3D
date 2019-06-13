%
clc
close all

page_screen_output(0);
page_output_immediately(1);

addpath(genpath('lib-mcode'))
addpath(genpath('lib-mcode2'))

% diretorio das imagens
DIRECTORY='../imagens/ResultadoFinalCorte'; 
RESULTADO='output'; 

% Dados do algoritmo de calibração
PARAMS=[    h0=400; ...
            D=1.0; ...
            Q=pi/3; ...
            f=1.8; ...
            g=1.8];

% quantidade de imagens
L=10; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mkdir(RESULTADO);

% salvando cada dado em um txt separado
for ID=1:L      
  IMAGEREF = [DIRECTORY filesep num2str(ID) '_ref.bmp'];
  IMAGEOBJ = [DIRECTORY filesep num2str(ID) '_obj.bmp'];
   

  disp(' ');
  disp(['PASOU:',IMAGEOBJ])  ;
  
  sfun(PARAMS,IMAGEREF,IMAGEOBJ,false,RESULTADO,ID,RESULTADO);
endfor

juntar_arquivos_e_plot3d(RESULTADO,L)


