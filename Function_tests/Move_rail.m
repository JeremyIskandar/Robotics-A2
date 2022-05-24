function [] = Move_rail(position, initialisation) % pos = 0 -> 0.5 -> 0.9      if 0 will initialize use zero for first use

if initialisation == 0  % Initialize if 0 else move rail
    [railStatusPublisher, railStatusMsg] = rospublisher('/dobot_magician/target_rail_status');
    railStatusMsg.Data = true;
    send(railStatusPublisher,railStatusMsg);
    pause(2);
    disp('Initialisation complete')
else
    disp('Initialisation already done... moving rail')% Do nothing
end
[railPosPub,railPosMsg] = rospublisher('/dobot_magician/target_rail_position');
railPosMsg.Data = position;     % moves dobot to position
send(railPosPub,railPosMsg);
pause(1.5);
disp('Rail movement complete')
end