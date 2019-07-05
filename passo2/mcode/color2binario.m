function IMAGEBW=color2binario(rgb,vecolor,fator=0.1)
    a = size (rgb);
    %a1 igual numeros de linhas e a2 numero de colunas
    IMAGEBW = zeros(a(1),a(2));
    for i=1: a(1)
      for j=1 : a(2)
        vec1=cast([rgb(i,j,1),rgb(i,j,2),rgb(i,j,3)],'double');
        for KK=1:size(vecolor,1)
            vec2=cast(vecolor(KK,:),'double');
            if thevectorisequal(vec1,vec2,fator)
              IMAGEBW(i,j)=1;
              break
            endif
        end
      endfor
      fprintf(stdout,'i:%4d de %4d\r',i,a(1));
    endfor
    fprintf(stdout,'\n');

endfunction
