% This function stacks dobot_move() functions for DOF testing purposes

myEnv;                                          % Calls myEnv function which plots all objects in environment
dobot = myDobotRail();                          % Calls myDobot class which initialises and plots dobot model

input('--> Please press enter to continue with demo after 2 seconds')
pause(2)

r = 0.015;                                      % Radius of pot     
%x1 = -0.165;                                   % Initial x,y coordinate centre of pot
%y1 = 0;

myLightCurtain;                                 % Calls myLightCurtain script which plots light curtain between fence opening in environment
lc_flag = 0;                        % Set flag to 0 because no objects have been detected by light curtain
box_starting_pos = -2.5;                        % Starting y-position of the baby

%% Water plant 1 front left
x_offset = -0.5;
y_offset = -0.2;
lc_flag = dobot_move_lc(0,-0.11,0.160, dobot, box_starting_pos, light_curtain_points, lc_flag);

% Plant move/rotation
lc_flag = dobot_move_lc(x_offset,y_offset,0.25, dobot, box_starting_pos, light_curtain_points, lc_flag);
increm_angle = 40;                              % Angle increment for circle
max_angle = 360;                                % Revolutions 1 per 360 degs

for theta = 0:increm_angle:max_angle            % In degrees increment
    x2 = -r*cos(deg2rad(theta)) + x_offset;     % Next x,y coordinate circum inside pot
    y2 = -r*sin(deg2rad(theta)) + y_offset;
        
    if theta == 0
        lc_flag = dobot_move_lc(x2,y2,0.25, dobot, box_starting_pos, light_curtain_points, lc_flag);        % If first iteration, want animation slow
    else                                        % 2nd ++ iteration fast animations using less steps in dobot_move
        lc_flag = dobot_move_lc(x2,y2,0.25, dobot, box_starting_pos, light_curtain_points, lc_flag, 1);     % 0,-0.2,0.25      0,-0.165,0.25       r = 0.015
    end
end
    
alert = ['Plant 1 has been watered!'];
disp(alert);
lc_flag = dobot_move_lc(0,0.11,0.165, dobot, box_starting_pos, light_curtain_points, lc_flag);

%% Water plant 2 left back
x_offset = -0.25;
y_offset = 0.2;
lc_flag = dobot_move_lc(0,0.11,0.160, dobot, box_starting_pos, light_curtain_points, lc_flag);

% Plant move/rotation
lc_flag = dobot_move_lc(x_offset,y_offset,0.25, dobot, box_starting_pos, light_curtain_points, lc_flag);
increm_angle = 40;                              % Angle increment for circle
max_angle = 360;                                % Revolutions 1 per 360 degs

for theta = 0:increm_angle:max_angle            % In degrees increment
    x2 = -r*cos(deg2rad(theta)) + x_offset;     % Next x,y coordinate circum inside pot
    y2 = -r*sin(deg2rad(theta)) + y_offset;
        
    if theta == 0
        lc_flag = dobot_move_lc(x2,y2,0.25, dobot, box_starting_pos, light_curtain_points, lc_flag);        % If first iteration, want animation slow
    else                                        % 2nd ++ iteration fast animations using less steps in dobot_move
        lc_flag = dobot_move_lc(x2,y2,0.25, dobot, box_starting_pos, light_curtain_points, lc_flag, 1);     % 0,-0.2,0.25      0,-0.165,0.25       r = 0.015
    end
end
    
alert = ['Plant 2 has been watered!'];
disp(alert);
lc_flag = dobot_move_lc(0,0.11,0.165, dobot, box_starting_pos, light_curtain_points, lc_flag);

