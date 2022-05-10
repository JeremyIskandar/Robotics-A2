profile on
set(0,'DefaultFigureWindowStyle','docked')

diary LogOfTransforms
diary on

hold on
axis equal

%plot floor tiles
surf([-1.8,-1.8;1.8,1.8],[-1.8,1.8;-1.8,1.8],[-0.7,-0.7;-0.7,-0.7],'CData',imread('floor_tile.jpg'),'FaceColor','texturemap');

%potMod_mesh_h = PlaceObject('potMod_2_0.05.ply',[0.07,-0.07,0.05]);
bottle_mesh_h = PlaceObject('bottle_0.02.ply',[-0.7,0.3,0]);
table_mesh_h = PlaceObject('table_colour.ply',[0,0,0]);                 % place table at desired pose

fence_mesh_h_1 = PlaceObject('fence_mod.ply',[-1.75,0.75,-0.7]);        % place fences at desired pose
fence_mesh_h_2 = PlaceObject('fence_mod.ply',[-1.75,-0.75,-0.7]);
fence_mesh_h_3 = PlaceObject('fence_mod.ply',[1.75,0.75,-0.7]);
fence_mesh_h_4 = PlaceObject('fence_mod.ply',[1.75,-0.75,-0.7]);
fence_mesh_h_5 = PlaceObject('fence_mod_flipped_new.ply',[-1.175,1.5,-0.7]);
fence_mesh_h_6 = PlaceObject('fence_mod_flipped_new.ply',[0,1.5,-0.7]);
fence_mesh_h_7 = PlaceObject('fence_mod_flipped_new.ply',[1.175,1.5,-0.7]);
fence_mesh_h_8 = PlaceObject('fence_mod_flipped_new.ply',[-1.175,-1.5,-0.7]);
fence_mesh_h_9 = PlaceObject('fence_mod_flipped_new.ply',[1.175,-1.5,-0.7]);

eStop_mesh_h_1 = PlaceObject('Emergency_Stop_mod_new1.ply',[-1,-1.39,0.25]);    % place Emergency stop button at desired pose
FE_mesh_h_1 = PlaceObject('FE_mod_1.ply',[-1.6,1.4,-0.7]);              % place Fire Extinguisher at desired pose

rail = PlaceObject('rail.ply',[0,0,-0.025]);    % plot dobot rail on table

%% Plant positions
potMod_mesh_h1 = PlaceObject('potMod_2_0.05.ply',[0,-0.2,0]);
potMod_mesh_h2 = PlaceObject('potMod_2_0.05.ply',[-0.5,-0.2,0]);
potMod_mesh_h3 = PlaceObject('potMod_2_0.05.ply',[0.5,-0.2,0]);