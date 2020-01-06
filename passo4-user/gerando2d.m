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

    dat_unit=load (FILE_DATA); %% {unit_column,unit_line}
    dat_pixel=load (FILE_DATA_PIXEL); %% {pixel_column,pixel_line}={pixel_x,pixel_y}


%% mostrando a fotografia FILE_IMG modificando cores
hfa=func_plot_new_modified_image_file(FILE_IMG,dat_pixel);

%% Sleccionando os pontos point1=[col1 lin1] e point2=[col2 lin2]
[point_pixel1, point_pixel2]=func_select_points(hfa)

POLYORDER=3;
point_unit1=func_transform_point(dat_unit,dat_pixel,point_pixel1,POLYORDER,48)
point_unit2=func_transform_point(dat_unit,dat_pixel,point_pixel2,POLYORDER,48)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function plot_3d_surface(dat_unit)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % plotando a superficie  de todos os dados de 'dat_unit'
    hf=figure;
    scatter3(dat_unit(:,1), dat_unit(:,2), dat_unit(:,3),[], dat_unit(:,3))
    h1=gcf();
    xlabel('cm')
    ylabel('cm')
    zlabel('cm')
    view([-37.5, 30])
    colormap(jet)
    daspect ([1 1 1]);
endfunction
