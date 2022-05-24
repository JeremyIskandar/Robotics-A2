% function [] = water_plant_real()
%% Movement working out
% Z = 0.09 height of the bucket
% X = 0.15 min 0.3 max
% Y = pos left neg right

% radius of pot = 0.06m  height = 0.09m
% radius to water = 0.035m   watering height = 0.12m    
% centre of pot x = 0.26m (In dobot plane of reference if rail = 0.5) 

% rail pos's = 0 + 0.2 , 0.5 , 1 - 0.2 = 0.2,0.5,0.8
% following above ^^ x,y of pot centre for EE ref will be:
% x,y,z = (0.26,-0.2); (0.26,0); (0.26,0.2)
% z = 0.12

%% Movement ONLY test
% rail_centre = 0.5;
% rail_zero = 0;
% rail_one = 1;
rail_offset = 0.2;
z_water = 0.12;
x_water = 0.26;

Move_rail(0.5, 0); % 0 for init since first use of rail centre pos
Set_EE_State_2(0.2,0,0.1,dobot) % default pose

% water plant 1
Move_rail(0 + rail_offset, 1); % no longer requires init
Set_EE_State_2(x_water,-rail_offset,z_water);
disp('Plant 1 has been watered');

% water plant 2
Move_rail(0.5, 1); 
Set_EE_State_2(x_water,0,z_water);

% water plant 3
Move_rail(1 - rail_offset, 1); 
Set_EE_State_2(x_water,rail_offset,z_water);

%% Movement AND rotation watering
rail_offset = 0.2;  % offset from edges of rail limit 0 and 1
z_water = 0.12;     % watering height
x_water = 0.26;     % x pos of centre
r = 0.035;          % radius to water

Move_rail(0.5, 0); % 0 for init since first use of rail centre pos
Set_EE_State_2(0.2,0,0.1,dobot); % default pose

% water plant 1
rail_extra_offset = 0 + rail_offset;
Move_rail(rail_extra_offset, 1); % no longer requires init
Set_EE_State_2(x_water,-rail_offset,z_water,dobot); % set to plant centre

% Switch case for watering different plants:
% switch plant_switch
%     case 1                                      % Water plant 1 
%         rail_extra_offset = 0 + rail_offset;
%         Move_rail(rail_extra_offset, 1);                % no longer requires init
%         Set_EE_State_2(x_water,-rail_offset,z_water);   % move to plant centre
%     case 2                                      % Water plant 2 
%         rail_extra_offset = 0.5;
%         Move_rail(rail_extra_offset, 1); 
%         Set_EE_State_2(x_water,0,z_water)
%     case 3                                      % Water plant 3 
%         rail_extra_offset = 1 - rail_offset;
%         Move_rail(1 - rail_offset, 1); 
%         Set_EE_State_2(x_water,rail_offset,z_water)
% end

% Plant rotation component
increm_angle = 30;                              % Angle increment for circle
max_angle = 360;                                % Revolutions 1 per 360 degs

for theta = 0:increm_angle:max_angle            % In degrees increment
    x2 = -r*cos(deg2rad(theta)) + x_water;     % Next x,y coordinate circum inside pot
    y2 = -r*sin(deg2rad(theta)) + rail_extra_offset;
    
    if theta == 0
        Set_EE_State_2(x2,y2,z_water,dobot);        % If first iteration, want animation slow
        pause(0.1);     % place holder pause
    else                                        % 2nd ++ iteration fast animations using less steps in dobot_move
        Set_EE_State_2(x2,y2,z_water,dobot);     % 0,-0.2,0.25      0,-0.165,0.25       r = 0.015
    end
end
Set_EE_State_2(0.2,0,0.1,dobot) % default pose




% end