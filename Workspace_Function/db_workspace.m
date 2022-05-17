function [] = db_workspace(steps_deg, steps_rail)

    % This function inputs steps in degrees and steps in m for linear rail (check steps below)
    
    dobot = myDobotRail;
    stepRads = deg2rad(steps_deg);      % 30 pref
    steps = steps_rail;                 % For q1 linear joint lims: Try: 0.5m (min)  0.25 (max)
    %qlim = [-0.5 0.5; deg2rad([-135 135]); deg2rad([5 80]); deg2rad([15 170]); deg2rad([-90 90]); deg2rad([-85 85]);];
    qlim = dobot.model.qlim;
    
    
    pointCloudeSize = prod(floor((qlim(1:5,2)-qlim(1:5,1))/stepRads + 1));
    pointCloud = zeros(pointCloudeSize,3);
    counter = 1;
    tic
    
    % Nested for loop that goes through each joint limit depending on the steps:
    for q1 = qlim(1,1):steps:qlim(1,2)
        for q2 = qlim(2,1):stepRads:qlim(2,2)       % Workspace for linear rail
            for q3 = qlim(3,1):stepRads:qlim(3,2)
                for q4 = qlim(4,1):stepRads:qlim(4,2)
                    for q5 = qlim(5,1):stepRads:qlim(5,2)
                        q6 = 0;
                            q = [q1,q2,q3,q4,q5,q6];
                            tr = dobot.model.fkine(q);                        
                            pointCloud(counter,:) = tr(1:3,4)';
                            counter = counter + 1; 
                            if mod(counter/pointCloudeSize * 100,1) == 0                % Keep track of progress
                                display(['After ',num2str(toc),' seconds, completed ',num2str(counter/pointCloudeSize * 100),'% of poses']);
                            end
                    end
                end
            end
        end
    end

    plot3(pointCloud(:,1),pointCloud(:,2),pointCloud(:,3),'r.');    % 3D plot for point cloud
end