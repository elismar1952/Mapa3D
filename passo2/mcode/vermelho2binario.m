function gray=vermelho2binario(rgb,vecolor)
    a = size (rgb);
    %a1 igual numeros de linhas e a2 numero de colunas
    gray = zeros(a(1),a(2));
    for i=1: a(1)
      for j=1 : a(2)
        vec1=cast([rgb(i,j,1),rgb(i,j,2),rgb(i,j,3)],'double');
        vec2=cast(vecolor,'double');
        if thevectorisequal(vec1,vec2)
          gray(i,j)=1;
        else
          gray(i,j)=0;
        
        %rgb(lin,col,cor)
        %rgb(lin,col,:)
        %rgb(lin,col,:)
        endif
      endfor
      fprintf(stdout,'i:%4d de %4d\r',i,a(1));
    endfor
          fprintf(stdout,'\n');

endfunction
