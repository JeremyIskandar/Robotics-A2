function [] = dobot_move_2()     % Stacked dobot_move() functions for DOF testing purposes

    dobot = myDobotRail();
    
    tester = [-0.5000   -0.1693    0.9267    1.7267    0.4882    1.4835];

    dobot_move(0.578,0.078,0.185, tester); %R 0.5m q0 elbow bent
    dobot_move(0.726,0.226,0.204, dobot.model.getpos());%R 0.5m q1 elbow extended
    
    dobot_move(-0.582,-0.239,0.217, dobot.model.getpos()); % test
    

end
