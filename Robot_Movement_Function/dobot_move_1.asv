function [] = dobot_move_1(x,y,z, dobot, step_option)

    % This function inputs x,y,z EE desired position and previous or joint angle at current location (pos_db)

    %dobot = myDobotRail();             % Calls myDobot class which initialises and plots dobot model (don't want to call it again every time!)

    q0 = dobot.model.getpos();          % Get the joint angles at the current position
    tr1 = transl(x,y,z);                % Define the next end-effector pose
    qr1 = dobot.model.ikcon(tr1,q0);    % Solve the inverse kinematics to get the required joint angles ~include q0
    
    
    if ~exist('step_option', 'var')     % Check if step_option exists
        step_option = 0;                % If NOT exist place holder 0
        steps = 50;                     % Default steps 50 for long movements we dont mind slow animation
    elseif step_option == 1
        steps = 10;                     % If it does exist and is 1, steps will be less for watering plants (small circle increments)
    else
        steps = 50;                     % 50 steps else all fails
    end

    qMatrix_1 = jtraj(q0,qr1,steps);    % Move from default to pos1
    
    for i = 1:steps
%         if(estop pressed)             % Pseudo code for stop button
%             while pressed
%                 wait
        dobot.model.animate(qMatrix_1(i,:));
        dobot.model.fkine(qMatrix_1(i,:));
        drawnow();
    end
end