classdef DoBotMove < handle
    properties
        dobot = myDobotRail;
    end
    methods
%         function move_1 = DoBotMove(x,y,z, dobot, step_option)
%             move_1.dobot_move_test(x,y,z, dobot, step_option)
%         end
%         function self = DoBotMove()
%             self.dobot_move_test(0.578,0.078,0.185, dobot)
%         end
        function test = dobot_move_test(x,y,z, dobot, step_option)     %Input x,y,z EE desired position and previous or joint angle at current location (pos_db) 

            q0 = dobot.model.getpos();          %Get the joint angles at the current position
            tr1 = transl(x,y,z);        %Define the next end-effector pose
            qr1 = dobot.model.ikcon(tr1,q0);       %Solve the inverse kinematics to get the required joint angles ~include q0

            if ~exist('step_option', 'var')     %check if step_option exists
                step_option = 0;        %if NOT exist place holder 0
                steps = 50;             %default steps 50 for long movements we dont mind slow animation
            elseif step_option == 1
                steps = 10;             %If it does exist and is 1, steps will be less for watering plants (small circle increments)
            else
                steps = 50;             %50 steps else all fails
            end
        
            qMatrix_1 = jtraj(q0,qr1,steps);    %move from default to pos1
            
            for i = 1:steps
        %         if(estop pressed)             %pseudo code for stop button
        %             while pressed
        %                 wait
                dobot.model.animate(qMatrix_1(i,:));
                dobot.model.fkine(qMatrix_1(i,:));  %
                drawnow();
            end
        
        end
    end
end
 