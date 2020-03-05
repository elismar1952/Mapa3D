%% Making Surface Plots From Scatter Data
% How do you turn a collection of XYZ triplets into a surface plot? This is
% the most frequently asked 3D plotting question that I got when I was in
% Tech Support.

%% Load the data

close all
clear

addpath(genpath('lib-mcode3'))

FILE_DATA="/media/fernando/FER16G-BTRFS/passo4-user/data-test/out_all_data.txt";
dat_unit =load (FILE_DATA);       %% {unit_column,unit_line}



    %% filtfilt
    %% https://www.mathworks.com/help/curvefit/csaps.html#f7-5467_sep_mw_11ef892b-7c0a-4cb9-a0ba-9331aa87539a


LINE=func_separar_linha(dat_unit);

[FLINE P XINT]=func_smooth_splines3_xzlines(LINE);

PARTBY=3;
[FLINE NTOT]=func_subsampling_lines(FLINE,P,XINT,PARTBY);

MINXYZ=func_find_minz_around_xzero(FLINE,P,XINT);

FIT3=fun_fit_3d_points(MINXYZ,64,FLINE);

