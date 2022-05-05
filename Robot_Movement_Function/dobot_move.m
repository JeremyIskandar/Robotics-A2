function [] = dobot_move(x,y,z, pos_db)     %Input x,y,z EE desired position and previous or joint angle at current location (pos_db)

    dobot = myDobotRail;        % calls myDobot class which initialises and plots dobot model
    q0 = pos_db;          %Get the joint angles at the current position
    tr1 = transl(x,y,z);        %Define the next end-effector pose
    qr1 = dobot.model.ikcon(tr1,q0);       %Solve the inverse kinematics to get the required joint angles ~include q0
    
    steps = 50;
    
    qMatrix_1 = jtraj(q0,qr1,steps);    %move from default to pos1
    
    for i = 1:steps
        dobot.model.animate(qMatrix_1(i,:));
        dobot.model.fkine(qMatrix_1(i,:));  %
        drawnow();
        pause(0.001);
    end

end



