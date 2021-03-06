%% Dobot REAL 
% Main code for real dobot
function [] = Real_Dobot_Main()

%% If using the UTS Pi, please check the IP address
%rosinit('192.168.0.253');

%% Use this if the driver is on your Linux laptop
rosinit;

%% Call 'rosnode list' to check whether the /dobot_magician/dobot_magician_node exists. If not, ensure

%% Get current safety status
Safety_status = Current_Safety_Status();
disp(Safety_status);
%% Set initialise Dobot
Set_Initialise_Dobot();

%% Get current joint state / EE pose
% joint state
jointStateSubscriber = rossubscriber('/dobot_magician/joint_states'); % Create a ROS Subscriber to the topic joint_states
%pause(2); % Allow some time for a message to appear
% currentJointState = jointStateSubscriber.LatestMessage.Position % Get the latest message

% EE pose
endEffectorPoseSubscriber = rossubscriber('/dobot_magician/end_effector_poses'); % Create a ROS Subscriber to the topic end_effector_poses
pause(2); %Allow some time for MATLAB to start the subscriber
currentEndEffectorPoseMsg = endEffectorPoseSubscriber.LatestMessage;
% Extract the position of the end effector from the received message
currentEndEffectorPosition = [currentEndEffectorPoseMsg.Pose.Position.X,
                              currentEndEffectorPoseMsg.Pose.Position.Y,
                              currentEndEffectorPoseMsg.Pose.Position.Z];
pause(2);
% Extract the orientation of the end effector
currentEndEffectorQuat = [currentEndEffectorPoseMsg.Pose.Orientation.W,
                          currentEndEffectorPoseMsg.Pose.Orientation.X,
                          currentEndEffectorPoseMsg.Pose.Orientation.Y,
                          currentEndEffectorPoseMsg.Pose.Orientation.Z];
disp(currentEndEffectorPosition);
% disp(currentEndEffectorQuat);
% Convert from quaternion to euler
%[roll,pitch,yaw] = quat2eul(currentEndEffectorQuat);

%% Set target joint state
% default q1, q2, q3, q4 = 0, 0.4, 0.3, 0
Set_Joint_State(0,0.4,0.3,0);
%% Set target EE state
% default x,y,z = 0.2, 0, 0.1 
Set_EE_State(0.2,0,0.1);
%% Set tool state
[toolStatePub, toolStateMsg] = rospublisher('/dobot_magician/target_tool_state');
toolStateMsg.Data = 0; % Send 1 for on and 0 for off 
send(toolStatePub,toolStateMsg);

%% Initialize linear rail
[railStatusPublisher, railStatusMsg] = rospublisher('/dobot_magician/target_rail_status');
railStatusMsg.Data = true;
send(railStatusPublisher,railStatusMsg);

%% Move rail position
position = -0.25  % Move to the position of 0.5
[railPosPub,railPosMsg] = rospublisher('/dobot_magician/target_rail_position');
railPosMsg.Data = position;
send(railPosPub,railPosMsg);

%% Publish custom end effector pose
end_effector_position = [0.2,-0.1,0.1];
end_effector_rotation = [0,0,0];
dobot.PublishEndEffectorPose(end_effector_position,end_effector_rotation);

%% Publish custom end effector pose
end_effector_position = [0.2,0.01,0.11];
end_effector_rotation = [0,0,0];
dobot.PublishEndEffectorPose(end_effector_position,end_effector_rotation);

%% Publish custom end effector pose
end_effector_position = [0.2,0.02,0.12];
end_effector_rotation = [0,0,0];
dobot.PublishEndEffectorPose(end_effector_position,end_effector_rotation);

%% Publish custom end effector pose
end_effector_position = [0.2,0.03,0.13];
end_effector_rotation = [0,0,0];
dobot.PublishEndEffectorPose(end_effector_position,end_effector_rotation);

%% Publish custom end effector pose
end_effector_position = [0.20,0.219,0.05];
end_effector_rotation = [0,0,0];
dobot.PublishEndEffectorPose(end_effector_position,end_effector_rotation);

end
