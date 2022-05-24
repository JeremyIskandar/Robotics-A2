function [] = Set_EE_State_2(x,y,z,dobot,step_option)   % Desired EE position x,y,z

if ~exist('step_option', 'var')     % Check if step_option exists
    step_option = 0;                % If NOT exist place holder 0
    delay = 1.5;                     % 2s delay for longer movements
elseif step_option == 1
    delay = 0.05;                     % 1s delay for short movements such as circle rotation segments
else
    delay = 1;                     % 2s delay else all fails
end

end_effector_position = [x,y,z];    
end_effector_rotation = [0,0,0];
dobot.PublishEndEffectorPose(end_effector_position,end_effector_rotation); 
pause(delay);
disp('EE state has been set')
end