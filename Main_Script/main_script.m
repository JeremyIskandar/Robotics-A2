%% 41013 Lab Assignment 2 - DoBotany

clear all
% close all
clc

myEnv;      % calls myEnv function which plots all objects in environment

dobot = myDobotRail();        % calls myDobot class which initialises and plots dobot model 

% q = dobot.model.getpos();     % Get the joint angles at the current position        
% J = dobot.model.jacob0(q);

% db_workspace(30,0.25);       %creates pointcloud of dobots workspace- input step_degs (15-30 degs pref), input step_rail (0.5m 0.33m 0.25m)

%% Initialization (waters all five plants in order 1 -> 5)
for plant_switch = 1:1:5            % Water plants 1 - > 5 in order
    water_plant_2(dobot, plant_switch);
end

%% Soil moisture sensor
% https://lastminuteengineers.com/soil-moisture-sensor-arduino-tutorial/
% < 500 too wet     500 - 700 target range      >750 dry
water_plant_moisture(dobot);

%% Visual servoing
dobot_visual_servoing(dobot);

%% Light Curtain Testing

%lightCurtain;

[x,z] = meshgrid(-0.55:0.02:0.55, -0.6:0.02:0.4);
y(1:size(x,1),1:1) = -1.5;
surf(x,y,z,'FaceAlpha',0.2,'EdgeColor','none');    %transparent

%db_workspace(30,0.5);

dobot_move_more();      % make robot move to test DOF's extension in -0.5m linear rail struggle
%dobot_move(-0.676,-0.177,0.217, dobot.model.getpos()); %desired x,y,z EE location with previous pos or ref point
dobot_move(0,-0.2,0.25, dobot.model.getpos());
dobot_move_more();
% dobot_move_more();
% water_plant_1();


person = PlaceObject('person.ply',[0,-1.5,-0.7]);
person_vertices = get(person,'Vertices');