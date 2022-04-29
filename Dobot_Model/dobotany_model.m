% Dobot Magician Specs: https://www.dobot.cc/dobot-magician/specification.html

clear all
close all
clc

L1 = Link('d',0.12,'a',0,     'alpha',pi/2, 'qlim',[-pi/2       pi/2]);     %0.12 is an estimate!!
L2 = Link('d',0,   'a',0.135, 'alpha',0,    'qlim',[5*pi/180    pi/2]);
L3 = Link('d',0,   'a',0.147, 'alpha',0,    'qlim',[-pi/2 -10*pi/180]);
L4 = Link('d',0,   'a',0.0385,'alpha',-pi/2,    'qlim',[-pi/2       pi/2]); %0.0385 calculated using pythag and known angles/distances

dobot = SerialLink([L1 L2 L3 L4], 'name', 'dobot');     % Create the robot model
workspace = [-0.5 0.5 -0.5 0.5 0 0.5];                  % Define the boundaries of the workspace        
scale = 1;                                              % Scale the robot down        
q = zeros(1,4);                                         % Generate a vector of joint angles
%dobot.base = dobot.base * transl(0,-0.25,1.1);         % set base location of robot
dobot.plot(q,'workspace',workspace,'scale',scale)       % Plot the robot
dobot.delay = 0;

view(125,20)     %set camera view

dobot.teach;
q = dobot.getpos();     % Get the joint angles at the current position        
J = dobot.jacob0(q);

% test - 29 April 2022 14:19
