function COLOR=select_cores(IMAGERGB,NCORES)

   imshow(IMAGERGB);
   daspect([ 1 1 1])
   [COL LIN]=ginput(1);
   TMP=IMAGERGB(round(LIN),round(COL),:);
   COLOR=[TMP(:,:,1) TMP(:,:,2) TMP(:,:,3)]
   hold on
   plot (COL,LIN,'-ro')
   hold off
   disp(' ')
   [COL LIN]=ginput(1);
   TMP=IMAGERGB(round(LIN),round(COL),:);
   COLOR=[COLOR;TMP(:,:,1) TMP(:,:,2) TMP(:,:,3)]
   hold on
   plot (COL,LIN,'-ro')
   hold off
   disp(' ')

endfunction
