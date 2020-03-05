function plot_2d_slice(dat_unit,point_unit1,point_unit2)

    N=64;

    P=zeros(N,2);

    II=1;
    for alpha=linspace(0,1,N)
	    P(II,1:2)=point_unit1+alpha*(point_unit2-point_unit1);
        II=II+1;
    endfor

    Xn=P(:,1);
    Yn=P(:,2);
    
    dat_unit(:,3)=dat_unit(:,3)-min(dat_unit(:,3));


    Zn= griddata(dat_unit(:,1),dat_unit(:,2),dat_unit(:,3),Xn,Yn);
    NN=length(Xn);
    T=linspace(0,1,NN)';
    POLY=polyfit(T,Zn,5);
    Zn=polyval(POLY,T);

    D=linspace(0,1,N)*norm(point_unit2-point_unit1);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    disp('')
    disp('Plotting data, please wait ...')
    hs=stem(D,Zn','k');
    xlabel('cm (cut-axis)')
    ylabel('cm (z-axis)')
    title("Cut made from the selected points")
    h1=gcf;
    daspect([1 1 1])
    disp('Data ploted ...............[OK]')
    view([90 90]);


    disp('Printig PNG file, please wait ...')
    print(h1,'plot_2d_slice_1.png','-dpng');
    disp('PNG file saved ..............[OK]')

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    LINE=func_separar_linha(dat_unit);
    [FLINE PP XINT]=func_smooth_splines3_xzlines(LINE);
    MINXYZ=func_find_minz_around_xzero(FLINE,PP,XINT);
    SPINAL=fun_fit_3d_points(MINXYZ,N);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    disp('')
    disp('Plotting data, please wait ...')
    figure
    subplot(1,2,1)
    stem(SPINAL(:,2),SPINAL(:,3),'r');
    xlabel('cm (y-axis)')
    ylabel('cm (z-axis)')
    title("Possible spine")
    daspect([1 1 1])
    view([-90 90]);
    subplot(1,2,2)
    stem(SPINAL(:,2),SPINAL(:,1),'r');
    xlabel('cm (y-axis)')
    ylabel('cm (x-axis)')
    title("Possible spine")
    daspect([1 1 1])
    view([-90 90]);
    disp('Data ploted ...............[OK]')


    h1=gcf;
    disp('Printig PNG file, please wait ...')
    print(h1,'plot_2d_slice_2.png','-dpng');
    disp('PNG file saved ..............[OK]')

endfunction
