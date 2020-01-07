function [unit1]=func_transform_point(dat_unit,dat_pixel, pixel_point,POLYORDER,number_of_points,varargin)
    N=size(dat_pixel,1); %% numero de amostras
    D=zeros(N,1);
    %% deixo em cor preto em IMG todos os pixels correspondentes a curva
    for II=1:N
        D(II)=norm(dat_pixel(II,:)-pixel_point);
    end

    [SORTD, ID] = sort (D);

    if SORTD(1)==0
        unit1=dat_unit(ID(1),:);
    endif

    M=number_of_points;

    %% creando pesos W com o inverso da distancia ao ponto

    W=1.0./SORTD(1:M);
    W=W/(max(W));

    X=dat_pixel(ID(1:M),1);
    Y=dat_pixel(ID(1:M),2);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if nargin>5
	figure
        imagesc(varargin{1})
	daspect([1 1 1])
	hold on
	scatter (X,Y, [], W,'linewidth',30);
	hold off
    endif
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    meanX=mean(X);
    stdX=std(X);
    meanY=mean(Y);
    stdY=std(Y);
  

    U=dat_unit(ID(1:M),1);
    V=dat_unit(ID(1:M),2);

    if(M<((POLYORDER+1)*(POLYORDER+2)/2))
        error(['O numero de pontos tem que ser maior a:' num2str((POLYORDER+1)*(POLYORDER+2)/2)]);
    end

    Xz=(X-meanX)/stdX;
    Yz=(Y-meanY)/stdY;
    A=func_vector_a(Xz,Yz,POLYORDER);

    APT=inv(A'*diag(W)*A)*A'*diag(W);

    C=APT*U;
    D=APT*V;

    veca=func_vector_a( (pixel_point(1)-meanX)/stdX, ...
                        (pixel_point(2)-meanY)/stdY, ...
                        POLYORDER);

    unit1=[veca*C,veca*D];
endfunction
