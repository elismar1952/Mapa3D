function [FLINE NTOT]=func_subsampling_lines(LINE,P,XINT,SUB)
    N=length(LINE);
    FLINE=cell(N,1);
    NTOT=0;
    for II=1:N
        M=size(LINE{II},1);
        MSUB=round(M/SUB);
        NTOT=NTOT+MSUB;

        % XS
        MINX=min(LINE{II}(:,1));
        MAXX=max(LINE{II}(:,1));
        Xs=linspace(MINX,MAXX,MSUB)';

        %Ys
        Ys= interp1 (LINE{II}(:,1), LINE{II}(:,2), Xs);
        %Zs
        Zs=eval_splines(P{II},XINT{II},Xs);

        FLINE{II}=[Xs Ys Zs];
    endfor
endfunction
