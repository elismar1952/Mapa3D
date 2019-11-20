%
clc
close all

graphics_toolkit qt

addpath(genpath('lib-mcode3'))


FILE_DATA="data-test/out_all_data.txt";
FILE_DATA_PIXEL="data-test/out_all_data_pixel.txt";
FILE_PARAMS="data-test/out_all_params.txt";
FILE_IMG="data-test/img_obj.jpg";

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    dat=load (FILE_DATA);
    dat_pixel=load (FILE_DATA_PIXEL);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

IMG=imread(FILE_IMG);

N=size(dat_pixel,1);

for II=1:N
    P=dat_pixel(II,:);
    IMG(P(2),P(1),:)=0*IMG(P(2),P(1),:);
end

hfa=figure;
image(IMG)
daspect ([1 1 1]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

h = msgbox ("Please, select the first point in the image", "Select poit: 1 of 2");
[col1, lin1] = ginput (1);
col1=round(col1)
lin1=round(lin1)
point1=[col1 lin1];

h = msgbox ("Please, select the second point in the image", "Select poit: 2 of 2");
[col2, lin2] = ginput (1);
col2=round(col2)
lin2=round(lin2)
point2=[col2 lin2];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % plotando a superficie  de todos os dados de 'dat'
    hf=figure;
    scatter3(dat(:,1), dat(:,2), dat(:,3),[], dat(:,3))
    h1=gcf();
    xlabel('cm')
    ylabel('cm')
    zlabel('cm')
    view([-37.5, 30])
    colormap(jet)
    daspect ([1 1 1]);
