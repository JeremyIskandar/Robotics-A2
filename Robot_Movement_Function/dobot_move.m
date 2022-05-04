function [] = dobot_move(x,y,z)

    dobot = myDobotRail;        % calls myDobot class which initialises and plots dobot model
    q0 = dobot.model.getpos();          %Get the joint angles at the current position
    tr1 = transl(x,y,z);        %Define the next end-effector pose
    qr1 = dobot.model.ikcon(tr1);       %Solve the inverse kinematics to get the required joint angles
    
    steps = 50;
    
    qMatrix_1 = jtraj(q0,qr1,steps);    %move from default to pos1
    
    for i = 1:steps
        dobot.model.animate(qMatrix_1(i,:));
        dobot.model.fkine(qMatrix_1(i,:));  %
        drawnow();
        pause(0.001);
    end

end