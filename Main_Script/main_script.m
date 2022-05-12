%% 41013 Lab Assignment 2 - DoBotany

clear all
% close all
clc

myEnv;      % calls myEnv function which plots all objects in environment

dobot = myDobotRail();        % calls myDobot class which initialises and plots dobot model 

% q = dobot.model.getpos();     % Get the joint angles at the current position        
% J = dobot.model.jacob0(q);

%robotMove;  % calls robotMove function which plots all trajectories

<<<<<<< HEAD
%db_workspace(30,0.5);       %creates pointcloud of dobots workspace- input step_degs (15-30 degs pref), input step_rail (0.5m 0.33m 0.25m)

%dobot_move_more();      % make robot move to test DOF's extension in -0.5m linear rail struggle
%dobot_move(-0.676,-0.177,0.217, dobot.model.getpos()); %desired x,y,z EE location with previous pos or ref point
%dobot_move(0,-0.2,0.25, dobot.model.getpos());
%dobot_move_more();
% water_plant_1();

%% dobot_move Testing
%this seems to work!
%maybe the next step is change the input for dobot_move from (x,y,z...) to
%a 1x3 array, so we can set plant1=[x,y,z]; then call dobot_move(plant1...)
clear all
clc

myEnv;

dobot = myDobotRail;
%dobot_move(-0.5,-0.25,0.15,dobot.model.getpos(),50);
%dobot_move(0.5,0.25,0.1,dobot.model.getpos(),50);
%dobot_move(-0.25,0.15,0.2,dobot.model.getpos(),50);

%% Light Curtain Testing

%lightCurtain;

[x,z] = meshgrid(-0.55:0.02:0.55, -0.6:0.02:0.4);
y(1:size(x,1),1:1) = -1.5;
surf(x,y,z,'FaceAlpha',0.2,'EdgeColor','none');    %transparent
=======
%db_workspace(30,0.5);

dobot_move_more();      % make robot move to test DOF's extension in -0.5m linear rail struggle
%dobot_move(-0.676,-0.177,0.217, dobot.model.getpos()); %desired x,y,z EE location with previous pos or ref point
dobot_move(0,-0.2,0.25, dobot.model.getpos());
dobot_move_more();
% dobot_move_more();
% water_plant_1();

>>>>>>> 4155db0e27293b482a144fcf6e225a1e0f9def20

person = PlaceObject('person.ply',[0,-1.5,-0.7]);
person_vertices = get(person,'Vertices');