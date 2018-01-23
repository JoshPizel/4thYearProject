function plotMass
%function will plot current position of masses and create a picture of such
global D_X D_Y mass
nImages = length(D_X);
massFig=figure('Name','Mass simulation');

positionX = mass(:,1);
positionY = mass(:,2);
size = mass(:,3);

xlimit = [min(positionX)-1 max(positionX)+1];
ylimit = [min(positionY)-1 max(positionY)+1];

%initial picture
scatter(positionX,positionY,size,'filled')
xlim(xlimit)
ylim(ylimit)

Frame = getframe(massFig);


image{1} = frame2im(Frame);

filename = 'image.gif';

[A,map] = rgb2ind(image{1},256);
imwrite(A,map,filename,'gif','loopCount',Inf,'DelayTime',1);
%else imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',1);

%main plotting structure
%for i = 1;1;length(D_X)
    
    
%end


end