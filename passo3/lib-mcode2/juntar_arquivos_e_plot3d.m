function juntar_arquivos_e_plot3d(RESULTADO,INIT,ENDD)

    NN=128;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% Juntar todos os dados em 'dat'
    filedata=fullfile(RESULTADO,[ num2str(INIT)  '.txt']);
    dat = load (filedata);
    plot(dat(:,1),  dat(:,3), "o") 
    %daspect ([1 1 1]);
    print(fullfile(RESULTADO,'1_3d.png'),'-dpng')

    for ID=(INIT+1):ENDD
      filedata=fullfile(RESULTADO,[ num2str(ID)  '.txt']);
      DDD=load (filedata);

      plot(DDD(:,1), DDD(:,3), "o") 
      %daspect ([1 1 1]);
      print(fullfile(RESULTADO,[num2str(ID),'_3d.png']),'-dpng')
      dat =[dat; DDD];
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
    print(h1,fullfile(RESULTADO,'scatter3.png'),'-dpng')

    figure;
    h2=gcf();
    surf(xxi,yyi,zzi)
    colormap(jet)
    xlabel('metros')
    ylabel('metros')
    zlabel('metros')
    daspect ([1 1 1]);
    print(h2,fullfile(RESULTADO,'all_mesh.png'),'-dpng')


    figure;
    h3=gcf();
    contour(xxi,yyi,zzi,64)
    colormap(jet)
    xlabel('metros')
    ylabel('metros')
    zlabel('metros')
    daspect ([1 1 1]);
    print(h3,fullfile(RESULTADO,'all_contour.png'),'-dpng')

endfunction
