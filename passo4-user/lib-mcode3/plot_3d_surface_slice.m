function plot_3d_surface_slice(dat_unit,point_unit1,point_unit2)
    LINEWIDTH=30;
    MINZ=min(dat_unit(:,3));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % plotando a superficie  de todos os dados de 'dat_unit'
    [Xs Ys Zs]=slice_plane(dat_unit(:,1), dat_unit(:,2), dat_unit(:,3),point_unit1,point_unit2);

    scatter3(Xs, Ys, Zs-MINZ,[], Zs-MINZ)
    h1=gcf();
    xlabel('cm')
    ylabel('cm')
    zlabel('cm')
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

    hp=patch(X,Y,Z-MINZ,'w');
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

    D=linspace(0,1,N)*norm(point_unit2-point_unit1);
    hold on
    stem3(Xn,Yn,Zn-MINZ,'linewidth',LINEWIDTH) 
    hold off
endfunction


function [Xs Ys Zs]=slice_plane(X, Y, Z,point_unit1,point_unit2)

    x1=point_unit1(1);    y1=point_unit1(2);
    x2=point_unit2(1);    y2=point_unit2(2);
  
    R=-inv([x1,1;x2,1])*[y1;y2];
    a=R(1); b=R(2);

    ID=find((a*X+Y+b)>0);

    Xs=X(ID); Ys=Y(ID); Zs=Z(ID);
endfunction
