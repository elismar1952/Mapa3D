function [X Y Z]=pfun(PARAMS,IMAGEPATH1,IMAGEPATH2,CUMULUSON,pasta,ID)
 
    IMG = imread(IMAGEPATH1);
    if(length(size(IMG))>=3)
        error('A imagen nao pode ter formato rgb');
    end
    IMG_BIN_REF=IMG>0.5;

 
    IMG = imread(IMAGEPATH2);
    if(length(size(IMG))>=3)
        error('A imagen nao pode ter formato rgb');
    end
    IMG_BIN=IMG>0.5;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if(mean(mean(IMG_BIN))>0.5)
        IMG_BIN=IMG_BIN<0.5;
    end

    if(mean(mean(IMG_BIN_REF))>0.5)
        IMG_BIN_REF=IMG_BIN_REF<0.5;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    if(size(IMG_BIN,1)~=size(IMG_BIN_REF,1))
        error('Differents number of lines in the images');
    end
    
    if(size(IMG_BIN,2)~=size(IMG_BIN_REF,2))
        error('Differents number of columns in the images');
    end

    H=size(IMG_BIN_REF,1);
    W=size(IMG_BIN_REF,2);

    R = PointsDetector(IMG_BIN);
    R.set_reconstruction_cumulus_on(CUMULUSON);
    R.set_reconstruction_umbral(32);
    [XLIN YLIN]=R.calculates_points();

    R = PointsDetector(IMG_BIN_REF);
    %R.set_reconstruction_cumulus_on(CUMULUSON);
    %R.set_reconstruction_level(1);
    %R.set_reconstruction_parts(10);
    [XREF YREF PP]=R.calculates_line_ref_automatically(XLIN);
    %[XREF YREF]=R.calculates_curve();

    d0=H/2-YREF;
    c0=YREF-YLIN;
    b0=XREF-0.5*W;

    imagesc(IMG_BIN_REF);
    daspect ([1 1 1]);
    hold on
    plot(XREF,YREF,'-o');
    daspect ([1 1 1]);
    hold off
    print(fullfile(pasta,[num2str(ID),'_ref.png']),'-dpng')

    imagesc(IMG_BIN);
    daspect ([1 1 1]);
    hold on
    plot(XLIN,YLIN,'-o');
    daspect ([1 1 1]);
    hold off
    print(fullfile(pasta,[num2str(ID),'_curve.png']),'-dpng')


    [X Y Z]=Tfun(PARAMS,b0,c0,d0);

    %salvar em pasta
    data= [X' Y' Z'];
    save('-ascii',fullfile(pasta,[num2str(ID) '.txt']),'data');

    %%% conf
    save('-ascii',fullfile(pasta,'out_all_params.txt'),'PARAMS');
 
endfunction


  



