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

%% Init rail and set default pose
Move_rail(0.5, 0); % 0 for init since first use of rail centre pos
Set_EE_State_2(0.2,0,0.1); % default pose

%% Water plants 1 -> 3
for plant_switch = 1:1:3
    water_plant_real_REAL(plant_switch,dobot);
end
Move_rail(0.5, 0); % 0 for init since first use of rail centre pos
Set_EE_State_2(0.2,0,0.1); % default pose
%% test circle
water_plant_real_REAL(3,dobot);

%% Moisture sensor mode
moisture_sensor_REAL(dobot);

%% move ee
Set_EE_State_2(-0.0071,-0.3288,0.04,dobot);

%% test


%% Set tool state
[toolStatePub, toolStateMsg] = rospublisher('/dobot_magician/target_tool_state');
toolStateMsg.Data = 0; % Send 1 for on and 0 for off
send(toolStatePub,toolStateMsg);

%% Initialize linear rail
[railStatusPublisher, railStatusMsg] = rospublisher('/dobot_magician/target_rail_status');
railStatusMsg.Data = true;
send(railStatusPublisher,railStatusMsg);

%% Move rail position
position = 0.5; % Move to the position of 0.5
[railPosPub,railPosMsg] = rospublisher('/dobot_magician/target_rail_position');
railPosMsg.Data = position;
send(railPosPub,railPosMsg);

%% Publish custom end effector pose
end_effector_position = [0.2,0,0.1];  % default pos
end_effector_rotation = [0,0,0];
dobot.PublishEndEffectorPose(end_effector_position,end_effector_rotation);

%% ashdaj
Set_EE_State_2(0.2,0,0.1,dobot);
end