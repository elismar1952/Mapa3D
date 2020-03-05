% https://franknielsen.github.io/blog/kernelCoresetMEB/index.html
% https://www.youtube.com/watch?v=ISLt4ZlBRwM
function [C0 R]=find_smallest_circle(dat_pixel)
    N=size(dat_pixel,1); %% numero de amostras
    RANDID=round(rand()*N);
        

    C0=dat_pixel(RANDID,:);
    PERCENT_ERROR=100;
   
    II=1;
    while PERCENT_ERROR>0.1 
        F=find_far_point(dat_pixel, C0);

        C_NEXT=(II/(II+1))*C0+(1/(II+1))*F;

        PERCENT_ERROR=100*norm(C_NEXT-C0)/norm(C0);
        C0=C_NEXT;
        II=II+1;
    endwhile
    II

    [F R]=find_far_point(dat_pixel, C0);    
endfunction

function [PMAX DMAX IDMAX]=find_far_point(dat_pixel, point)
    N=size(dat_pixel,1); %% numero de amostras
    IDMAX=0;
    PMAX=[0 0];
    DMAX=0;
    
    for II=1:N
        D=norm(dat_pixel(II,:)-point);
        if D>=DMAX
            IDMAX=II;
            PMAX=dat_pixel(II,:);
            DMAX=D;
        endif
    endfor
end
