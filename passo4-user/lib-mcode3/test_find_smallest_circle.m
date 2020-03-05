%%

dat_pixel=rand(120,2);
[C R]=find_smallest_circle(dat_pixel);

scatter(dat_pixel(:,1),dat_pixel(:,2))
daspect([1 1 1])
hold on
t = linspace(0,2*pi,100)'; 
circsx = R.*cos(t) + C(1); 
circsy = R.*sin(t) + C(2); 
plot(circsx,circsy); 
hold off
