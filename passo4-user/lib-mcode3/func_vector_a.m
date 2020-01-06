function veca=func_vector_a(X,Y,POLYORDER)

    veca=ones(size(X));

    for II=1:POLYORDER
        veca=[veca  funcS(X,Y,POLYORDER)];
    endfor
endfunction

function S=funcS(X,Y,POLYORDER)
    M=POLYORDER;

    S=X.^M;
    for II=1:M
        S=[S  X.^(M-II).*Y.^(II)];
    endfor
endfunction
