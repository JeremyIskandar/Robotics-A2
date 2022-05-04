%% 41013 Lab Assignment 2 - DoBotany

clear all
close all
clc

myEnv;      % calls myEnv function which plots all objects in environment

dobot = myDobotRail;        % calls myDobot class which initialises and plots dobot model
% q = dobot.model.getpos();     % Get the joint angles at the current position        
% J = dobot.model.jacob0(q);

robotMove;  % calls robotMove function which plots all trajectories