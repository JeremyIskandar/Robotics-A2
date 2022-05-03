profile on
set(0,'DefaultFigureWindowStyle','docked')

diary LogOfTransforms
diary on

hold on
axis equal

potMod_mesh_h = PlaceObject('potMod_2_0.05.ply',[0.07,-0.07,0.05]);
bottle_mesh_h = PlaceObject('bottle_0.02.ply',[-0.7,0.3,0.05]);
table_mesh_h = PlaceObject('table_colour.ply',[0,0,0]);                 % place table at desired pose
fence_mesh_h_1 = PlaceObject('fence_mod.ply',[-1.5,0,0]);               % place fence at desired pose
fence_mesh_h_2 = PlaceObject('fence_mod.ply',[-1.5,-0.6,0]);
fence_mesh_h_3 = PlaceObject('fence_mod.ply',[-1.5,0.6,0]);
fence_mesh_h_4 = PlaceObject('fence_mod.ply',[1.5,0,0]);
fence_mesh_h_5 = PlaceObject('fence_mod.ply',[1.5,-0.6,0]);
fence_mesh_h_6 = PlaceObject('fence_mod.ply',[1.5,0.6,0]);
fence_mesh_h_7 = PlaceObject('fence_mod_flipped_new.ply',[1.2,0.95,0]);
fence_mesh_h_8 = PlaceObject('fence_mod_flipped_new.ply',[0.6,0.95,0]);
fence_mesh_h_9 = PlaceObject('fence_mod_flipped_new.ply',[0,0.95,0]);
fence_mesh_h_10 = PlaceObject('fence_mod_flipped_new.ply',[-0.6,0.95,0]);
fence_mesh_h_11 = PlaceObject('fence_mod_flipped_new.ply',[-1.2,0.95,0]);
fence_mesh_h_12 = PlaceObject('fence_mod_flipped_new.ply',[-1.2,-0.95,0]);
fence_mesh_h_13 = PlaceObject('fence_mod_flipped_new.ply',[-0.6,-0.95,0]);
fence_mesh_h_14 = PlaceObject('fence_mod_flipped_new.ply',[0,-0.95,0]);
fence_mesh_h_15 = PlaceObject('fence_mod_flipped_new.ply',[0.6,-0.95,0]);
fence_mesh_h_16 = PlaceObject('fence_mod_flipped_new.ply',[1.2,-0.95,0]);
eStop_mesh_h_1 = PlaceObject('Emergency_Stop_mod_new1.ply',[0,1,0]);    % place Emergency stop button at desired pose
FE_mesh_h_1 = PlaceObject('FE_mod_1.ply',[-0.5,1,-0.1]);                % place Fire Extinguisher at desired pose