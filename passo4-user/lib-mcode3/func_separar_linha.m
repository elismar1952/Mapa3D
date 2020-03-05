function LINE=func_separar_linha(dat_unit)
    N=size(dat_unit,1);
    INIT=1;
    JJ=1;
    
    for II=2:N
        if ((dat_unit(II,1)<0) && (dat_unit(II-1,1)>0))
            LINE{JJ}=dat_unit(INIT:(II-1),:);
            INIT=II;
            JJ=JJ+1;
        endif        
    endfor

    LINE{JJ}=dat_unit(INIT:end,:);

endfunction
