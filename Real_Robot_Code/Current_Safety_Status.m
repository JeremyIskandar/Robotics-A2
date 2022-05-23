function [currentSafetyStatus] = Current_Safety_Status()

    safetyStatusSubscriber = rossubscriber('/dobot_magician/safety_status');
    pause(2); %Allow some time for MATLAB to start the subscriber
    currentSafetyStatus = safetyStatusSubscriber.LatestMessage.Data;

end