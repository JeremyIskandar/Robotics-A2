function [] = water_plant_2(dobot, plant_switch)     % Stacked dobot_move() functions for DOF testing purposes   
    r = 0.015;      %radius of pot     
%     x1 = -0.165;    %Initial x,y coordinate centre of pot
%     y1 = 0;
    switch plant_switch   %switch case for watering different plants
        case 1         %water plant 1 front left
            x_offset = -0.5;
            y_offset = -0.2;
            dobot_move_1(0,-0.11,0.160, dobot);
        case 2         %water plant 2 left back
            x_offset = -0.25;
            y_offset = 0.2;
            dobot_move_1(0,0.11,0.160, dobot);
        case 3         %water plant 3 front centre
            x_offset = 0;           %offset change x
            y_offset = -0.2;        %offset change y
            dobot_move_1(0,-0.11,0.160, dobot);
        case 4         %water plant 4 right back
            x_offset = 0.25;
            y_offset = 0.2;
            dobot_move_1(0,0.11,0.160, dobot);
        case 5         %water plant 5 front right
            x_offset = 0.5;
            y_offset = -0.2;
            dobot_move_1(0,-0.11,0.160, dobot);
     end
%% Plant move and rotation
    dobot_move_1(x_offset,y_offset,0.25, dobot);
    increm_angle = 40;      %angle increment for circle
    max_angle = 360;        %Revolutions 1 per 360 degs
    for theta = 0:increm_angle:max_angle    %in degrees increment
        x2 = -r*cos(deg2rad(theta)) + x_offset;        %next x,y coordinate circum inside pot
        y2 = -r*sin(deg2rad(theta)) + y_offset;
        disp(theta)
        disp(x2)
        disp(y2)
        if theta == 0
            dobot_move_1(x2,y2,0.25, dobot);       %if first iteration want animation slow
        else                                                    %2nd ++ iteration fast animations using less steps in dobot_move
            dobot_move_1(x2,y2,0.25, dobot, 1);      %0,-0.2,0.25      0,-0.165,0.25       r = 0.015
        end
    end
    dobot_move_1(0,0.11,0.165, dobot);
end