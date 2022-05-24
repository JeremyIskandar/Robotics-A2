function [] = water_plant_real_REAL(plant_switch,dobot)    % plant_switch for plant 1,2,3
rail_offset = 0.1  % offset from edges of rail limit 0 and 1
z_water = 0.05;     % watering height
x_water = 0.25;     % x pos of centre
r = 0.035;          % radius to water

Move_rail(0.5, 0); % 0 for init since first use of rail centre pos
Set_EE_State_2(0.2,0,0.1,dobot); % default pose

%% Switch case for watering different plants:
switch plant_switch
    case 1                                      % Water plant 1 
        rail_extra_offset = 0 + rail_offset;
        Move_rail(rail_extra_offset, 1);                % no longer requires init
        Set_EE_State_2(x_water,rail_offset,z_water,dobot);   % move to plant centre
    case 2                                      % Water plant 2 
        rail_extra_offset = 0;
        Move_rail(0.5, 1); 
        Set_EE_State_2(x_water,0,z_water,dobot);
    case 3                                      % Water plant 3 
        rail_extra_offset = -rail_offset;
        Move_rail(1 - rail_offset, 1); 
        Set_EE_State_2(x_water,-rail_offset,z_water,dobot);
end

%% Plant rotation component
increm_angle = 30;                              % Angle increment for circle
max_angle = 360;                                % Revolutions 1 per 360 degs

for theta = 0:increm_angle:max_angle            % In degrees increment
    x2 = -r*cos(deg2rad(theta)) + x_water;     % Next x,y coordinate circum inside pot
    y2 = -r*sin(deg2rad(theta)) + rail_extra_offset;
    
    if theta == 0
        Set_EE_State_2(x2,y2,z_water, dobot);        % If first iteration, want animation slow
        pause(0.1);     % place holder pause
    else                                        % 2nd ++ iteration fast animations using less delay in dobot_move
        Set_EE_State_2(x2,y2,z_water,dobot);     % 0,-0.2,0.25      0,-0.165,0.25       r = 0.015
        disp(x2)
        disp(y2)
        disp(z_water)
    end
end
Set_EE_State_2(0.2,0,0.1,dobot); % default pose

end