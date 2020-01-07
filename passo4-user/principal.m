%
close all

graphics_toolkit qt

addpath(genpath('lib-mcode3'))


FILE_DATA="data-test/out_all_data.txt";
FILE_DATA_PIXEL="data-test/out_all_data_pixel.txt";
FILE_IMG="data-test/img_obj.jpg";

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dat_unit =load (FILE_DATA);       %% {unit_column,unit_line}
dat_pixel=load (FILE_DATA_PIXEL); %% {pixel_column,pixel_line}={pixel_x,pixel_y}


[point_pixel1, point_pixel2]=plot_2d_image_and_select_points(FILE_IMG,dat_pixel);

POLYORDER=3;
point_unit1=func_transform_point(dat_unit,dat_pixel,point_pixel1,POLYORDER,120);
point_unit2=func_transform_point(dat_unit,dat_pixel,point_pixel2,POLYORDER,120);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
plot_3d_surface(dat_unit,point_unit1,point_unit2)

figure
plot_3d_surface_slice(dat_unit,point_unit1,point_unit2)

figure
plot_2d_slice(dat_unit,point_unit1,point_unit2)
