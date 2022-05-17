function [sphere_points] = mySphere(centerX,centerY,centerZ)

    % This function creates a sphere of user-defined radius in the environment

    sphereCenter = [centerX,centerY,centerZ];   % Create sphere
    radius = 0.3;                               % Set radius
    [X,Y,Z] = sphere(20);                       % Set [x,y,z] points of sphere
    X = X * radius + sphereCenter(1);
    Y = Y * radius + sphereCenter(2);
    Z = Z * radius + sphereCenter(3);

    sphere_points = [X(:),Y(:),Z(:)];           % Combine [x,y,z] points into sphere_points matrix - total 483 points

    % Plot a triangle mesh:
    tri = delaunay(X,Y,Z);
    sphereTri_h = trimesh(tri,X,Y,Z);
    drawnow();
end

