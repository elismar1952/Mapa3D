function juntar_arquivos_e_plot3d(RESULTADO,INIT,ENDD)

    NN=128;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% Juntar todos os dados em 'dat'

    for ID=INIT:ENDD
      filedata=fullfile(RESULTADO,[ num2str(ID)  '.txt']);
      DDD=load (filedata);
      disp(["Data loaded:" filedata ]);

      plot(DDD(:,1), DDD(:,3), "o") 
      %daspect ([1 1 1]);
      filedataname=fullfile(RESULTADO,[num2str(ID),'_3d.png']);
      print(filedataname,'-dpng')
      if(ID==INIT)
        dat =DDD;
      else
        dat =[dat; DDD];
      end
      disp(["Saved the image:" filedataname ]);
    endfor
    % Agora dat esta completo


    xi =linspace(min(dat(:,1)),max(dat(:,1)),NN);
    yi =linspace(min(dat(:,2)),max(dat(:,2)),2*(ENDD));
    [xxi, yyi] = meshgrid ( xi,yi);
    zzi = griddata(dat(:,1), dat(:,2), dat(:,3), xxi, yyi);


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % plotando a superficie  de todos os dados de 'dat'
    figure;
    h1=gcf();
    scatter3(dat(:,1), dat(:,2), dat(:,3))
    xlabel('metros')
    ylabel('metros')
    zlabel('metros')
    colormap(jet)
    daspect ([1 1 1]);
    filedata=fullfile(RESULTADO,'scatter3.png');
    print(h1,filedata,'-dpng')
    disp(["Saved the image:" filedata ]);

    figure;
    h2=gcf();
    surf(xxi,yyi,zzi)
    colormap(jet)
    xlabel('metros')
    ylabel('metros')
    zlabel('metros')
    daspect ([1 1 1]);
    filedata=fullfile(RESULTADO,'all_mesh.png');
    print(h2,filedata,'-dpng')
    disp(["Saved the image:" filedata ]);


    figure;
    h3=gcf();
    contour(xxi,yyi,zzi,64)
    colormap(jet)
    xlabel('metros')
    ylabel('metros')
    zlabel('metros')
    daspect ([1 1 1]);
    filedata=fullfile(RESULTADO,'all_contour.png');
    print(h3,filedata,'-dpng')
    disp(["Saved the image:" filedata ]);

endfunction
