function W=func_xyz_outliers_weight(XYZ)
    N=size(XYZ,1);
    W=zeros(N,1);

    D0=norm(min(XYZ)-max(XYZ));

    for II=1:N
        DMIN=D0;

        for JJ=1:N
        if JJ!=II
            D=norm(XYZ(II,:)-XYZ(JJ,:));
            if(D<DMIN)
            DMIN=D;
            endif
        endif
        endfor

        W(II)=1./DMIN^2;
    endfor
endfunction
