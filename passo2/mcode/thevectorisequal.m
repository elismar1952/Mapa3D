%
function R=thevectorisequal(a,b,fator=0.1)
  %os dois são iguais
  if sum(size(a)==size(b))!=2
    error('os vetores nao tem o mesmo tamanho');
  end 
  %se a é um vetor 
  if isvector(a)==false
    error('a não é um vetor');
  end
  %se b é um vetor 
  if isvector(b)==false
    error('b não é um vetor');
  end
  N=length(a);
  %comparando cada elemento
  if (norm(a)==0)&&(norm(b)==0)
    R=true;
    return;
  end

  if (norm(a)==0)||(norm(b)==0)
    R=false;
    return;
  end
    
  
  if(norm(b-a)/(norm(b))<fator)  
    R=true;
  else
    R=false;
  end
endfunction
  
