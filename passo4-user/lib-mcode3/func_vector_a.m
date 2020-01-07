function veca=func_vector_a(X,Y,POLYORDER)
    veca=ones(size(X));
    for II=1:POLYORDER
        veca=[veca  funcS(X,Y,II)];
    endfor
endfunction

function S=funcS(X,Y,m)

    S=X.^m;
    for II=1:m
        S=[S  (X.^(m-II)).*(Y.^(II))];
    endfor
endfunction