% %% Water plant 3 front centre
% x_offset = 0;                           % Offset change x
% y_offset = -0.2;                        % Offset change y
% lc_flag = dobot_move_lc(0,-0.11,0.160, dobot, box_starting_pos, light_curtain_points, lc_flag);
% 
% % Plant move/rotation
% lc_flag = dobot_move_lc(x_offset,y_offset,0.25, dobot, box_starting_pos, light_curtain_points, lc_flag);
% increm_angle = 40;                              % Angle increment for circle
% max_angle = 360;                                % Revolutions 1 per 360 degs
% 
% for theta = 0:increm_angle:max_angle            % In degrees increment
%     x2 = -r*cos(deg2rad(theta)) + x_offset;     % Next x,y coordinate circum inside pot
%     y2 = -r*sin(deg2rad(theta)) + y_offset;
%         
%     if theta == 0
%         lc_flag = dobot_move_lc(x2,y2,0.25, dobot, box_starting_pos, light_curtain_points, lc_flag);        % If first iteration, want animation slow
%     else                                        % 2nd ++ iteration fast animations using less steps in dobot_move
%         lc_flag = dobot_move_lc(x2,y2,0.25, dobot, box_starting_pos, light_curtain_points, lc_flag, 1);     % 0,-0.2,0.25      0,-0.165,0.25       r = 0.015
%     end
% end
%     
% alert = ['Plant 3 has been watered!'];
% disp(alert);
% lc_flag = dobot_move_lc(0,0.11,0.165, dobot, box_starting_pos, light_curtain_points, lc_flag);
% 
% %% Water plant 4 right back
% x_offset = 0.25;
% y_offset = 0.2;
% lc_flag = dobot_move_lc(0,0.11,0.160, dobot, box_starting_pos, light_curtain_points, lc_flag);
% 
% % Plant move/rotation
% lc_flag = dobot_move_lc(x_offset,y_offset,0.25, dobot, box_starting_pos, light_curtain_points, lc_flag);
% increm_angle = 40;                              % Angle increment for circle
% max_angle = 360;                                % Revolutions 1 per 360 degs
% 
% for theta = 0:increm_angle:max_angle            % In degrees increment
%     x2 = -r*cos(deg2rad(theta)) + x_offset;     % Next x,y coordinate circum inside pot
%     y2 = -r*sin(deg2rad(theta)) + y_offset;
%         
%     if theta == 0
%         lc_flag = dobot_move_lc(x2,y2,0.25, dobot, box_starting_pos, light_curtain_points, lc_flag);        % If first iteration, want animation slow
%     else                                        % 2nd ++ iteration fast animations using less steps in dobot_move
%         lc_flag = dobot_move_lc(x2,y2,0.25, dobot, box_starting_pos, light_curtain_points, lc_flag, 1);     % 0,-0.2,0.25      0,-0.165,0.25       r = 0.015
%     end
% end
%     
% alert = ['Plant 4 has been watered!'];
% disp(alert);
% lc_flag = dobot_move_lc(0,0.11,0.165, dobot, box_starting_pos, light_curtain_points, lc_flag);
% 
% %% Water plant 5 front right
% x_offset = 0.5;
% y_offset = -0.2;
% lc_flag = dobot_move_lc(0,-0.11,0.160, dobot, box_starting_pos, light_curtain_points, lc_flag);
% 
% % Plant move/rotation
% lc_flag = dobot_move_lc(x_offset,y_offset,0.25, dobot, box_starting_pos, light_curtain_points, lc_flag);
% increm_angle = 40;                              % Angle increment for circle
% max_angle = 360;                                % Revolutions 1 per 360 degs
% 
% for theta = 0:increm_angle:max_angle            % In degrees increment
%     x2 = -r*cos(deg2rad(theta)) + x_offset;     % Next x,y coordinate circum inside pot
%     y2 = -r*sin(deg2rad(theta)) + y_offset;
%         
%     if theta == 0
%         lc_flag = dobot_move_lc(x2,y2,0.25, dobot, box_starting_pos, light_curtain_points, lc_flag);        % If first iteration, want animation slow
%     else                                        % 2nd ++ iteration fast animations using less steps in dobot_move
%         lc_flag = dobot_move_lc(x2,y2,0.25, dobot, box_starting_pos, light_curtain_points, lc_flag, 1);     % 0,-0.2,0.25      0,-0.165,0.25       r = 0.015
%     end
% end
%     
% alert = ['Plant 5 has been watered!'];
% disp(alert);
% lc_flag = dobot_move_lc(0,0.11,0.165, dobot, box_starting_pos, light_curtain_points, lc_flag);