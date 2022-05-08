%% 41013 Lab Assignment 2 - DoBotany

clear all
% close all
clc

myEnv;      % calls myEnv function which plots all objects in environment

global dobot
dobot = myDobotRail;        % calls myDobot class which initialises and plots dobot model 

% q = dobot.model.getpos();     % Get the joint angles at the current position        
% J = dobot.model.jacob0(q);

%robotMove;  % calls robotMove function which plots all trajectories

%db_workspace(30,0.5);

dobot_move_more();      % make robot move to test DOF's extension in -0.5m linear rail struggle
%dobot_move(-0.676,-0.177,0.217, dobot.model.getpos()); %desired x,y,z EE location with previous pos or ref point
dobot_move(0,-0.2,0.25, dobot.model.getpos());
dobot_move_more();
% water_plant_1();


%db_workspace(30,0.5);       %creates pointcloud of dobots workspace- input step_degs (15-30 degs pref), input step_rail (0.5m 0.33m 0.25m)