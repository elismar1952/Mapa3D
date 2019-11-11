function fh1=function_control_plot(hf)


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % create figure and panel on it
    fh1 = figure;
    % 

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % create a button group
    gp = uibuttongroup (fh1, "Position", [ 0 0 1 1]);
    % create a buttons in the group
    figure(hf)
    [azimuth, elevation] = view ();





    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    t1 = uicontrol (gp, "style", "text", ...
                    "string", num2str(elevation), ...
                    "Position", [ 10 100 100 30 ]);

    b1 = uicontrol (gp, "style", "pushbutton", ...
                    "string", "elevation+5", ...
                    "Position", [ 10 150 100 30 ], ...
                    "CallBack", {@Push1,hf,t1});
    b2 = uicontrol (gp, "style", "pushbutton", ...
                    "string", "elevation-5", ...
                    "Position", [ 10 50 100 30 ], ...
                    "CallBack", {@Push2,hf,t1});

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    t2 = uicontrol (gp, "style", "text", ...
                    "string", num2str(azimuth), ...
                    "Position", [ 150 100 100 30 ]);

    b3 = uicontrol (gp, "style", "pushbutton", ...
                    "string", "azimuth+5", ...
                    "Position", [ 150 150 100 30 ], ...
                    "CallBack", {@Push3,hf,t2});
    b4 = uicontrol (gp, "style", "pushbutton", ...
                    "string", "azimuth-5", ...
                    "Position", [ 150 50 100 30 ], ...
                    "CallBack", {@Push4,hf,t2});

endfunction

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Push1(source,event,hd,t1)
    figure(hd)
    [azimuth, elevation] = view ();
    view([azimuth, elevation+5] )
    [azimuth, elevation] = view ();
    set(t1,'String',num2str(elevation)); 
end

function Push2(source,event,hd,t1)
    figure(hd)
    [azimuth, elevation] = view ();
    view([azimuth, elevation-5] )
    [azimuth, elevation] = view ();
    set(t1,'String',num2str(elevation)); 
end


function Push3(source,event,hd,t1)
    figure(hd)
    [azimuth, elevation] = view ();
    view([azimuth+5, elevation] )
    [azimuth, elevation] = view ();
    set(t1,'String',num2str(azimuth)); 
end

function Push4(source,event,hd,t1)
    figure(hd)
    [azimuth, elevation] = view ();
    view([azimuth-5, elevation] )
    [azimuth, elevation] = view ();
    set(t1,'String',num2str(azimuth)); 
end
