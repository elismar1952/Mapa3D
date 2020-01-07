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

   %size(dat_unit(:,1))
   %size(dat_unit(:,2))
   %size(dat_unit(:,3))

   Zn= griddata(dat_unit(:,1),dat_unit(:,2),dat_unit(:,3),Xn,Yn);

   D=linspace(0,1,N)*norm(point_unit2-point_unit1);
   stem(D,Zn'-min(dat_unit(:,3))) 
   daspect([1 1 1])

endfunction
