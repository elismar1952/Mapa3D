function [point1, point2]=func_select_points(hfa)
    figure(hfa)
    h = msgbox ("Please, select the first point in the image", "Select poit: 1 of 2");
    [col1, lin1] = ginput (1);
    col1=round(col1);
    lin1=round(lin1);
    point1=[col1 lin1];

    hold on
    scatter([col1],[lin1],[],'k','linewidth',5);
    hold off

    h = msgbox ("Please, select the second point in the image", "Select poit: 2 of 2");
    [col2, lin2] = ginput (1);
    col2=round(col2);
    lin2=round(lin2);
    point2=[col2 lin2];

    hold on
    scatter([col2],[lin2],[],'k','linewidth',5);
    hold off

endfunction
