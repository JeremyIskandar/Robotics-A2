%% 41013 Lab Assignment 2 - DoBotany

clear
clc

myEnv;                          % Calls myEnv function which plots all objects in environment
dobot = myDobotRail();          % Calls myDobot class which initialises and plots dobot model 
myLightCurtain;                 % Calls myLightCurtain script which plots light curtain between fence opening in environment

% q = dobot.model.getpos();     % Get the joint angles at the current position        
% J = dobot.model.jacob0(q);    % Get Jacobian at current position
% db_workspace(30,0.25);        % Creates pointcloud of dobots workspace- input step_degs (15-30 degs pref), input step_rail (0.5m 0.33m 0.25m)

%% Initialization (waters all five plants in order 1 -> 5)
for plant_switch = 1:1:5        % Water plants 1 -> 5 in order
    water_plant_2(dobot, plant_switch);
end

%% Soil moisture sensor mode
% https://lastminuteengineers.com/soil-moisture-sensor-arduino-tutorial/
% < 500 too wet     500 - 700 target range      >750 dry
% myWaterPlantMoisture(dobot);

%% Automatic watering mode with timer
% timer = 3; %How many second delay between each watering phase
% auto = 1; %auto = 1 for auto loop
% auto_mode(dobot, timer, auto);

%% Visual servoing
% myVisualServoing(dobot);        % Calls myVisualServoing function
% myEnv;                          % Calls myEnv function which plots all objects in environment
% dobot = myDobotRail();
%% Light Curtain
%-->Person model has over 17k vertices so takes long time to process!
%person = PlaceObject('person.ply',[0,-1.5,-0.7]);
%person_vertices = get(person,'Vertices');

% sphere_points = mySphere(0,-1.7,0.55);      % Creates a sphere at the user input [x,y,z] location in environment
% 
% collision_point = LightCurtainCollision(light_curtain_points,sphere_points);    % You can substitute "sphere_points" with "person_vertices"