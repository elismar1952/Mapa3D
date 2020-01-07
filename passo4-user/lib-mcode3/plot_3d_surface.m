function plot_3d_surface(dat_unit,point_unit1,point_unit2)
    LINEWIDTH=30;
    MINZ=min(dat_unit(:,3));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % plotando a superficie  de todos os dados de 'dat_unit'
    scatter3(dat_unit(:,1), dat_unit(:,2), dat_unit(:,3)-MINZ,[], dat_unit(:,3)-MINZ)
    h1=gcf();
    xlabel('cm')
    ylabel('cm')
    zlabel('cm')
    view([-37.5, 30])
    colormap(jet)
    daspect ([1 1 1]);


endfunction
