%
addpath(genpath('mcode'))

DIRETORIO_ENTRADA='../imagens/img2_CaixaBranca';

DIRETORIO_SAIDA='../imagens/img2_CaixaBranca_cut';

CORTAR_PIXELS_W=410;

CORTAR_PIXELS_H=100;


cortar_imagens( DIRETORIO_ENTRADA, ...
                DIRETORIO_SAIDA, ...
                CORTAR_PIXELS_W, ...
                CORTAR_PIXELS_H);


