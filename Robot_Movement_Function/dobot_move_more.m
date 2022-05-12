function [] = dobot_move_more()     % Stacked dobot_move() functions for DOF testing purposes

    dobot = myDobotRail();

    dobot_move(0.578,0.078,0.185, dobot.model.getpos()); %R 0.5m q0 elbow bent
    dobot_move(0.726,0.226,0.204, dobot.model.getpos());%R 0.5m q1 elbow extended
%     dobot_move(0.422,0.078,0.185, dobot.model.getpos()); %L 0.5m q0 elbow bent
%     dobot_move(0.274,0.226,0.204, dobot.model.getpos()); %L 0.5m q1 elbow extended
%      
%     dobot_move(0.078,0.078,0.185, dobot.model.getpos()); %R 0m q0 elbow bent
%     dobot_move(0.226,0.226,0.204, dobot.model.getpos()); %R 0m q1 elbow extended
%     dobot_move(-0.078,0.078,0.185, dobot.model.getpos()); %L 0m q0 elbow bent
    dobot_move(-0.226,0.226,0.204, dobot.model.getpos()); %L 0m q1 elbow extended
    
    %%%%%  This pose isnt working %%%%%%%%%%%%%%%%%%%%%%%%%%%
    % dobot_move(-0.422,0.078,0.185, dobot.model.getpos()); %R -0.5m q0 elbow bent
    % dobot_move(-0.274,0.226,0.204, dobot.model.getpos()); %R -0.5m q1 elbow extended
    % dobot_move(-0.578,0.078,0.185, dobot.model.getpos()); %L -0.5m q0 elbow bent
    % dobot_move(-0.726,0.226,0.204, dobot.model.getpos()); %L -0.5m q1 elbow extended
    
    dobot_move(-0.582,-0.239,0.217, dobot.model.getpos()); % test
end







    %pos 1: q0 start pos elbow bent ~ q1 elbow extended fully
    % right q0 = 0, 135, 70, 30, 80, 0 xyz= 0.078,0.078,0.185     
    % q1= 0, 135, 5, 170, 8, 0         xyz= 0.226,0.226,0.204
    
    % left q0 = 0, -135, 70, 30, 80, 0 xyz= -0.078,0.078,0.185
    % q1= 0, -135, 5, 170, 8, 0        xyz= -0.226,0.226,0.204
    
    %pos 2: -0.5
    % right q0 = -0.5, 135, 70, 30, 80, 0 xyz= -0.422,0.078,0.185
    % q1= -0.5, 135, 5, 170, 8, 0         xyz= -0.274,0.226,0.204
    
    %%%%%%%%%%%%%%%%%%%%%% Having trouble getting robot to go here: ###########
    % left q0 = -0.5, -135, 70, 30, 80, 0 xyz= -0.578,0.078,0.185
    % q1= -0.5, -135, 5, 170, 8, 0        xyz= -0.726,0.226,0.204
    
    %pos 3: 0.5m
    % right q0 = 0.5, 135, 70, 30, 80, 0 xyz= 0.578,0.078,0.185
    % q1= 0.5, 135, 5, 170, 8, 0         xyz= 0.726,0.226,0.204
    
    % left q0 = 0.5, -135, 70, 30, 80, 0 xyz= 0.422,0.078,0.185
    % q1= 0.5, -135, 5, 170, 8, 0        xyz= 0.274,0.226,0.204