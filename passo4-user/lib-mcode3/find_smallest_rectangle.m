function [MINX MINY DX DY]=find_smallest_rectangle(dat_pixel)

    MINX=min(dat_pixel(:,1));
    MINY=min(dat_pixel(:,2));

    MAXX=max(dat_pixel(:,1));
    MAXY=max(dat_pixel(:,2));

    DX=MAXX-MINX;
    DY=MAXY-MINY;
endfunction
