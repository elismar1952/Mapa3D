%
addpath(genpath('mcode'))

DIRETORIO_ENTRADA='../imagens/img0';

DIRETORIO_SAIDA='../imagens/img1';

CORTAR_PIXELS_W=350;

CORTAR_PIXELS_H=50;


cortar_imagens( DIRETORIO_ENTRADA, ...
                DIRETORIO_SAIDA, ...
                CORTAR_PIXELS_W, ...
                CORTAR_PIXELS_H);


