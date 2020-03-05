function func_surf_lines(LINE,SHOW=false)
    N=length(LINE);
    
    if SHOW==true
        print_step_text(1,N);
    endif

    scatter3(LINE{1}(:,1),LINE{1}(:,2),LINE{1}(:,3),[],LINE{1}(:,3));
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    daspect([1 1 1])
    colormap(jet)


    for II=2:N  
        if SHOW==true
        print_step_text(II,N);
        endif
  
        hold on
        scatter3(LINE{II}(:,1),LINE{II}(:,2),LINE{II}(:,3),[],LINE{II}(:,3));
        xlabel('X');
        ylabel('Y');
        zlabel('Z');
        daspect([1 1 1])
        colormap(jet)
        hold off
    endfor
    grid on

    if SHOW==true
    fprintf(stdout,'\n');
    endif
endfunction

function print_step_text(II,N)
    fprintf(stdout,'Surf line %3d of %3d\r',II,N);
endfunction
