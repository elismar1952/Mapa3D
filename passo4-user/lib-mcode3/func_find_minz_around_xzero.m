function MINXYZ=func_find_minz_around_xzero(FLINE,P,XINT)
    N=length(FLINE);

    MINX=zeros(N,1);
    MINY=zeros(N,1);
    MINZ=zeros(N,1);

    for nn=1:N  
        [MINX0 IDX0]=min(abs(FLINE{nn}(:,1)));


        MINX(nn)=FLINE{nn}(IDX0,1);
        MINY(nn)=FLINE{nn}(IDX0,2);
        MINZ(nn)=FLINE{nn}(IDX0,3);

        ERROR=1;
        JJ=1;
        X=MINX0;
        while ( (ERROR>0.001) && (JJ<100) )
            Z =eval_splines    (P{nn},XINT{nn},X);
            DZ=eval_der_splines(P{nn},XINT{nn},X);
            
            if (MINZ(nn)>=Z)
                MINX(nn)=X;
                MINZ(nn)=Z;
            endif

            Xnew=X-0.01*DZ*Z/(DZ^2+0.1);
            if ( (Xnew<XINT{nn}(1,1)) || (Xnew>XINT{nn}(end,2)) )
                Xnew=XINT{nn}(1,1)+rand(1)*(XINT{nn}(end,2)-XINT{nn}(1,1));
            endif
            ERROR=abs(Xnew-X);
            X=Xnew;

            JJ=JJ+1;
        endwhile

        M=size(FLINE{nn},1);
        DD=zeros(M,1);
        for JJ=1:M
            P0=[MINX(nn) MINZ(nn)];
            PP=[FLINE{nn}(JJ,1) FLINE{nn}(JJ,3)];
            DD(JJ)=norm(PP-P0);
        endfor
        [MM ID]=min(DD);

        MINX(nn)=FLINE{nn}(ID,1);
        MINY(nn)=FLINE{nn}(ID,2);
        MINZ(nn)=FLINE{nn}(ID,3);
    
    endfor

    MINXYZ=[MINX MINY MINZ];
endfunction
