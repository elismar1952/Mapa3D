function [FLINE P XINT]=func_smooth_splines3_xzlines(LINE)

    N=length(LINE);
    FLINE=cell(N,1);
    XINT=cell(N,1);
    P=cell(N,1);

    for II=1:N
        NPARTS=11;
        XS=LINE{II}(:,1);
        YS=LINE{II}(:,2);
        ZS=LINE{II}(:,3);
        WS=ones(size(ZS));
        [P{II} XINT{II}]=lms_splines3(XS,ZS,NPARTS,WS,2);

        FLINE{II} = [LINE{II}(:,1) LINE{II}(:,2) eval_splines(P{II},XINT{II},LINE{II}(:,1)) ];
    endfor

endfunction
