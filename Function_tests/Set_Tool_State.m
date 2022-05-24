function [] = Set_Tool_State(tool_state) % Set as 1 for on, 0 for off
[toolStatePub, toolStateMsg] = rospublisher('/dobot_magician/target_tool_state');
toolStateMsg.Data = tool_state; % Send 1 for on and 0 for off
send(toolStatePub,toolStateMsg);
pause(1.5);
disp('Tool state has been changed')
end
