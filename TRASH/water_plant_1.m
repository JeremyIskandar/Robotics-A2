function [] = water_plant_1(dobot)     % Stacked dobot_move() functions for DOF testing purposes   
    r = 0.015;      %radius of pot     
%     x1 = -0.165;    %Initial x,y coordinate centre of pot
%     y1 = 0;
  
    %% Plant 3 front right
    x_offset = 0.5;
    y_offset = -0.2;
    dobot_move(x_offset,y_offset,0.25, dobot.model.getpos());
    increm_angle = 40;      %angle increment for circle
    max_angle = 360;        %Revolutions 1 per 360 degs
    for theta = 0:increm_angle:max_angle    %in degrees increment
        x2 = -r*cos(deg2rad(theta)) + x_offset;        %next x,y coordinate circum inside pot
        y2 = -r*sin(deg2rad(theta)) + y_offset;
        disp(theta)
        disp(x2)
        disp(y2)
        if theta == 0
            dobot_move(x2,y2,0.25, dobot.model.getpos());       %if first iteration want animation slow
        else                                                    %2nd ++ iteration fast animations using less steps in dobot_move
            dobot_move(x2,y2,0.25, dobot.model.getpos(), 1);      %0,-0.2,0.25      0,-0.165,0.25       r = 0.015
        end
    end


    %% Plant 5 left back
    x_offset = -0.25;
    y_offset = 0.2;
    dobot_move(x_offset,y_offset,0.25, dobot.model.getpos());
    increm_angle = 40;      %angle increment for circle
    max_angle = 360;        %Revolutions 1 per 360 degs
    for theta = 0:increm_angle:max_angle    %in degrees increment
        x2 = -r*cos(deg2rad(theta)) + x_offset;        %next x,y coordinate circum inside pot
        y2 = -r*sin(deg2rad(theta)) + y_offset;
        disp(theta)
        disp(x2)
        disp(y2)
        if theta == 0
            dobot_move(x2,y2,0.25, dobot.model.getpos());       %if first iteration want animation slow
        else                                                    %2nd ++ iteration fast animations using less steps in dobot_move
            dobot_move(x2,y2,0.25, dobot.model.getpos(), 1);      %0,-0.2,0.25      0,-0.165,0.25       r = 0.015
        end
    end

    %% Plant 2 front left
    x_offset = -0.5;
    y_offset = -0.2;
    dobot_move(x_offset,y_offset,0.25, dobot.model.getpos());
    increm_angle = 40;      %angle increment for circle
    max_angle = 360;        %Revolutions 1 per 360 degs
    for theta = 0:increm_angle:max_angle    %in degrees increment
        x2 = -r*cos(deg2rad(theta)) + x_offset;        %next x,y coordinate circum inside pot
        y2 = -r*sin(deg2rad(theta)) + y_offset;
        disp(theta)
        disp(x2)
        disp(y2)
        if theta == 0
            dobot_move(x2,y2,0.25, dobot.model.getpos());       %if first iteration want animation slow
        else                                                    %2nd ++ iteration fast animations using less steps in dobot_move
            dobot_move(x2,y2,0.25, dobot.model.getpos(), 1);      %0,-0.2,0.25      0,-0.165,0.25       r = 0.015
        end
    end

   
  %% Plant 4 right back
    x_offset = 0.25;
    y_offset = 0.2;
    dobot_move(x_offset,y_offset,0.25, dobot.model.getpos());
    increm_angle = 40;      %angle increment for circle
    max_angle = 360;        %Revolutions 1 per 360 degs
    for theta = 0:increm_angle:max_angle    %in degrees increment
        x2 = -r*cos(deg2rad(theta)) + x_offset;        %next x,y coordinate circum inside pot
        y2 = -r*sin(deg2rad(theta)) + y_offset;
        disp(theta)
        disp(x2)
        disp(y2)
        if theta == 0
            dobot_move(x2,y2,0.25, dobot.model.getpos());       %if first iteration want animation slow
        else                                                    %2nd ++ iteration fast animations using less steps in dobot_move
            dobot_move(x2,y2,0.25, dobot.model.getpos(), 1);      %0,-0.2,0.25      0,-0.165,0.25       r = 0.015
        end
    end
%% Plant 1 centre
    x_offset = 0;           %offset change x
    y_offset = -0.2;        %offset change y
    dobot_move(x_offset,y_offset,0.25, dobot.model.getpos());
    increm_angle = 40;      %angle increment for circle
    max_angle = 360;        %Revolutions 1 per 360 degs
    for theta = 0:increm_angle:max_angle    %in degrees increment
        x2 = -r*cos(deg2rad(theta)) + x_offset;        %next x,y coordinate circum inside pot
        y2 = -r*sin(deg2rad(theta)) + y_offset;
        disp(theta)
        disp(x2)
        disp(y2)
        if theta == 0
            dobot_move(x2,y2,0.25, dobot.model.getpos());       %if first iteration want animation slow
        else                                                    %2nd ++ iteration fast animations using less steps in dobot_move
            dobot_move(x2,y2,0.25, dobot.model.getpos(), 1);      %0,-0.2,0.25      0,-0.165,0.25       r = 0.015
        end
    end



%     dobot_move(0,-0.2,0.12, dobot.model.getpos()); %R 0.5m q0 elbow bent
%     dobot_move(0.726,0.226,0.204, dobot.model.getpos());%R 0.5m q1 elbow extended
%     dobot_move(0.422,0.078,0.185, dobot.model.getpos()); %L 0.5m q0 elbow bent
%     dobot_move(0.274,0.226,0.204, dobot.model.getpos()); %L 0.5m q1 elbow extended
%      
%     dobot_move(0.078,0.078,0.185, dobot.model.getpos()); %R 0m q0 elbow bent
%     dobot_move(0.226,0.226,0.204, dobot.model.getpos()); %R 0m q1 elbow extended
%     dobot_move(-0.078,0.078,0.185, dobot.model.getpos()); %L 0m q0 elbow bent
%     dobot_move(-0.226,0.226,0.204, dobot.model.getpos()); %L 0m q1 elbow extended
    
    

end