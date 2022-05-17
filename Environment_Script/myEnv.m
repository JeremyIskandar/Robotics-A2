%profile on                                     % Turn MATLAB Profiler on to track performance

diary LogOfTransforms                           % Record errors in file
diary on

hold on                                         % Plot all objects in same figure
axis equal
%set(gcf,'DefaultFigureWindowStyle','docked')   % Set figure to open docked

% Plot floor tiles in environment:
surf([-1.8,-1.8;1.8,1.8],[-1.8,1.8;-1.8,1.8],[-0.7,-0.7;-0.7,-0.7],'CData',imread('floor_tile.jpg'),'FaceColor','texturemap');

% Plot fences around the table:
fence_mesh_h_1 = PlaceObject('fence_mod.ply',[-1.75,0.75,-0.7]);
fence_mesh_h_2 = PlaceObject('fence_mod.ply',[-1.75,-0.75,-0.7]);
fence_mesh_h_3 = PlaceObject('fence_mod.ply',[1.75,0.75,-0.7]);
fence_mesh_h_4 = PlaceObject('fence_mod.ply',[1.75,-0.75,-0.7]);
fence_mesh_h_5 = PlaceObject('fence_mod_flipped_new.ply',[-1.175,1.5,-0.7]);
fence_mesh_h_6 = PlaceObject('fence_mod_flipped_new.ply',[0,1.5,-0.7]);
fence_mesh_h_7 = PlaceObject('fence_mod_flipped_new.ply',[1.175,1.5,-0.7]);
fence_mesh_h_8 = PlaceObject('fence_mod_flipped_new.ply',[-1.175,-1.5,-0.7]);
fence_mesh_h_9 = PlaceObject('fence_mod_flipped_new.ply',[1.175,-1.5,-0.7]);

eStop_mesh_h_1 = PlaceObject('Emergency_Stop_mod_new1.ply',[-1,-1.39,0.25]);    % Plot emergency stop button on fence
FE_mesh_h_1 = PlaceObject('FE_mod_1.ply',[-1.6,1.4,-0.7]);                      % Plot fire extinguisher in corner of room

table_mesh_h = PlaceObject('table_colour.ply',[0,0,0]);                         % Plot table
bottle_mesh_h = PlaceObject('bottle_0.02.ply',[-0.7,0.3,0]);                    % Plot water bottle on table
pump = PlaceObject('pump.ply',[0,0.3,0]);                                       % Plot water pump on table
rail = PlaceObject('rail.ply',[0,0,-0.025]);                                    % Plot dobot rail on table

% Plot plants on table:
potMod_mesh_h1 = PlaceObject('potMod_2_0.05 - JEREM_1.ply',[0,-0.2,-0.045]);
potMod_mesh_h2 = PlaceObject('potMod_2_0.05 - JEREM_1.ply',[-0.5,-0.2,-0.045]);
potMod_mesh_h3 = PlaceObject('potMod_2_0.05 - JEREM_1.ply',[0.5,-0.2,-0.045]);
potMod_mesh_h4 = PlaceObject('potMod_2_0.05 - JEREM_1.ply',[0.25,0.2,-0.045]);
potMod_mesh_h5 = PlaceObject('potMod_2_0.05 - JEREM_1.ply',[-0.25,0.2,-0.045]);