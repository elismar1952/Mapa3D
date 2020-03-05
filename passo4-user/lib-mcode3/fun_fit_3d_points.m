function [FIT3 POLY3]=fun_fit_3d_points(MINXYZ,M,varargin)
    N=size(MINXYZ,1);
    ORDER=4;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if nargin>2
        func_surf_lines(varargin{1},true);
    endif
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    W=func_xyz_outliers_weight(MINXYZ);
    W=W/max(W);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    T=linspace(0,1,N)';
    POLY3=polyfit3d(T,MINXYZ,ORDER,W);
    T=linspace(0,1,M)';
    FIT3=polyval3d(POLY3,T);

    if nargin>2
        hold on
        func_surf_points(FIT3,[1 0 0]);
        hold off
    endif

endfunction
