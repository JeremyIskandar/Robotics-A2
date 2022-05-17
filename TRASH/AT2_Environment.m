close all
clc

profile on

set(0,'DefaultFigureWindowStyle','docked')

diary LogOfTransforms
diary on

potMod_mesh_h = PlaceObject('potMod_2_0.05.ply',[0.07,-0.07,0.05]);
hold on 
bottle_mesh_h = PlaceObject('bottle_0.02.ply',[-0.7,0.3,0.05]);
hold on 
% place table at desired pose
table_mesh_h = PlaceObject('table_colour.ply',[0,0,0]); 
hold on 
% place fence at desired pose
fence_mesh_h_1 = PlaceObject('fence_mod.ply',[-1.5,0,0]);
hold on
fence_mesh_h_2 = PlaceObject('fence_mod.ply',[-1.5,-0.6,0]);
hold on
fence_mesh_h_3 = PlaceObject('fence_mod.ply',[-1.5,0.6,0]);
hold on
fence_mesh_h_4 = PlaceObject('fence_mod.ply',[1.5,0,0])
hold on 
fence_mesh_h_5 = PlaceObject('fence_mod.ply',[1.5,-0.6,0]);
hold on
fence_mesh_h_6 = PlaceObject('fence_mod.ply',[1.5,0.6,0]);
hold on 

fence_mesh_h_7 = PlaceObject('fence_mod_flipped_new.ply',[1.2,0.95,0]);
hold on 
fence_mesh_h_8 = PlaceObject('fence_mod_flipped_new.ply',[0.6,0.95,0]);
hold on 
fence_mesh_h_9 = PlaceObject('fence_mod_flipped_new.ply',[0,0.95,0]);
hold on
fence_mesh_h_10 = PlaceObject('fence_mod_flipped_new.ply',[-0.6,0.95,0]);
hold on 
fence_mesh_h_11 = PlaceObject('fence_mod_flipped_new.ply',[-1.2,0.95,0]);
hold on

fence_mesh_h_12 = PlaceObject('fence_mod_flipped_new.ply',[-1.2,-0.95,0]);
hold on
fence_mesh_h_13 = PlaceObject('fence_mod_flipped_new.ply',[-0.6,-0.95,0]);
hold on 
fence_mesh_h_14 = PlaceObject('fence_mod_flipped_new.ply',[0,-0.95,0]);
hold on
fence_mesh_h_15 = PlaceObject('fence_mod_flipped_new.ply',[0.6,-0.95,0]);
hold on 
fence_mesh_h_16 = PlaceObject('fence_mod_flipped_new.ply',[1.2,-0.95,0]);

hold on
% place Emergency stop button at desired pose
eStop_mesh_h_1 = PlaceObject('Emergency_Stop_mod_new1.ply',[0,1,0]);

% place Fire Extinguisher at desired pose
FE_mesh_h_1 = PlaceObject('FE_mod_1.ply',[-0.5,1,-0.1]);


workspace =  [-3 3 -3 3 -0.3 3]; 
scale = 0.5; % scales ur3 robot to an appropriate size



L1 = Link('d',0.1519,'a',0,'alpha',(pi/2),'offset',0);%,'qlim',[0,0]);
L2 = Link('d',0,'a',-0.24365,'alpha',0,'offset',0);%'qlim',[0,0]);
L3 = Link('d',0,'a',-0.21325,'alpha',0,'offset',0);%'qlim',[0,0]);
L4 = Link('d',0.11235,'a',0,'alpha',(pi/2),'offset',0);%,'qlim',[0,0]);
L5 = Link('d',0.08535,'a',0,'alpha',(-pi/2),'offset',0);%,'qlim',[0,0]);
L6 = Link('d',0.0819,'a',0,'alpha',0,'offset',0);%,'qlim',[0,0]);

ur3 = SerialLink([L1 L2 L3 L4 L5 L6], 'name', 'UR3');

qInitial = [3.1416 -0.5027 0.7540 -1.8221 -1.5080 -1.5708]; % initial joint angles of ur3 

ur3.base = ur3.base * transl(-0.5,0,0); % ur3 base pose

ur3.plot(qInitial) 

axis equal

hold on 