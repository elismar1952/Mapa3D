function [B Y C]=sfun(PARAMS,IMAGEPATH1,IMAGEPATH2,CUMULUSON,nome,ID)
 
  IMG = imread(IMAGEPATH1);
  IMG_BIN_REF=IMG>0.5;

 
  IMG = imread(IMAGEPATH2);
  IMG_BIN=IMG>0.5;

   if(size(IMG_BIN,1)~=size(IMG_BIN_REF,1))
        error('Differents number of lines in the images');
    end
    
    if(size(IMG_BIN,2)~=size(IMG_BIN_REF,2))
        error('Differents number of columns in the images');
    end

    H=size(IMG_BIN_REF,1);
    W=size(IMG_BIN_REF,2);

    R = LineDetector(IMG_BIN);
    R.set_reconstruction_cumulus_on(CUMULUSON);
    R.set_reconstruction_level(0);
    R.set_reconstruction_parts(24);
    [XLIN YLIN]=R.calculates_curve();

    R = LineDetector(IMG_BIN_REF);
    R.set_reconstruction_cumulus_on(CUMULUSON);
    R.set_reconstruction_level(1);
    R.set_reconstruction_parts(10);
    [XREF YREF]=R.calculates_curve();

    d0=H/2-YREF;
    c0=YREF-YLIN;
    b0=XREF-0.5*W;


    [X Y Z]=Tfun(PARAMS,b0,c0,d0);

%salvar em nome
data= [X' Y' Z'];
save('-ascii',[nome num2str(ID) '.txt'],'data');
  

    

 
endfunction


  


