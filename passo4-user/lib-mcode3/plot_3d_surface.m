function plot_3d_surface(dat_unit,point_unit1,point_unit2)
    LINEWIDTH=2;
    MINZ=min(dat_unit(:,3));

    LINE=func_separar_linha(dat_unit);
    [FLINE P XINT]=func_smooth_splines3_xzlines(LINE);
    PARTBY=5;
    [FLINE NTOT]=func_subsampling_lines(FLINE,P,XINT,PARTBY);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % plotando a superficie  de todos os dados de 'dat_unit'
    disp('')
    disp(sprintf('Plotting %d scattered data, please wait ...',NTOT))
    % hs=scatter3(dat_unit(:,1), dat_unit(:,2), dat_unit(:,3)-MINZ,[], dat_unit(:,3)-MINZ);
    func_surf_lines(FLINE,true);
    disp('Data ploted ..............................[OK]')
    h1=gcf();
    xlabel('cm (x-axis)')
    ylabel('cm (y-axis)')
    zlabel('cm (z-axis)')
    %view([0, 90])
    view([-37.5, 30])
    colormap(jet)
    daspect ([1 1 1]);
    
    disp('Printig PNG file, please wait ...')
    print(h1,'plot_3d_surface.png','-dpng');
    disp('PNG file saved ..............[OK]')

    %set(gcf, 'visible', 'off'); 

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%   PARTS=3;
    %%%   ANGLE=linspace(-37.5,0,PARTS);
    %%%   ANGLE=[ANGLE(1:(end-1)) linspace(0,-37.5,PARTS)];
    %%%   disp('Printig PDF file, please wait ...')
    %%%   print(h1,'plot_3d_surface.pdf','-dpdf');
    %%%   disp('PDF file save ...............[OK]')
    %%%   for II=ANGLE(2:end)
    %%%       II
    %%%       view([II, 30])
    %%%       disp('Printig PDF file, please wait ...')
    %%%       print(h1,'plot_3d_surface.pdf','-dpdf','-append');
    %%%       disp('PDF file save ...............[OK]')
    %%%   endfor
    %%%   im = imread ("plot_3d_surface.pdf", "Index", "all");
    %%%   imwrite (im, "plot_3d_surface.gif", "DelayTime", .5)

endfunction
