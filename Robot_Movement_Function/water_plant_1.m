function [] = water_plant_1()     % Stacked dobot_move() functions for DOF testing purposes
    
    %make switch case function

%     dobot = myDobotRail;
    
    r = 0.015;      %radius of pot      

%     x1 = -0.165;    %Initial x,y coordinate centre of pot
%     y1 = 0;
    dobot_move(0,-0.2,0.25, dobot.model.getpos());
    for theta = 0:30:360    %in degrees increment
        x2 = -r*cos(deg2rad(theta));        %next x,y coordinate circum inside pot
        y2 = -r*sin(deg2rad(theta)) - 0.2;
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