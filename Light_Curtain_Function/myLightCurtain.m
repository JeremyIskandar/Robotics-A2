% Create meshgrid to represent light curtain:
[x,z] = meshgrid(-0.55:0.01:0.55, -0.6:0.01:0.4);                   % Sets the location of the meshgrid in the envrionment
y(1:size(x,1),1:1) = -1.5;                                          % y-value is always -1.5 because that's in line with the fences
light_curtain = surf(x,y,z,'FaceAlpha',0.1,'EdgeColor','none');     % 'FaceAlpha' parameter makes the meshgrid transparent
light_curtain_points = zeros(11211,3);                              % Get coords of each point on light curtain [x,y,z] - total 483 points:

% These loops fill the light_curtain_points matrix with the meshgrid points in the format [x,y,z] (for use with collision function later):
index = 1;
for x_rows = 1:101
    for x_columns = 1:111
        light_curtain_points(index,1) = x(x_rows,x_columns);
        index = index + 1;
    end
end

for rows = 1:11211
    light_curtain_points(rows,2) = -1.5;
end

index = 1;
for z_rows = 1:101
    for z_columns = 1:111
        light_curtain_points(index,3) = z(z_rows,z_columns);
        index = index + 1;
    end
end