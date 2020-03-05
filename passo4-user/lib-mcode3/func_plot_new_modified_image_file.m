function [hfa IMG]=func_plot_new_modified_image_file(FILE_IMG,dat_pixel)

    IMG=imread(FILE_IMG); %% imagem

    N=size(dat_pixel,1); %% numero de amostras

    %% deixo em cor preto em IMG todos os pixels correspondentes a curva
    for II=1:N
        P=dat_pixel(II,:);
        P(1)=round(P(1));
        P(2)=round(P(2));
        IMG(P(2),P(1),:)=0*IMG(P(2),P(1),:);
    end

    %% Plot da figura
    image(IMG)
    daspect ([1 1 1]);
    hfa=gcf;

    xlabel('x-axis')
    ylabel('y-axis')

endfunction

