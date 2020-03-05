function plot_3d_surface_slice(dat_unit,point_unit1,point_unit2)

    plot_3d_surface_slice_figure_a(dat_unit,point_unit1,point_unit2);
    plot_3d_surface_slice_figure_b(dat_unit,point_unit1,point_unit2);

endfunction


function plot_3d_surface_slice_figure_b(dat_unit,point_unit1,point_unit2)
    LINEWIDTH=2;
    MINZ=min(dat_unit(:,3));
    dat_unit(:,3)=dat_unit(:,3)-MINZ;

    LINE=func_separar_linha(dat_unit);
    [FLINE PP XINT]=func_smooth_splines3_xzlines(LINE);
    PARTBY=5;
    [FLINE NTOT]=func_subsampling_lines(FLINE,PP,XINT,PARTBY);



   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    N=64;
    P=zeros(N,2);

    II=1;
    for alpha=linspace(0,1,N)
	P(II,1:2)=point_unit1+alpha*(point_unit2-point_unit1);
        II=II+1;
    endfor

    Xn=P(:,1);
    Yn=P(:,2);

    Zn= griddata(dat_unit(:,1),dat_unit(:,2),dat_unit(:,3),Xn,Yn);
    NN=length(Xn);
    T=linspace(0,1,NN)';
    POLY=polyfit(T,Zn,5);
    Zn=polyval(POLY,T);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    MINXYZ=func_find_minz_around_xzero(FLINE,PP,XINT);
    SPINAL=fun_fit_3d_points(MINXYZ,N);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    figure
    
    plot3(  Xn,Yn,Zn,'-k<','linewidth',LINEWIDTH, ...
            SPINAL(:,1),SPINAL(:,2),SPINAL(:,3),'-rs','linewidth',LINEWIDTH);
    daspect ([1 1 1]);
    legend('Selected points','Possible spine') 


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % plotando a superficie  de todos os dados de 'dat_unit'
    
    disp('')
    disp(sprintf('Plotting %d scattered data, please wait ...',NTOT))
    hold on
    func_surf_lines(FLINE,true);
    %hs=scatter3(dat_unit(:,1), dat_unit(:,2), dat_unit(:,3)-MINZ,[], dat_unit(:,3)-MINZ);
    disp('Data ploted ..............................[OK]')
    h1=gcf();
    xlabel('cm (x-axis)')
    ylabel('cm (y-axis)')
    zlabel('cm (z-axis)')
    view([0, 90])
    %view([-37.5, 30])
    colormap(jet)
    daspect ([1 1 1]);
    hold off

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    disp('Printig PNG file, please wait ...')
    print(h1,'plot_3d_surface_slice_b.png','-dpng');
    disp('PNG file saved ..............[OK]')
endfunction



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function plot_3d_surface_slice_figure_a(dat_unit,point_unit1,point_unit2)
    LINEWIDTH=2;
    MINZ=min(dat_unit(:,3));
    dat_unit(:,3)=dat_unit(:,3)-MINZ;


    LINE=func_separar_linha(dat_unit);
    [FLINE P XINT]=func_smooth_splines3_xzlines(LINE);
    PARTBY=5;
    [FLINE NTOT]=func_subsampling_lines(FLINE,P,XINT,PARTBY);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % plotando a superficie  de todos os dados de 'dat_unit'
    %[Xs Ys Zs]=slice_plane(dat_unit(:,1), dat_unit(:,2), dat_unit(:,3),point_unit1,point_unit2);
    FLINE=slice_lines_with_plane(FLINE,point_unit1,point_unit2);

    disp('')
    disp(sprintf('Plotting %d scattered data, please wait ...',NTOT))
    func_surf_lines(FLINE,true);
    %scatter3(Xs, Ys, Zs-MINZ,[], Zs-MINZ)
    disp('Data ploted .............................[OK]')
    h1=gcf();
    xlabel('cm (x-axis)')
    ylabel('cm (y-axis)')
    zlabel('cm (z-axis)')
    view([-37.5, 30])
    colormap(jet)
    daspect ([1 1 1]);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    x1=point_unit1(1);    y1=point_unit1(2);
    x2=point_unit2(1);    y2=point_unit2(2);
    z1=min(dat_unit(:,3));	z2=1.0*max(dat_unit(:,3));

    X=[x1 x2 x2 x1];
    Y=[y1 y2 y2 y1];
    Z=[z1 z1 z2 z2];

    hp=patch(X,Y,Z,'w');
    set(hp,'FaceAlpha',0.7);
    set(hp,'linewidth',LINEWIDTH);

   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    N=64;
    P=zeros(N,2);

    II=1;
    for alpha=linspace(0,1,N)
	P(II,1:2)=point_unit1+alpha*(point_unit2-point_unit1);
        II=II+1;
    endfor

    Xn=P(:,1);
    Yn=P(:,2);


    Zn= griddata(dat_unit(:,1),dat_unit(:,2),dat_unit(:,3),Xn,Yn);
    NN=length(Xn);
    T=linspace(0,1,NN)';
    POLY=polyfit(T,Zn,5);
    Zn=polyval(POLY,T);

    D=linspace(0,1,N)*norm(point_unit2-point_unit1);
    hold on
    stem3(Xn,Yn,Zn,'k','linewidth',LINEWIDTH) 
    hold off

    disp('Printig PNG file, please wait ...')
    print(h1,'plot_3d_surface_slice.png','-dpng');
    disp('PNG file saved ..............[OK]')
endfunction


function [Xs Ys Zs]=slice_plane(X, Y, Z,point_unit1,point_unit2)

    x1=point_unit1(1);    y1=point_unit1(2);
    x2=point_unit2(1);    y2=point_unit2(2);
  
    R=-inv([x1,1;x2,1])*[y1;y2];
    a=R(1); b=R(2);

    ID=find((a*X+Y+b)>0);

    Xs=X(ID); Ys=Y(ID); Zs=Z(ID);
endfunction

function [FLINE]=slice_lines_with_plane(LINE,point_unit1,point_unit2)
    N=length(LINE);
    FLINE=cell(N,1);
    for II=1:N
        [Xs Ys Zs]=slice_plane(LINE{II}(:,1), LINE{II}(:,2), LINE{II}(:,3),point_unit1,point_unit2);
        FLINE{II}=[Xs Ys Zs];
    endfor
endfunction
