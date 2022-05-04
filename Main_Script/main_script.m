%% 41013 Lab Assignment 2 - DoBotany

clear all
% close all
clc

myEnv;      % calls myEnv function which plots all objects in environment

dobot = myDobotRail;        % calls myDobot class which initialises and plots dobot model
% q = dobot.model.getpos();     % Get the joint angles at the current position        
% J = dobot.model.jacob0(q);

%robotMove;  % calls robotMove function which plots all trajectories

% dobot_move(0.3, 0.3, 0.1);      % series of move functions
% dobot_move(-0.4,-0.4,0.1);
% dobot_move(-0.3,-0.3,0.2);
% dobot_move(0.2,-0.1,0.15);
% dobot_move(-0.2,0.3,0.22);
% dobot_move(0.3,-0.4,0.13);
% dobot_move(0.4,0.3,0.18);

db_workspace(30,0.5);       %creates pointcloud of dobots workspace- input step_degs (15-30 degs pref), input step_rail (0.5m 0.33m 0.25m)