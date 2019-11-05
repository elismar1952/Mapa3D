%
addpath(genpath('mcode'))

DIRETORIO_ENTRADA='../imagens/5';

DIRETORIO_SAIDA='../imagens/5_';

CORTAR_PIXELS_W=50;

CORTAR_PIXELS_H=5;


cortar_imagens( DIRETORIO_ENTRADA, ...
                DIRETORIO_SAIDA, ...
                CORTAR_PIXELS_W, ...
                CORTAR_PIXELS_H);


