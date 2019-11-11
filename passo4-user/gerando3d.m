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

fh1=function_control_plot(hf);
