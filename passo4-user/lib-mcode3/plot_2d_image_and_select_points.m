function [point_pixel1, point_pixel2, IMG,hfa]=plot_2d_image_and_select_points(FILE_IMG,dat_pixel)

	%% mostrando a fotografia FILE_IMG modificando cores
	[hfa IMG]=func_plot_new_modified_image_file(FILE_IMG,dat_pixel);

	%% Sleccionando os pontos point1=[col1 lin1] e point2=[col2 lin2]
	[point_pixel1, point_pixel2]=func_select_points(hfa);


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% corrigindo pontos fora da region de analisis
    point_close_to_point_pixel1=find_close_point(dat_pixel, point_pixel1);
    point_close_to_point_pixel2=find_close_point(dat_pixel, point_pixel2);

    new_point_pixel1=find_close_point_to_line(point_pixel1, point_pixel2, point_close_to_point_pixel1);
    new_point_pixel2=find_close_point_to_line(point_pixel1, point_pixel2, point_close_to_point_pixel2);

    point_pixel1=new_point_pixel1;
    point_pixel2=new_point_pixel2;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    disp('Printig PNG file, please wait ...')
    print(gcf,'plot_2d_image_and_select_points.png','-dpng');
    disp('PNG file saved ..............[OK]')
    
endfunction

function [PMIN DMIN IDMIN]=find_close_point(dat_pixel, point)
    N=size(dat_pixel,1); %% numero de amostras
    IDMIN=1;
    PMIN=dat_pixel(1,:);
    DMIN=norm(dat_pixel(1,:)-point);
    
    for II=2:N
        D=norm(dat_pixel(II,:)-point);
        if D<=DMIN
            IDMIN=II;
            PMIN=dat_pixel(II,:);
            DMIN=D;
        endif
    endfor
end

%% LINHA FORMADA por P1 e P2
%% Ponto P0
%% P é o ponto na linha {P1,P2} mais proximo a P0 
function [P]=find_close_point_to_line(P1,P2, P0)

    U=(P2-P1)/norm(P2-P1);
    M=dot(P0-P1,U);
    P=P1+U*M;
endfunction
