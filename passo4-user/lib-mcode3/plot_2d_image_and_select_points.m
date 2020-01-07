function [point_pixel1, point_pixel2]=plot_2d_image_and_select_points(FILE_IMG,dat_pixel)

	%% mostrando a fotografia FILE_IMG modificando cores
	[hfa IMG]=func_plot_new_modified_image_file(FILE_IMG,dat_pixel);

	%% Sleccionando os pontos point1=[col1 lin1] e point2=[col2 lin2]
	[point_pixel1, point_pixel2]=func_select_points(hfa);
endfunction
