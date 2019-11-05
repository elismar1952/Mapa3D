
function cortar_imagens( DIRETORIO_ENTRADA, ...
                         DIRETORIO_SAIDA, ...
                         CORTAR_PIXELS_W, ...
                         CORTAR_PIXELS_H)


files = glob(fullfile(DIRETORIO_ENTRADA,'*.jpg'));
mkdir(DIRETORIO_SAIDA);
N=length(files);

for II=1:N
    fprintf(stdout,'file: %s\n',files{II});
    IMG_REF = imread(files{II});
    W=size(IMG_REF,2);
    H=size(IMG_REF,1);

    if((W/2)<CORTAR_PIXELS_W)
        error('CORTAR_PIXELS_W é grande demais!!');
    end

    if((H/2)<CORTAR_PIXELS_H)
        error('CORTAR_PIXELS_H é grande demais!!');
    end    


    IMG_REF=IMG_REF((CORTAR_PIXELS_H+1):(H-CORTAR_PIXELS_H), ...
                    (CORTAR_PIXELS_W+1):(W-CORTAR_PIXELS_W), ...                    
                    :);


    [filepath,name,ext] = fileparts(files{II});
    newname=fullfile(DIRETORIO_SAIDA,[name ext]);
    imwrite(IMG_REF,newname);
endfor
endfunction

