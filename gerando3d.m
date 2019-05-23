clc
close all

page_screen_output(0);
page_output_immediately(1);

addpath(genpath('lib-mcode'))
addpath(genpath('lib-mcode2'))

DIRECTORY='imagens';
% salvando cada dado em um txt separado
for ID=1:9      
  IMAGEREF = [DIRECTORY filesep num2str(ID) '_ref.bmp'];
  IMAGEOBJ = [DIRECTORY filesep num2str(ID) '_obj.bmp'];
   
  PARAMS=[    h0=400; ...
              D=1.0; ...
              Q=pi/3; ...
              f=1.8; ...
              g=1.8];
              
  nome='receba';            
  
  sfun(PARAMS,IMAGEREF,IMAGEOBJ,false,nome,ID);
endfor


%juntar todos os txt
filedata=[ nome num2str(1)  '.txt'];
dat = load (filedata);
delete(filedata);
for ID=2:9
%carregar dados do ficheiro
  filedata=[ nome num2str(ID)  '.txt'];
  DDD=load (filedata);
  dat =[dat; DDD];
  delete(filedata)
endfor

% plotando a superficie
plot3 (dat(:,1), dat(:,2), dat(:,3), "o") 
daspect ([1 1 1]);

print('3d.png','-dpng')
