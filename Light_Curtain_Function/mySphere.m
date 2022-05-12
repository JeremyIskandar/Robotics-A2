function [sphere_points] = mySphere(centerX,centerY,centerZ)

% Create sphere, plot, and gather all points on face

sphereCenter = [centerX,centerY,centerZ];
radius = 0.3;
[X,Y,Z] = sphere(20);
X = X * radius + sphereCenter(1);
Y = Y * radius + sphereCenter(2);
Z = Z * radius + sphereCenter(3);

sphere_points = [X(:),Y(:),Z(:)]; % - total 483 points

% plot a triangle mesh
tri = delaunay(X,Y,Z);
sphereTri_h = trimesh(tri,X,Y,Z);
drawnow();
end

