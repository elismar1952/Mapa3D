function func_surf_points(XYZ,varargin)
    if nargin >1
        COLOR=varargin{1};
    else
        COLOR=XYZ(:,3);
    endif

    scatter3(XYZ(:,1),XYZ(:,2),XYZ(:,3),48,COLOR,"linewidth",20);
    daspect([1 1 1])
%%%    for II=1:N    
%%%        hold on
%%%        scatter3(FIT3(II,1),FIT3(II,2),FIT3(II,3),48,[1 0 0],"linewidth",20);
%%%        daspect([1 1 1])
%%%        hold off
%%%    endfor
endfunction
