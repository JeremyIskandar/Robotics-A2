%% Light Curtain

[x,z] = meshgrid(-0.55:0.02:0.55, -0.6:0.02:0.4);
y(1:size(x,1),1:1) = -1.5;
surf(x,y,z,'FaceAlpha',0.2,'EdgeColor','none');    %transparent

%% Check for Intersection

person_vertices = get(person,'Vertices');

LinePlaneIntersection()