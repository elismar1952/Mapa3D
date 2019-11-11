%
clc
close all

graphics_toolkit qt

addpath(genpath('lib-mcode3'))


FILE_DATA="data-test/out_all_data.txt";
FILE_PARAMS="data-test/out_all_params.txt";
FILE_IMG="data-test/2_obj.jpg";

%plot_user(FILE_DATA,FILE_PARAMS,FILE_IMG);

    dat=load (FILE_DATA);

    IMG=imread(FILE_IMG);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % plotando a superficie  de todos os dados de 'dat'
    hf=figure;
    image(IMG)
    daspect ([1 1 1]);

h = msgbox ("Please, select the first point in the image", "Select poit: 1 of 2");
[col1, lin1] = ginput (1);
col1=round(col1)
lin1=round(lin1)

h = msgbox ("Please, select the second point in the image", "Select poit: 2 of 2");
[col2, lin2] = ginput (1);
col2=round(col2)
lin2=round(lin2)

