%% POLY3=[LIN_POLY1;LIN_POLY2;LIN_POLY3]
%% XYZ=[COLX COLY COLZ]
function XYZ=polyval3d(POLY3,T)
    N=numel(T);
    XYZ=zeros(N,3);


    XYZ=[polyval(POLY3(1,:),T) polyval(POLY3(2,:),T) polyval(POLY3(3,:),T)];

endfunction
